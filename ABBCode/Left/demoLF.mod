MODULE demoLF
    
    PROC demonLeft()
        VAR num JarNumFilledByS1_2 := 0;
        VAR num NumIf0CntfgIf1Filter := 0; 
        VAR num draft := 0;
        VAR num draft2 := 0;
        VAR num draft3 := 0;
        VAR num dosCount:=0;
        VAR num jj := 1;
        VAR num i := 0;
        VAR Bool IsItLoaded := FALSE;
        VAR bool NotUsed;
        VAR bool DoINeedToOpen:= TRUE;
        
        g_Init \maxSpd := 25, \holdForce := 10;
        MoveJ MainMidPoint,Travel,z1,GripperLeft;
        !FindJarsBothArmsFunctioning;
        JarNumFilledByS1_2 := 0;
        ZeroingVariables;
        ZeroingVariablesForMOV2_3;
            ZeroingVariables;
            !WaitUntil JarInPlace = TRUE;
            HoldJarInOrange;
            MoveL AboveJar, Normal, z1, GripperLeft;        
            MoveJ Mid_4, Travel, z1, GripperLeft;
            MoveJ demonL1, Travel, z1, GripperLeft;
            MoveJ demonL2, Travel, z1, GripperLeft;
            WHILE reg1 <> 4 DO
                TPErase;
                TPReadFK reg1, "Proceed?", stEmpty, stEmpty, stEmpty, "Yes", "No";
            ENDWHILE
            reg1:=0;
            g_GripOut;
            waittime 2;
            MoveJ demonL1, Travel, z1, GripperLeft;
            MoveJ MainMidPoint,Travel,z1,GripperLeft;
    ENDPROC
    
ENDMODULE