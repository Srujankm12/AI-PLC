import { Injectable } from '@nestjs/common';
import Anthropic from '@anthropic-ai/sdk';
import { spawn } from 'child_process';
import * as path from 'path';

@Injectable()
export class PlcService {
  private anthropic = new Anthropic({
    apiKey: process.env.ANTHROPIC_API_KEY,
  });

  async generateProject(prompt: string) {
    try {
      // Step 1: Call Claude API
      console.log('Calling Claude API...');
      const message = await this.anthropic.messages.create({
        model: 'claude-sonnet-4-6',
        max_tokens: 1000,
        system: `You are a PLCnext Engineer expert.
Convert natural language PLC descriptions to JSON.
Return ONLY valid JSON, no explanation, no markdown.
Format:
{
  "projectName": "PascalCase name no spaces",
  "tags": [
    {"name": "Start", "type": "BOOL", 
     "io": "INPUT", "address": "%I*"},
    {"name": "Stop", "type": "BOOL", 
     "io": "INPUT", "address": "%I*"},
    {"name": "Motor", "type": "BOOL", 
     "io": "OUTPUT", "address": "%Q*"}
  ],
  "rungs": [
    {
      "id": 1,
      "comment": "Motor seal-in circuit",
      "expression": "Start OR (Motor AND NOT(Stop))"
    }
  ]
}`,
        messages: [{ role: 'user', content: prompt }],
      });

      // Step 2: Extract JSON
      const responseText =
        message.content[0].type === 'text'
          ? message.content[0].text
          : '';

      console.log('Claude response:', responseText);

      const jsonMatch = responseText.match(/\{[\s\S]*\}/);
      if (!jsonMatch) {
        return {
          success: false,
          message: 'Claude did not return valid JSON',
        };
      }

      const ast = JSON.parse(jsonMatch[0]);
      console.log('AST:', JSON.stringify(ast, null, 2));

      // Step 3: Call Python agent
      const pythonPath = path.resolve(
        __dirname,
        process.env.PYTHON_AGENT_PATH || '../../../agent/builder.py',
      );

      console.log('Calling Python agent:', pythonPath);
      const result = await this.runPython(
        pythonPath,
        JSON.stringify(ast),
      );

      return result;

    } catch (error) {
      console.error('Error:', error);
      return {
        success: false,
        message: `Error: ${error.message}`,
      };
    }
  }

  private runPython(
    scriptPath: string,
    astJson: string,
  ): Promise<any> {
    return new Promise((resolve) => {
      const python = spawn('python', [scriptPath, astJson]);

      let stdout = '';
      let stderr = '';

      python.stdout.on('data', (data) => {
        stdout += data.toString();
        console.log('Python stdout:', data.toString());
      });

      python.stderr.on('data', (data) => {
        stderr += data.toString();
        console.error('Python stderr:', data.toString());
      });

      python.on('close', (code) => {
        console.log('Python exit code:', code);

        if (stdout.includes('SUCCESS:')) {
          const pcwexPath = stdout
            .split('SUCCESS:')[1]
            .trim();
          resolve({
            success: true,
            message: 'PLCnext Engineer opened!',
            pcwexPath,
          });
        } else {
          const errorMsg = stdout.includes('ERROR:')
            ? stdout.split('ERROR:')[1].trim()
            : stderr || 'Python agent failed';
          resolve({
            success: false,
            message: errorMsg,
          });
        }
      });

      // 60 second timeout
      setTimeout(() => {
        python.kill();
        resolve({
          success: false,
          message: 'Timeout: Python agent took too long',
        });
      }, 60000);
    });
  }
}