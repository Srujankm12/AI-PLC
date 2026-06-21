IF Toggle THEN
    FOR Index := 0 to 14 DO
        NextIndex := Index + 1;
        ContainerTrends[Index].Level := ContainerTrends[NextIndex].Level;
        ContainerTrends[Index].Temp := ContainerTrends[NextIndex].Temp;
    END_FOR
    ContainerTrends[15].Level := ContainerLevel;
    ContainerTrends[15].Temp := ContainerTemperature;
END_IF

Toggle := NOT(Toggle);
