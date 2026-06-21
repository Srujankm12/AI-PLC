(*The Level controller has opened the intake
 The Temperature controller switched on the heater*)

SETDrain := ((NOT Intake) AND (NOT Heating));
RESETDrain := (Intake OR  Heating);
RSDrain(SET := SETDrain, RESET1 := RESETDrain, Q1 => Drain);
