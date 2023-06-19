MODULE SynthesisSubRoutineR
    PROC FullCycleRight() 
        VAR num JarNumFilledByS1_2 := 0;
        VAR num NumIf0CntfgIf1Filter := 0; 
        VAR num draft := 0;
        VAR num i := 0;
        VAR bool NotUsed;
        VAR bool DoINeedToClose:= False;
        VAR num dosCount :=0;   
        PippeteReady := FALSE;
        ZeroingVariables;
        ZeroingVariablesOfMov2_1;
        ZeroingVariablesForMOV2_3;
        
        WHILE JarNumFilledByS1_2<2 DO !For first mixture
            ZeroingVariables;
            ZeroingVariablesOfMov2_1;
            PickThenPlaceJar;
            JarInPlace := TRUE;
            WaitUntil Held_LeftHoldingJar = TRUE;
            HeldJar_OpenCover;
            WaitUntil JarOnBlackStation = TRUE;
            
            solutionVolume:=solution1Volume;
            pressAct:=TRUE;
            liquidHandling solutionVolume, pressAct;
            
            IF demo=FALSE then
            WaitUntil bottleChanged = TRUE;
            bottleChanged := FALSE;
            
            solutionVolume:=solution2volume;
            pressAct:=TRUE;
            liquidHandling solutionVolume, pressAct;

            ENDIF                
            PutCoverOnHeldJar;
            HeldJarTurnCover;
            JarClosed := TRUE;
            ShakeTimer;
            JarNumFilledByS1_2 := JarNumFilledByS1_2 + 1;
            IF JarNumFilledByS1_2=1 THEN
                WaitUntil doneWithFirstJat = TRUE;
            ENDIF
        ENDWHILE
        IF demo=FALSE then
            NumIf0CntfgIf1Filter:=0;
            i := 1;
        ELSE
            NumIf0CntfgIf1Filter:=1;
            i := 2;
        ENDIF
            
        while i<3 DO !For second solution and filtering
            WHILE NumIf0CntfgIf1Filter<2 DO
                waituntil DoneWithSecondJar = TRUE;
                ZeroingVariables;
                ZeroingVariablesOfMov2_1;
                WaitUntil Held_LeftHoldingJar = TRUE;
                HeldJar_OpenCover;
                WaitUntil JarOnBlackStation = TRUE;
                WaitUntil bottleChanged = TRUE;
                bottleChanged := FALSE;
                
                IF i = 1 THEN
                    solutionVolume:=solution1volume+solution2volume;
                ELSE 
                    solutionVolume:=solution3Volume;
                ENDIF
                pressAct:=FALSE;
                liquidHandling solutionVolume, pressAct;
                
                WaitUntil bottleChanged = TRUE;
                bottleChanged := FALSE;
                
                solutionVolume:=solution3volume;
                pressAct:=TRUE;
                liquidHandling solutionVolume, pressAct;
                
                PutCoverOnHeldJar;
                HeldJarTurnCover;
                JarClosed := TRUE;
                ShakeTimer;
                
                IF I=2 THEN
                    
                    Held_LeftHoldingJar := FALSE;
                    WaitUntil Held_LeftHoldingJar = TRUE;
                    removePlateAfterAnalysis filterNeedsRemoval;!We Stopped here i = 2 NumIf0CntfgIf1Filter = 0
                    HeldJar_OpenCover_2;
                    ZeroingVariablesForMOV2_3;
            
                    IF NumIf0CntfgIf1Filter = 1 THEN
                       DoINeedToClose:=TRUE; 
                    ENDIF
                    
                    membraneFiltration DoINeedToClose;
                    PlateAlreadyInCapinet := TRUE;  
                ENDIF
                NumIf0CntfgIf1Filter:=NumIf0CntfgIf1Filter+1;
            ENDWHILE
        NumIf0CntfgIf1Filter:=0;
        i:= i+1;
        endwhile
    ENDPROC
ENDMODULE