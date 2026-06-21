(* Generate Text for the ContainerIntake *)
IF Intake THEN
    ContainerStatus := CONCAT('',' Intake: OPENED ');
ELSE
    ContainerStatus := CONCAT('',' Intake: CLOSED ');
END_IF

(* Generate Text for the ContainerHeater *)
IF Heater THEN
    ContainerStatus := CONCAT(ContainerStatus,' Heater: ON  ');
ELSE
    ContainerStatus := CONCAT(ContainerStatus,' Heater: OFF ');
END_IF

// Generate Text for the ContainerDrain
IF Drain THEN
    ContainerStatus := CONCAT(ContainerStatus,' Drain: OPENED ');
ELSE
    ContainerStatus := CONCAT(ContainerStatus,' Drain: CLOSED ');
END_IF

ContainerLevelText := TO_STRING(ContainerLevel,'{0}');
ContainerTemperatureText := TO_STRING(ContainerTemperature,'{0}');

ContainerValue := CONCAT('','Level: ');
ContainerValue := CONCAT(ContainerValue,ContainerLevelText);
ContainerValue := CONCAT(ContainerValue,' Liters');
ContainerValue := CONCAT(ContainerValue,' Temperature: ');
ContainerValue := CONCAT(ContainerValue,ContainerTemperatureText);
ContainerValue := CONCAT(ContainerValue,' Degrees Celsius');
