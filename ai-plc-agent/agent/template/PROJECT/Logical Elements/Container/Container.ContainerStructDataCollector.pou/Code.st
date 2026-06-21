/*
    index 0 is oldest, index 2 is latest cycle
*/   
FOR Index := 0 TO 1 DO
   ContainerStates[Index].Drain             := ContainerStates[Index + 1].Drain; 
   ContainerStates[Index].Heater            := ContainerStates[Index + 1].Heater; 
   ContainerStates[Index].Intake            := ContainerStates[Index + 1].Intake; 
   ContainerStates[Index].Level             := ContainerStates[Index + 1].Level; 
   ContainerStates[Index].Temp              := ContainerStates[Index + 1].Temp; 
   ContainerStates[Index].StateOfContainer  := ContainerStates[Index + 1].StateOfContainer; 
   ContainerStates[Index].ValuesOfContainer := ContainerStates[Index + 1].ValuesOfContainer; 
END_FOR
ContainerStates[2].Drain             := Drain; 
ContainerStates[2].Heater            := Heater; 
ContainerStates[2].Intake            := Intake; 
ContainerStates[2].Level             := ContainerLevel; 
ContainerStates[2].Temp              := ContainerTemperature; 
ContainerStates[2].StateOfContainer  := ContainerStatus; 
ContainerStates[2].ValuesOfContainer := ContainerValue; 
