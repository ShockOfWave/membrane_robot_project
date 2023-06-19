MODULE AnalysisSubRoutineR
    PROC Analysis ()!Started to think through logic of analysis handling. Quite a lot blank spaces left.
        VAR num dosCount:=0;
        JarAtRedStaion_Analysis:=FALSE;
        WaitingForClosetIsOpend_analysis:=FALSE;
        IF anSet = FALSE THEN
            AnalysisOver:=FALSE;
            FOR i FROM 1 TO 2 do
                PickWeirdJar;
                IF i = 1 then PlaceMovingWeirdJar;
                ELSE PlaceStationaryWeirdJar;
                ENDIF
            ENDFOR
            MoveJ FirstOneOriginal, Travel, z5, GripperRight1;
            WaitingForClosetIsOpend_analysis:=TRUE;
            WaitUntil closetisopened_analysis=true;  ! the closet door will be closed , need to open it
            TakePlateOut;
            PickFilterForAnalysisProc;
            MoveFilterForAnalysis;
            set custom_DO_6;
            CloseCapinet;
            WaitTime wJarClosingTime; !Add clamp handling procedure Added 11/05/2023
            ClampUp TRUE;
            FillAnalysisJars;
            anWDay:= GetTime(\WDay)+andTime;
            anHour := GetTime(\Hour)+anhTime;
            anMinute := GetTime(\Min)+anmTime;
            IF anMinute > 59 THEN
               anHour:=anHour+1;
               anMinute:=anMinute - 60;
            ENDIF
            IF anHour > 23 THEN
               anHour:=anHour-24;
            ENDIF
            anSet := TRUE;
            filterNeedsRemoval:=TRUE;
            
        ELSE
            IF (GetTime(\Hour) >= anHour) AND (GetTime (\Min) >= anMinute) AND (GetTime(\WDay) = anWDay) THEN
                anSet := FALSE;
                TPWrite "Analysis Over";
                waittime 20; !For the test remove later
                AnalysisOver:=TRUE;
                
                DragRailStationToJars;
                waituntil leftReadyAnalysis = TRUE;
                FOR i from 1 TO 2 DO
                    ZeroingVariables;
                    ZeroingVariablesOfMov2_1;
                    PickThenPlaceJar;
                    JarInPlace := TRUE;
                    WaitUntil Held_LeftHoldingJar = TRUE;
                    HeldJar_OpenCover;
                    WaitUntil JarOnBlackStation = TRUE;
                    MoveJ FillPippete5_2, Travel, z5, GripperRight1;
                    PickPippete;
                    JarInPlace :=FALSE; 
                    NozzelNumber := NozzelNumber + 1;
                    MovForNozzle;
                    MoveJ FillPippete5, Travel, z5, GripperRight1;
                    EnsureTightEquippingOfNozzle;
                    MoveJ FillPippete6, Travel, z5, GripperRight1;
                    IF i = 1 THEN
                        WHILE dosCount<(anDos/partVolume) DO
                           MovePippetToStationary;
                            dosCount:=dosCount+1;
                        ENDWHILE
                        dosCount:=0;
                    ELSE
                        WHILE dosCount<(anDos/partVolume) DO
                           MovePippetToMoving;
                            dosCount:=dosCount+1;
                        ENDWHILE
                        dosCount:=0;
                    ENDIF
                   MoveJ MoveDispenser3, Slow, z5, GripperRight1; !(added it here instead, for now)
                   DropNozzlePos; !CHECK WHERE THE ARM IS BEFORE THIS PROCESS (it ends on MoveDispencer2 should end at 3 gonna modify movepippettomoving(stationary) procs). AND Tube with samples should be also closed  and be putted somewhere with the left arm. 
                   PippeteInThirdPosition := FALSE;
                   PippeteInSecondPosition := False;
                   PippeteInFirstPosition := False;
                   waituntil JarOnOrangeStation=True;
                   PutCoverOnHeldJar;
                   HeldJarTurnCover;
                   JarClosed := TRUE;
                   waituntil TubeMovedToDelivery;
                   TubeMovedToDelivery:=FALSE;
           ENDFOR
                PushRailStation;
                ClampUp FALSE;
                !! After analysis bottles separated move them somewhere else
                reset custom_DO_6;
                
                WaitTime 90;  
                RemoveMovingWeirdJar;
                RemoveStationaryWeirdJar;
                ReMoveFilterFromAnalysis;
                MovePlateAfterAnalysis;

            ENDIF
        ENDIF
    ENDPROC
ENDMODULE