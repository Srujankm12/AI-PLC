import {
  Body, Controller, Post, Get, Query,
  HttpException, HttpStatus, Res,
} from '@nestjs/common';
import { Response } from 'express';
import * as path from 'path';
import * as fs from 'fs';
import { PlcService } from './plc.service';

interface GenerateDto {
  prompt: string;
}

// Resolved once — agent/generated/ sits next to the backend folder
const GENERATED_DIR = path.resolve(__dirname, '../../../agent/generated');

@Controller('plc')
export class PlcController {
  constructor(private readonly plcService: PlcService) {}

  @Post('generate')
  async generate(@Body() body: GenerateDto) {
    const { prompt } = body;
    if (!prompt || typeof prompt !== 'string' || prompt.trim().length === 0) {
      throw new HttpException('prompt is required', HttpStatus.BAD_REQUEST);
    }

    const result = await this.plcService.generate(prompt.trim()) as any;
    // Never expose the server-side absolute path to the client
    const { pcwexPath: _drop, ...publicResult } = result;
    return publicResult;
  }

  @Get('download')
  download(@Query('file') file: string, @Res() res: Response) {
    if (!file || file.includes('..') || file.includes('/') || !file.endsWith('.pcwex')) {
      throw new HttpException('Invalid file name', HttpStatus.BAD_REQUEST);
    }

    const filePath = path.join(GENERATED_DIR, file);
    if (!fs.existsSync(filePath)) {
      throw new HttpException('File not found', HttpStatus.NOT_FOUND);
    }

    const stat = fs.statSync(filePath);
    // Use a vendor MIME type Chrome doesn't map to ZIP — prevents .zip rename
    res.setHeader('Content-Type', 'application/x-pcwex');
    res.setHeader('Content-Disposition', `attachment; filename="${file}"`);
    res.setHeader('Content-Length', stat.size);
    fs.createReadStream(filePath).pipe(res);
  }
}
