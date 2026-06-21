XYRange := INT_TO_REAL(RobotRange);
ZRange := INT_TO_REAL(AddArm);
 
RobotX := REAL_TO_INT(SIN(CycleCountX + 0.3) * XYRange);
RobotY := REAL_TO_INT(COS(CycleCountY - 0.2) * XYRange);
RobotZ := REAL_TO_INT(SIN(CycleCountZ + 0.7) * ZRange);

CycleCountX := CycleCountX + 0.041; 
CycleCountY := CycleCountY + 0.025;
CycleCountZ := CycleCountZ + 0.098;

//This structure is used for the HMI Generator
RobotAxis.RX := RobotX; 
RobotAxis.RY := RobotY;
RobotAxis.RZ := RobotZ;