MODULE MOV2
    PROC MOV2_2()
        VAR num done := 0;
        VAR num draft := 0;
        VAR num draft2 := 0;
        VAR num draft3 := 0;
        VAR num jj := 1;
        VAR Bool IsItLoaded := FALSE;
        g_Init \maxSpd := 25, \holdForce := 10;
        !FindJarsBothArmsFunctioning;
        
        done := 0;
        FOR i FROM 1 TO 2 DO
            ZeroingVariables;
            done := done + 1;
            !PickThenPlaceJar;
            WaitUntil JarInPlace = TRUE;
            HoldJarInOrange;
            Held_LeftHoldingJar := TRUE;
            WaitUntil Held_CoverHasBeenRemoved=TRUE;
            Held_MoveJarFromOrange2Black;
            EnsureTightEquippingOfNozzle;
            WaitUntil PippeteInFirstPosition = TRUE;
            PressToFill;
            PippeteFilled := TRUE;
            WaitUntil PippeteInSecondPosition = TRUE;
            PressToEmpty;
            PippeteEmptied := TRUE;
            WaitUntil PippeteInThirdPosition = TRUE;
            PressToDropNozzel;
            NozzelDropped := TRUE;
            StuckedNozzleRemoval;
            Held_FromBlackToOrange;
            JarOnOrangeStation := TRUE;! can be removed
            WaitUntil JarClosed = TRUE;
            Held_ToMainMidPoint;

            g_GripIn;
            !MoveFromHomeToMainMidPoint;
            IF done=1 THEN
                OpenLidFromMainMidPoint;
                !MoveFromLidOpeningToMainMidPoint;
                MoveFromMainMidPointToHome;
                TakeFistImage := TRUE;
                FindJars_LeftArm;
                IsItLoaded := FALSE;
                draft3 := MoveFromMidCtfgToMainMidPoint(IsItLoaded);
            ENDIF
            PickJar;
            Held_LeftHoldingJar := FALSE;
            IsItLoaded := TRUE;
            draft3 := MoveFromMainMidPointToMidCtfg(IsItLoaded);
            IF done=1 THEN
                PutJarIn_0_angleHole;
                Held_LeftHoldingJar := FALSE;
                IsItLoaded := FALSE;
                draft3 := MoveFromMidCtfgToMainMidPoint(IsItLoaded); 
                DoneWithFirstJat := TRUE;
                WaitTime 5;
            ENDIF   

            IF done=2 THEN
                draft2 := draft2 + 1;
                IF draft2=1 THEN
                    PutJarIn_180_angleHole;
                    IsItLoaded := FALSE;
                    draft3 := MoveFromMidCtfgToMainMidPoint(IsItLoaded);
                    FOR j FROM 1 TO 20 do
                        IsJarinPosition{j}:=FALSE;
                    endfor
                ENDIF
            ENDIF
        ENDFOR
        
        MoveFrom_MMP_ToClosingPoint;
        CloseLid;
        MoveTo_MMP_FromLastClosingPoint;
        Turn_On_Off_Centrifuge_from_MMP;
        MoveFromTurningCntfgOnOffTo_MMP;
        WaitTime 10;
        Turn_On_Off_Centrifuge_from_MMP;
        MoveFromTurningCntfgOnOffTo_MMP;
        waittime 2;
        OpenLidFromMainMidPoint;
        !MoveFromLidOpeningToMainMidPoint;
        MoveFromMainMidPointToHome;
        TakeSecondImage := TRUE;
        FindJars_LeftArm;
        TakeOutJarFrom_0_angleHole;
        IsItLoaded := TRUE;
        draft3 := MoveFromMidCtfgToMainMidPoint(IsItLoaded);
        PlaceFirstJar;
        IsItLoaded := FALSE;
        draft3 := MoveFromMainMidPointToMidCtfg(IsItLoaded);
        TakeOutJarFrom_180_angleHole;
        IsItLoaded := TRUE;
        draft3 := MoveFromMidCtfgToMainMidPoint(IsItLoaded);
        PlaceSecondJar;
        MoveFrom_MMP_ToClosingPoint;
        CloseLid;
        MoveTo_MMP_FromLastClosingPoint;
        MoveFromMainMidPointToHome;

    ENDPROC
    
    
    PROC MOV2_2_2()
        VAR num done := 0;
        VAR num draft := 0;
        VAR num draft2 := 0;
        VAR num draft3 := 0;
        VAR num jj := 1;
        VAR Bool IsItLoaded := FALSE;
        VAR bool NotUsed;
        VAR bool DoINeedToOpen:= TRUE;
        
        g_Init \maxSpd := 25, \holdForce := 10;
        !FindJarsBothArmsFunctioning;
        
        done := 0;
        FOR i FROM 1 TO 2 DO
            ZeroingVariables;
            done := done + 1;
            !PickThenPlaceJar;
            WaitUntil JarInPlace = TRUE;
            HoldJarInOrange;
            Held_LeftHoldingJar := TRUE;
            WaitUntil Held_CoverHasBeenRemoved=TRUE;
            Held_MoveJarFromOrange2Black;
            WaitUntil PippeteInFirstPosition = TRUE;
            PressToFill;
            PippeteFilled := TRUE;
            WaitUntil PippeteInSecondPosition = TRUE;
!            LiftJarToNozzle;
!            PressToEmpty;
!            PippeteEmptied := TRUE;
            WaitUntil PippeteInThirdPosition = TRUE;
            PressToDropNozzel;
            NozzelDropped := TRUE;
            Held_FromBlackToOrange;
            JarOnOrangeStation := TRUE;! can be removed
            WaitUntil JarClosed = TRUE;
            Held_ToMainMidPoint;

            g_GripIn;
            !MoveFromHomeToMainMidPoint;
            IF done=1 THEN
                OpenLidFromMainMidPoint;
                !MoveFromLidOpeningToMainMidPoint;
                MoveFromMainMidPointToHome;
                TakeFistImage := TRUE;
                FindJars_LeftArm;
                IsItLoaded := FALSE;
                draft3 := MoveFromMidCtfgToMainMidPoint(IsItLoaded);
            ENDIF
            PickJar;
            Held_LeftHoldingJar := FALSE;
            IsItLoaded := TRUE;
            draft3 := MoveFromMainMidPointToMidCtfg(IsItLoaded);
            IF done=1 THEN
                PutJarIn_0_angleHole;
                Held_LeftHoldingJar := FALSE;
                IsItLoaded := FALSE;
                draft3 := MoveFromMidCtfgToMainMidPoint(IsItLoaded); 
                DoneWithFirstJat := TRUE;
                WaitTime 5;
            ENDIF   

            IF done=2 THEN
                draft2 := draft2 + 1;
                IF draft2=1 THEN
                    PutJarIn_180_angleHole;
                    IsItLoaded := FALSE;
                    draft3 := MoveFromMidCtfgToMainMidPoint(IsItLoaded);
                    FOR j FROM 1 TO 20 do
                        IsJarinPosition{j}:=FALSE;
                    endfor
                ENDIF
            ENDIF
        ENDFOR
        
        MoveFrom_MMP_ToClosingPoint;
        CloseLid;
        MoveTo_MMP_FromLastClosingPoint;
        Turn_On_Off_Centrifuge_from_MMP;
        MoveFromTurningCntfgOnOffTo_MMP;
        WaitTime 10;
        Turn_On_Off_Centrifuge_from_MMP;
        MoveFromTurningCntfgOnOffTo_MMP;
        waittime 2;
        OpenLidFromMainMidPoint;
        !MoveFromLidOpeningToMainMidPoint;
        MoveFromMainMidPointToHome;
        TakeSecondImage := TRUE;
        FindJars_LeftArm;
        TakeOutJarFrom_0_angleHole;
        IsItLoaded := TRUE;
        draft3 := MoveFromMidCtfgToMainMidPoint(IsItLoaded);
        Held_LeftHoldingJar := FALSE;
        PutJarInOrangeStation;
        HoldJarInOrange;
        Held_LeftHoldingJar := TRUE;
        DoINeedToOpen:=TRUE;
        NotUsed:=MOV2_3(DoINeedToOpen);
        WaitUntil PlateAlreadyInCapinet = TRUE;
        
        IsItLoaded := FALSE;
        draft3 := MoveFromMainMidPointToMidCtfg(IsItLoaded);
        TakeOutJarFrom_180_angleHole;
        IsItLoaded := TRUE;
        draft3 := MoveFromMidCtfgToMainMidPoint(IsItLoaded);
        Held_LeftHoldingJar := FALSE;
        PutJarInOrangeStation;
        HoldJarInOrange;
        Held_LeftHoldingJar := TRUE;
        ZeroingVariablesForMOV2_3;
        DoINeedToOpen:=FALSE;
        NotUsed:=MOV2_3(DoINeedToOpen);
        WaitUntil PlateAlreadyInCapinet = TRUE;
        
        
!        MoveFrom_MMP_ToClosingPoint;
!        CloseLid;
!        MoveTo_MMP_FromLastClosingPoint;
!        MoveFromMainMidPointToHome;

    ENDPROC
ENDMODULE