IF ((ContainerLevel < MinimumLevel) & not StartUp) THEN
    ContainerLevelMonitoring := ContainerStarting;
END_IF

IF (ContainerLevel > MinimumLevel) THEN
    StartUP := TRUE;
END_IF

IF (ContainerStates[0].Level <= ContainerStates[1].Level) & StartUP Then
    ContainerLevelMonitoring := FluidRising;
END_IF

IF (ContainerStates[0].Level > ContainerStates[1].Level) & StartUP Then
    ContainerLevelMonitoring := FluidFalling;
END_IF
