MODULE SynthesisSubRoutineL
     PROC FullCycleLeft() 
        VAR num JarNumFilledByS1_2 := 0;
        VAR num NumIf0CntfgIf1Filter := 0; 
        VAR num draft := 0;
        VAR num draft2 := 0;
        VAR num draft3 := 0;
        
        VAR num jj := 1;
        VAR num i := 0;
        VAR Bool IsItLoaded := FALSE;
        VAR bool NotUsed;
        VAR bool DoINeedToOpen:= TRUE;
        
        g_Init \maxSpd := 25, \holdForce := 10;
        !FindJarsBothArmsFunctioning;
        JarNumFilledByS1_2 := 0;
        ZeroingVariables;
        ZeroingVariablesForMOV2_3;
        WHILE JarNumFilledByS1_2 <2 DO
            ZeroingVariables;
            botNumber:=1;
            bottleHandling botNumber;
            WaitUntil JarInPlace = TRUE;
            HoldJarInOrange;
            Held_LeftHoldingJar := TRUE;
            WaitUntil Held_CoverHasBeenRemoved=TRUE;
            Held_MoveJarFromOrange2Black;
            
            solutionVolume:= solution1volume;
            liftAct :=TRUE;
            liquidHandling solutionVolume, liftAct;
            
            removeBottle botNumber;
            StuckedNozzelRemoved := FALSE;
            
            IF demo = FALSE THEN
                
            botNumber:=2;
            bottleHandling botNumber;
            
            solutionVolume:=solution2volume;
            liftAct :=TRUE;
            liquidHandling solutionVolume, liftAct;
            
            removeBottle botNumber;
            StuckedNozzelRemoved := FALSE;
            ENDIF
            
            Held_FromBlackToOrange;
            JarOnOrangeStation := TRUE;! can be removed
            WaitUntil rightArmReadyReadyToPress = TRUE;
            g_JogOut; 
            WaitTime 1; 
            g_GripIn;
            WaitUntil JarClosed = TRUE;
            Held_ToMainMidPoint;
            JarNumFilledByS1_2 := JarNumFilledByS1_2 + 1;
            g_GripIn;
            !MoveFromHomeToMainMidPoint;
            IF JarNumFilledByS1_2=1 THEN
                OpenLidFromMainMidPoint;
                !MoveFromLidOpeningToMainMidPoint;
                MoveFromMainMidPointToHome;
                TakeFistImage := TRUE;
                FindJars_LeftArm;
                IsItLoaded := FALSE;
                draft3 := MoveFromMidCtfgToMainMidPoint(IsItLoaded);
            ENDIF
            Held_LeftHoldingJar := FALSE;
            shakeTube;
            PickJar;
            IsItLoaded := TRUE;
            draft3 := MoveFromMainMidPointToMidCtfg(IsItLoaded);
            IF JarNumFilledByS1_2=1 THEN
                PutJarIn_0_angleHole;
                IsItLoaded := FALSE;
                draft3 := MoveFromMidCtfgToMainMidPoint(IsItLoaded); 
                doneWithFirstJat := TRUE;
                WaitTime 5;
            ENDIF   

            IF JarNumFilledByS1_2=2 THEN
                PutJarIn_180_angleHole;
                IsItLoaded := FALSE;
                draft3 := MoveFromMidCtfgToMainMidPoint(IsItLoaded);
                doneWithSecondJar := TRUE;
            ENDIF
        ENDWHILE
        
        if demo=false THEN        
            NumIf0CntfgIf1Filter:=0;
        ELSE
            NumIf0CntfgIf1Filter:=1;
        ENDIF
        
        WHILE NumIf0CntfgIf1Filter < 2 do
            MoveFrom_MMP_ToClosingPoint;
            CloseLid;
            MoveTo_MMP_FromLastClosingPoint;
            Turn_On_Off_Centrifuge_from_MMP;
            MoveFromTurningCntfgOnOffTo_MMP;
            WaitTime centTime;
            Turn_On_Off_Centrifuge_from_MMP;
            MoveFromTurningCntfgOnOffTo_MMP;
            waittime centBrake; !Needs to be measured. Depends on cent braking time.
            OpenLidFromMainMidPoint;
            !MoveFromLidOpeningToMainMidPoint;
            MoveFromMainMidPointToHome;
            TakeSecondImage := TRUE;
            FindJars_LeftArm;
            i:=1;
            WHILE i<3 DO
                ZeroingVariables;
                IF i = 1 THEN 
                    TakeOutJarFrom_0_angleHole;
                ELSE
                    IF NumIf0CntfgIf1Filter = 1 then  
                        IsItLoaded := TRUE;
                        draft3 := MoveFromMainMidPointToMidCtfg(IsItLoaded);
                    endif
                    TakeOutJarFrom_180_angleHole;
                endif
                IsItLoaded := TRUE;
                draft3 := MoveFromMidCtfgToMainMidPoint(IsItLoaded);
                Held_LeftHoldingJar := FALSE;
                PutJarInOrangeStation;
                IF i=2 AND demo=TRUE THEN
                    IsItLoaded := FALSE;
                    MoveFrom_MMP_ToClosingPoint;
                    CloseLid;
                    MoveTo_MMP_FromLastClosingPoint;
!                    MoveFromMainMidPointToHome;
                else
                HoldJarInOrange;
                Held_LeftHoldingJar := TRUE;
                Held_CoverHasBeenRemoved:=FALSE;
                WaitUntil Held_CoverHasBeenRemoved=TRUE;
                Held_MoveJarFromOrange2Black;
                
!                botNumber:=4;
!                bottleHandling botNumber;
                bottleChanged:=TRUE;
                
                IF NumIf0CntfgIf1Filter = 0 THEN
                    solutionVolume:= solution1volume+solution2volume;
                ELSE
                    solutionVolume:=solution3volume;
                ENDIF
                liftAct :=False;
                liquidHandling solutionVolume, liftAct;
                bottleChanged := FALSE;
!                removeBottle botNumber;
                StuckedNozzelRemoved := FALSE;
                PippeteFilled := False;
                
                botNumber:=3;
                bottleHandling botNumber;
                solutionVolume:=solution3volume;
                liftAct :=TRUE;
                liquidHandling solutionVolume, liftAct;    
                removeBottle botNumber;
                StuckedNozzelRemoved := FALSE;
                
                FilteringFinished := FALSE;
                Held_FromBlackToOrange;
                JarOnOrangeStation := TRUE;! can be removed
                WaitUntil JarClosed = TRUE;
                Held_ToMainMidPoint;
                Held_LeftHoldingJar := FALSE;
                shakeTube;
                JarHolded:= FALSE; !we stopped here NumIf0CntfgIf1Filter = 1 i = 1 nozzleNumver12
                IF NumIf0CntfgIf1Filter = 0 THEN
                    PickJar;
                    IsItLoaded := TRUE;
                    draft3 := MoveFromMainMidPointToMidCtfg(IsItLoaded);
                    IF I = 1 THEN
                        PutJarIn_0_angleHole;
                    ELSE
                        PutJarIn_180_angleHole;
                    ENDIF   
                    doneWithSecondJar:=TRUE;
                    WaitTime 5;
                ELSE
                    HoldJarInOrange;
                    Held_LeftHoldingJar := TRUE;
                    Held_CoverHasBeenRemoved:=FALSE;
                    WaitUntil Held_CoverHasBeenRemoved=TRUE;
                    IF i=1 THEN
                        DoINeedToOpen:=TRUE;
                    ELSE
                        DoINeedToOpen:=false;
                    ENDIF
                    NotUsed:=MOV2_3(DoINeedToOpen);
                    WaitUntil PlateAlreadyInCapinet = TRUE;
                    doneWithSecondJar:=TRUE;
                    WaitTime 5;
                ENDIF
                ENDIF
                i := i + 1;
            ENDWHILE
            IF demo = FALSE then
            IF NumIf0CntfgIf1Filter = 0  THEN
                IsItLoaded := FALSE;
                draft3 := MoveFromMidCtfgToMainMidPoint(IsItLoaded);
            ELSE
                IsItLoaded := FALSE;
                MoveFrom_MMP_ToClosingPoint;
                CloseLid;
                MoveTo_MMP_FromLastClosingPoint;
!                MoveFromMainMidPointToHome;
            ENDIF
            endif
            NumIf0CntfgIf1Filter:=NumIf0CntfgIf1Filter+1;
        ENDWHILE
!        ZeroingVariables;
!        FOR i FROM 1 TO 2 DO
!        IF I = 1 THEN 
!        TakeOutJarFrom_0_angleHole;
!        DoINeedToOpen:=TRUE;
!        ELSE 
!        TakeOutJarFrom_180_angleHole;
!        DoINeedToOpen:=FALSE;
!        ENDIF
!        IsItLoaded := TRUE;
!        draft3 := MoveFromMidCtfgToMainMidPoint(IsItLoaded);
!        Held_LeftHoldingJar := FALSE;
!        PutJarInOrangeStation;
!        HoldJarInOrange;
!        Held_LeftHoldingJar := TRUE;
!        NotUsed:=MOV2_3(DoINeedToOpen);
!        WaitUntil PlateAlreadyInCapinet = TRUE;
        
!        IF I = 1 THEN 
!        IsItLoaded := FALSE;
!        draft3 := MoveFromMainMidPointToMidCtfg(IsItLoaded);
!        ENDIF
!        ENDFOR
        
        
               
        
!        MoveFrom_MMP_ToClosingPoint;
!        CloseLid;
!        MoveTo_MMP_FromLastClosingPoint;
!        MoveFromMainMidPointToHome;
         gripConError;
         ERROR
                StorePath;
                waittime 0.5;
                TPWrite ("Left gripper lost connection, but i can still going");
                RestoPath;
                StartMoveRetry;
    ENDPROC
ENDMODULE