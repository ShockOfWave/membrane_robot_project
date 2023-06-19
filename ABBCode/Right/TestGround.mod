MODULE TestGround
   PROC testGroundRight () !Plate was still on top of the vacuum filter, had to add a proc to remove it before new filtration cycle
          
          VAR num dosCount:=0;
          anSet := FALSE;
        JarAtRedStaion_Analysis:=FALSE;
        WaitingForClosetIsOpend_analysis:=FALSE;
                TPWrite "Analysis Over";
                waittime 20; !For the test remove later
                AnalysisOver:=TRUE;
                
                DragRailStationToJars;
                waituntil leftReadyAnalysis = TRUE;
                
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
                    MoveJ FillPippete5_2, Travel, z5, GripperRight1;
                    EnsureTightEquippingOfNozzle;
                    MoveJ FillPippete6, Travel, z5, GripperRight1;
                    
                        WHILE dosCount<(anDos/partVolume) DO
                           MovePippetToMoving;
                            dosCount:=dosCount+1;
                        ENDWHILE
                        dosCount:=0;
                    
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
           
                PushRailStation;
                ClampUp FALSE;
                !! After analysis bottles separated move them somewhere else
                reset custom_DO_6;
                
                WaitTime 90;  
                RemoveMovingWeirdJar;
                RemoveStationaryWeirdJar;
                ReMoveFilterFromAnalysis;
                MovePlateAfterAnalysis;
    ENDPROC
ENDMODULE