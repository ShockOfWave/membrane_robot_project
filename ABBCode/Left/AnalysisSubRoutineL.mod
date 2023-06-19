MODULE AnalysisSubRoutineL
    PROC Analysis()
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
       var num bottlenumber :=4 ;
       VAR num dosCount :=0;
       JarNumFilledByS1_2 := 0;
       ZeroingVariables;
       ZeroingVariablesForMOV2_3;
       ZeroingVariablesOfMov2_1;
       IF anset = FALSE THEN
           WaitUntil WaitingForClosetIsOpend_analysis=TRUE;
           OpenLock;
           closetisopened_analysis:= TRUE;
           leftReadyAnalysis:=FALSE;
           solutionVolume:= solutionAnVolume;
           liftAct :=TRUE;
           FOR i FROM 1 TO 2 DO
               ZeroingVariables;
               bottleHandling bottlenumber;
               IF i = 2 THEN
                    rightarmmove:=TRUE;
               ENDIF
               WaitUntil JarInPlace=TRUE;
               HoldJarInOrange;
               Held_LeftHoldingJar := TRUE;
               WaitUntil Held_CoverHasBeenRemoved=TRUE;
               Held_MoveJarFromOrange2Black;
               liquidHandling solutionVolume, liftAct;
               removeBottle bottlenumber;
               StuckedNozzelRemoved := FALSE;
               WaitUntil MoveFromBlackToRed_analysis=TRUE;
               MoveJarFromBlack2Orange_analysis;
               JarAtRedStaion_Analysis:=TRUE;
               JarOnBlackStation:=FALSE;
    !           IF i = 1 then
    !           WaitUntil DoneFillingStationaryJar = TRUE;
    !           ENDIF
               bottlenumber:=5;
           ENDFOR
       ENDIF
 
        !##############################################################
        !Now taking samples and emptying weird jars
        
        IF AnalysisOver=TRUE THEN ! Analysis gonna take 24 hour to complete. For now it is fine, but for the whole proc gotta add check like in the right's hand code.
            leftReadyAnalysis:=TRUE;
            FOR i FROM 1 TO 2 DO
                ZeroingVariables;
                waituntil JarInPlace=TRUE;
                HoldJarInOrange;
                Held_LeftHoldingJar := TRUE;
                WaitUntil Held_CoverHasBeenRemoved=TRUE;
                Held_MoveJarFromOrange2Black;
    !### add pressing (we are pressing it with the right arm on the station, left arm should lift the tube like it is usually doing)
                EnsureTightEquippingOfNozzle;
                WHILE dosCount < (anDos/partVolume) DO
                    waituntil PippeteInSecondPosition = TRUE;
                    PippeteFilled := False;
                    LiftJarToNozzle liftAct;
                    dosCount := dosCount+1;
                ENDWHILE ! That would probably not work as intended but we gotta check. I have zero motivation to write it all over again. 
                dosCount:=0;
                WaitUntil PippeteInThirdPosition = TRUE;
                PressToDropNozzel;
                StuckedNozzleRemoval;
                Held_FromBlackToOrange;
                JarOnOrangeStation := TRUE;
                WaitUntil JarClosed=TRUE;
    !!CHECK IT
                PickAndPlaceDoneAnalysisJars;!
                WaitUntil JarInPlace=TRUE;
            ENDFOR
            leftReadyAnalysis:=FALSE;
        endif

        ERROR
               IF ERRNO = 1002 then
                StorePath;
                 
                waittime 0.5;
                TPWrite ("Left gripper lost connection, but i can still going");
                TPWrite "ErrNumber = " \Num:=ERRNO;
                RestoPath;
                StartMoveRetry;
        ELSE 
           tpWrite ("Diferrent ERROR");
           TPWrite "ErrNumber = " \Num:=ERRNO;
        ENDIF
    ENDPROC
ENDMODULE