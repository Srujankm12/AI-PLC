import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { PlcModule } from './plc/plc.module';

@Module({
  imports: [PlcModule],
  controllers: [AppController],
})
export class AppModule {}
