MODULE TestRun
   ! CONST robtarget bottle3Home:=[[397.2227,227.5054,116.6497],[0.009298968,-0.9997138,0.02198263,0.001590888],[-1,0,3,0],[-101.4111,9E+09,9E+09,9E+09,9E+09,9E+09]];
   !CONST robtarget bottle3AboveHome:=[[398.9054,228.8861,205.3516],[0.001199068,-0.9995481,0.02195031,0.02050428],[-1,0,3,0],[-87.14941,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PROC testingRunLeftTEST()
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
        leftReadyAnalysis:=TRUE;
            
                ZeroingVariables;
                 ZeroingVariablesForMOV2_3;
                    ZeroingVariablesOfMov2_1;
                waituntil JarInPlace=TRUE;
                leftReadyAnalysis:=FALSE;
                HoldJarInOrange;
                Held_LeftHoldingJar := TRUE;
                WaitUntil Held_CoverHasBeenRemoved=TRUE;
                Held_MoveJarFromOrange2Black;
    !### add pressing (we are pressing it with the right arm on the station, left arm should lift the tube like it is usually doing)
                EnsureTightEquippingOfNozzle;
                liftAct:=TRUE;
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
            
ENDPROC
        
ENDMODULE