import { Body, Controller, Post, HttpException, HttpStatus } from '@nestjs/common';
import { PlcService } from './plc.service';

interface GenerateDto {
  prompt: string;
}

@Controller('plc')
export class PlcController {
  constructor(private readonly plcService: PlcService) {}

  @Post('generate')
  async generate(@Body() body: GenerateDto) {
    const { prompt } = body;

    if (!prompt || typeof prompt !== 'string' || prompt.trim().length === 0) {
      throw new HttpException('prompt is required', HttpStatus.BAD_REQUEST);
    }

    return this.plcService.generate(prompt.trim());
  }
}
