import { Controller, Post, Body } from '@nestjs/common';
import { PlcService } from './plc.service';

@Controller('api/plc')
export class PlcController {
  constructor(private readonly plcService: PlcService) {}

  @Post('generate')
  async generate(@Body('prompt') prompt: string) {
    if (!prompt) {
      return { success: false, message: 'Prompt is required' };
    }
    return this.plcService.generateProject(prompt);
  }
}