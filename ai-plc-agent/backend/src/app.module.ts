import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { PlcModule } from './plc/plc.module';

@Module({
  imports: [
    ConfigModule.forRoot({ isGlobal: true }),
    PlcModule,
  ],
})
export class AppModule {}