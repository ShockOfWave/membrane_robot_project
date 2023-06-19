MODULE MOV2R
    PROC MOV2_2()
        VAR num done := 0;
        VAR num draft := 0;
        !FindJarsBothArmsFunctioning;
        WHILE done<2 DO
            PippeteReady := FALSE;
            NozzelNumber := NozzelNumber + 1;
            ZeroingVariables;
            ZeroingVariablesOfMov2_1;
            PickThenPlaceJar;
            JarInPlace := TRUE;
            WaitUntil Held_LeftHoldingJar = TRUE;
            HeldJar_OpenCover;
            WaitUntil JarOnBlackStation = TRUE;
            PickPippete;
            
            MovForNozzle;
            FillInPippete;
            EmptyPippete;
            waittime 5; !must be changed back to 5
            
            PutCoverOnHeldJar;
            HeldJarTurnCover;
            JarClosed := TRUE;
            done := done + 1;
            
!            IF done=1 THEN
!                WaitUntil TakeFistImage=TRUE;
!                FindJars_RightArm;
!            ENDIF
            IF done=1 THEN
                WaitUntil DoneWithFirstJat = TRUE;
            ENDIF
        ENDWHILE
        
        WaitUntil TakeSecondImage=TRUE;
!        FindJars_RightArm;
    ENDPROC
    
    
    PROC MOV2_2_2()
        VAR num done := 0;
        VAR num draft := 0;
        VAR bool NotUsed;
        VAR bool DoINeedToClose:= False;
        !FindJarsBothArmsFunctioning;
        WHILE done<2 DO
            NozzelNumber := NozzelNumber + 1;
            ZeroingVariables;
            ZeroingVariablesOfMov2_1;
            PickThenPlaceJar;
            JarInPlace := TRUE;
            WaitUntil Held_LeftHoldingJar = TRUE;
            HeldJar_OpenCover;
           
            WaitUntil JarOnBlackStation = TRUE;
            PickPippete;
            MovForNozzle;
            FillInPippete;
            pressAct:=TRUE;
            MoveDispenser pressAct;
!            EmptyPippete;
            waittime 5; !must be changed back to 5

            PutCoverOnHeldJar;
            HeldJarTurnCover;
            JarClosed := TRUE;
            done := done + 1;
            
!            IF done=1 THEN
!                WaitUntil TakeFistImage=TRUE;
!                FindJars_RightArm;
!            ENDIF
            IF done=1 THEN
                WaitUntil DoneWithFirstJat = TRUE;
            ENDIF
        ENDWHILE
        WaitUntil TakeSecondImage=TRUE;
!        FindJars_RightArm;
        FOR i FROM 1 TO 2 do
            WaitUntil Held_LeftHoldingJar = TRUE;
            HeldJar_OpenCover_2;
            ZeroingVariablesForMOV2_3;
            
            IF I = 2 THEN
               DoINeedToClose:=TRUE; 
            ENDIF
            
            membraneFiltration DoINeedToClose;
            PlateAlreadyInCapinet := TRUE;
        ENDFOR

            
    ENDPROC
ENDMODULE