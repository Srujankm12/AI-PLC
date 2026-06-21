import { Injectable, InternalServerErrorException } from '@nestjs/common';
import Anthropic from '@anthropic-ai/sdk';
import { execSync } from 'child_process';
import * as path from 'path';
import * as fs from 'fs';

const SYSTEM_PROMPT = `You are a PLCnext Engineer expert.
Convert ANY natural language PLC description to a JSON AST.

Rules:
1. Return ONLY valid JSON — no explanation, no markdown, no code fences
2. Handle ANY ladder logic type:
   - Simple contacts and coils
   - AND / OR / NOT logic
   - Seal-in / latch circuits
   - Multiple rungs
   - Timer (TON / TOF) logic
   - Counter (CTU / CTD) logic
   - Set / Reset coils
   - Safety / Emergency circuits
3. Tag naming: use descriptive names extracted from the prompt
4. If an address is not specified, auto-assign:
     Inputs:   I0.0, I0.1, I0.2 … (%I*)
     Outputs:  Q0.0, Q0.1, Q0.2 … (%Q*)
     Internal: M0.0, M0.1, M0.2 … (%M*)
5. projectName must be PascalCase and describe the logic
6. For complex logic, generate multiple rungs
7. expression field must use IEC 61131-3 syntax: AND, OR, NOT(), parentheses

Return this exact JSON shape — nothing else:
{
  "projectName": "PascalCaseName",
  "tags": [
    {
      "name": "TagName",
      "type": "BOOL|INT|REAL|WORD|TON|CTU",
      "io": "INPUT|OUTPUT|INTERNAL",
      "address": "%I*|%Q*|%M*"
    }
  ],
  "rungs": [
    {
      "id": 1,
      "comment": "what this rung does",
      "expression": "IEC 61131-3 expression",
      "output": "output tag name",
      "type": "coil|set|reset|ton|ctu"
    }
  ]
}`;

@Injectable()
export class PlcService {
  private readonly client: Anthropic;

  constructor() {
    const apiKey = process.env.ANTHROPIC_API_KEY;
    if (!apiKey || apiKey === 'your_anthropic_api_key_here') {
      console.warn('WARNING: ANTHROPIC_API_KEY is not set in .env');
    }
    this.client = new Anthropic({ apiKey });
  }

  async generate(prompt: string): Promise<object> {
    let raw: string;

    try {
      const message = await this.client.messages.create({
        model: 'claude-opus-4-8',
        max_tokens: 2048,
        system: SYSTEM_PROMPT,
        messages: [{ role: 'user', content: prompt }],
      });

      const block = message.content[0];
      if (block.type !== 'text') {
        throw new Error('Unexpected response type from Claude API');
      }
      raw = block.text.trim();
    } catch (err: any) {
      throw new InternalServerErrorException(
        `Claude API error: ${err?.message ?? 'unknown error'}`,
      );
    }

    // Strip markdown code fences if Claude added them despite instructions
    const cleaned = raw
      .replace(/^```(?:json)?\s*/i, '')
      .replace(/\s*```$/, '')
      .trim();

    let ast: object;
    try {
      ast = JSON.parse(cleaned);
    } catch {
      throw new InternalServerErrorException(
        'Claude returned non-JSON output. Raw: ' + cleaned.slice(0, 200),
      );
    }

    // ── Run Python agent to build .pcwex ─────────────────────────────────────
    const builderPath = path.resolve(__dirname, '../../../../agent/builder.py');
    const astJson = JSON.stringify(ast).replace(/'/g, "\\'");

    let pcwexPath: string;
    try {
      const stdout = execSync(`python3 "${builderPath}" '${astJson}'`, {
        encoding: 'utf-8',
        timeout: 60_000,
      });
      console.log('[builder]', stdout.trim());

      const successLine = stdout.split('\n').find(l => l.startsWith('SUCCESS:'));
      if (!successLine) {
        const errorLine = stdout.split('\n').find(l => l.startsWith('ERROR:'));
        throw new Error(errorLine ?? 'builder.py produced no SUCCESS line');
      }
      pcwexPath = successLine.replace('SUCCESS:', '').trim();
    } catch (err: any) {
      throw new InternalServerErrorException(
        `Python agent error: ${err?.message ?? 'unknown'}`,
      );
    }

    if (!fs.existsSync(pcwexPath)) {
      throw new InternalServerErrorException(`Generated file not found: ${pcwexPath}`);
    }

    return {
      ast,
      fileName: path.basename(pcwexPath),
      pcwexPath,
    };
  }
}
