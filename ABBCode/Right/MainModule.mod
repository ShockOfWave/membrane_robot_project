MODULE MainModule
    PERS bool L_Home;   
    PERS bool L_Capture;
    PERS bool PhotoTakenandPatternDetected;
    PERS bool R_Home:=FALSE; 
    PERS BOOL TakeFistImage;
    PERS BOOL TakeSecondImage;
    PERS bool filterDis:=FALSE;
    PERS bool VaccumIsOn:=FALSE;
    PERS bool RightArmWaiting:=FALSE;
    PERS bool rightArmReadyReadyToPress:=FALSE;
    PERS bool FilterRemovedFromPlate:=FALSE;
    PERS BOOL TubeMovedToDelivery;
    PERS bool rightarmmove:=FALSE;
    PERS bool readytoCount:=FALSE;
    VAR num Column := 0;
    !Varibles for analysis
    PERS bool anset:=FALSE;
    VAR bool analysisReady :=FALSE;
    VAR bool filterNeedsRemoval;
    VAR num anHour:=0;
    VAR num anMinute:=0;
    VAR num anWDay:=0;
    var num anhTime:=0;
    var num anmTime:=0;
    var num andTime:=0;
    CONST num wJarClosingTime:=70; !The time needed to move the analysis bottles together.Needs to be measured. 
    pers bool closetisopend_analysis;
    ! Variables for MOV2_2
    PERS bool JarOnBlackStation := TRUE;
    PERS bool PippeteInFirstPosition:= FALSE;
    PERS bool PippeteFilled := FALSE;
    PERS bool PippeteInSecondPosition := TRUE;
    PERS bool PippeteEmptied := FALSE;
    PERS bool PippeteInThirdPosition := FALSE;
    PERS bool NozzelDropped := FALSE;
    PERS bool JarOnOrangeStation := FALSE;
    PERS bool JarClosed := FALSE;
    PERS BOOL JarLifted := TRUE;
    PERS BOOL JarLiftedSuc:=FALSE;
    PERS BOOL bottleChanged:=TRUE;
    
    ! Two Boolian variables To find how many jars are on the station
    PERS Bool FindJars_Rhome := FALSE;
    PERS Bool FindJars_Lhome := FALSE;
    
    ! Variables for opening, closing and filling in the jar
    PERS Bool FillJarRready := FALSE;
    PERS Bool FillJarLready := FALSE;
    PERS Bool FillJarInOpenPosition2Open := FALSE;
    PERS Bool FillJarLidInPosition := FALSE;
    PERS Bool FillJarInOpenPosition2Close := FALSE;
    PERS Bool FillJarLidClosed := FALSE;
    PERS Bool FillJarRightHandReadyforRising := FALSE;
    PERS Bool FillJarLeftHandRaised :=FALSE;
    PERS Bool DoneWithFirstJat := FALSE;
    PERS Bool DoneWithSecondJar:= FALSE;
    PERS Bool CoverPicked := FALSE;
    PERS Bool JarHolded := FALSE;
    PERS BOOL ReadyToRemoveStuckedNozzel := FALSE;
    PERS BOOL StuckedNozzelRemoved := FALSE;
    PERS BOOL JarInPlace := TRUE;
    
    
    !Variables to open and colse Jar Held in Hole in Orange
    PERS Bool Held_LeftHoldingJar :=TRUE;
    PERS Bool Held_CoverHasBeenRemoved :=TRUE;
    PERS Bool Held_JarIsBackInOrange :=FALSE;
    PERS Bool  Held_jarClosed:=FALSE;
    
    !variables for moving filter from big jar to plate
    PERS Bool  FilterLifted:=FALSE;
    PERS Bool  FilterShifted:=FALSE;
    PERS Bool  FilterPicked:=FALSE;
    PERS Bool  PlateInPosition:=FALSE;
    PERS Bool  DoneWithPosition5:=FALSE;
    PERS Bool  R_GripperInPosition5:=FALSE;
    PERS Bool  DoneWithPosition4:=FALSE;
    PERS Bool  R_GripperInPosition4:=FALSE;
    PERS Bool  DoneWithPosition3:=FALSE;
    PERS Bool  R_GripperInPosition3:=FALSE;
    
    
    PERS Bool FunnelInPosition := FALSE;
    PERS Bool FilteringFinished := FALSE;
    PERS Bool FilterInPlate := FALSE;
    PERS Bool CapinetOpened := FALSE;
    PERS Bool PlateAlreadyInCapinet := FALSE;
    PERS Bool CoverOpened := FALSE;
    
    !variable to ensure tight equippment of the nozzle
    PERS bool LeftHandPressed := TRUE;
    PERS bool PippeteReady := FALSE;
    
    !variable for MoveAndFillJars
    VAR bool MoveNextJar:=FALSE;
    VAR bool NewCycle:=TRUE;
    
    
    PERS bool JarAtRedStaion_Analysis :=FALSE;
    PERS bool WaitingForClosetIsOpend_analysis := FALSE;
    PERS bool ClosetIsOpened_analysis := FALSE;
    PERS bool DoneFillingStationaryJar := TRUE;
    PERS bool MoveFromBlackToRed_analysis := TRUE;
    
    PERS bool AnalysisOver:= TRUE;
    PERS bool leftReadyAnalysis;
    
    VAR robtarget NozTemp;
    VAR robtarget NozTempAbove;

    VAR speeddata VerySlow := [5,20,20,5];
    VAR speeddata Slow := [20,50,50,50];
    VAR speeddata Normal := [200,50,50,200];
    VAR speeddata Fast := [300,150,150,300];
    VAR speeddata Travel := [500,200,200,500];
    
    VAR num i;
    VAR num b;
    VAR num solutionVolume;
    PERS num solution1Volume;
    PERS num solution2Volume;
    PERS num solution3Volume;
    PERS num solutionAnVolume;
    PERS num anDos;
    PERS num partVolume;
    VAR bool pressAct;
    
    PERS bool ShakeStarted:= FALSE;
    PERS bool ShakeOver := FALSE;
    
    
    ! some variables for camera
    VAR num Scene_1;
    VAR cameratarget mycamtarget;
    PERS wobjdata GreenCover;
    VAR Bool  ContnuLoop := TRUE;

    
    ! Draft Variables
    VAR num diff := 0.0;
       
    !Read Cell Values 
    VAR socketdev socket1;
    VAR string stringReceived;
    VAR bool ok;
    VAR string cellnumber:="e031";
    VAR string CellValueStr;
    VAR num CellValueNum;
    VAR num CellValue;
    VAR NUM SDEV{20,15};
    PERS bool IsJarinPosition{20};
    VAR num draft;
    
    VAR NUM NumberOfPlates := 7;
    CONST NUM PlateThick:=14.5;
    PERS bool demo:=TRUE;
    PERS num NozzelNumber;
    VAR num ShakeTime:=20;
    PERS bool NewCycleArmsSynchRight;
    PERS bool NewCycleArmsSynchLeft;
    PROC Main()
        
        
        VAR NUM GGGG:=1;
        VAR num MyNum := 1;
        var num x;
        
        NozzelNumber := 0;
        MotionSup \On;
        g_Calibrate;
        
        g_GripIn;
        WaitTime 2;
        g_Calibrate;
        g_Init \maxSpd := 25, \holdForce := 20;
        
            solution1Volume :=5;
            solution2Volume :=15;! should be 15
            solution3Volume :=20;! should be 20
            solutionAnVolume:=50;! analysis bottle volume
            anDos:= 40;! test sample volume should be about the same as solutionAnVolume 
            anhTime := 24;
            anmTime := 0;
            andTime:=1;
            partVolume :=5;
            ShakeTime:=30;
        IF demo = TRUE then
            solution1Volume :=5;
            solution2Volume :=5;! should be 15
            solution3Volume :=5;! should be 20
            solutionAnVolume:=5;! analysis bottle volume
            anDos:= 5;! test sample volume should be about the same as solutionAnVolume 
            anhTime := 24;
            anmTime := 0;
            andTime:=1;
            partVolume :=5;
            ShakeTime:=5;
        ENDIF
        ! Variables for opening, closing and filling in the jar
        FillJarRready := FALSE;
        FillJarLready := FALSE;
        FillJarInOpenPosition2Open := FALSE;
        FillJarLidInPosition := FALSE;
        FillJarInOpenPosition2Close := FALSE;
        FillJarLidClosed := FALSE;
        FillJarRightHandReadyforRising :=FALSE;
        FillJarLeftHandRaised :=FALSE;
        
        Held_LeftHoldingJar :=FALSE;
        Held_CoverHasBeenRemoved :=FALSE;
        Held_JarIsBackInOrange :=FALSE;
        Held_jarClosed:=FALSE;
        
        JarOnBlackStation := FALSE;
        PippeteInFirstPosition:= FALSE;
        PippeteFilled := FALSE;
        PippeteInSecondPosition := FALSE;
        PippeteEmptied := FALSE;
        PippeteInThirdPosition := FALSE;
        NozzelDropped := FALSE;
        JarOnOrangeStation := FALSE;
        JarClosed := FALSE;
        JarInPlace := FALSE;
        
        NewCycle:=TRUE;
        
!        g_GripIn;
!        FOR i FROM 1 TO 24 DO
!            MyNum := i;
!            MovForNozzle MyNum;
!            MoveJ FillPippete5_2, Travel, z5, GripperRight1;
!            MoveJ FillPippete5, Travel, z5, GripperRight1;
!            EnsureTightEquippingOfNozzle;
!            WaitTime 5;
!        ENDFOR
        NewCycleArmsSynchRight:=TRUE;
        waituntil NewCycleArmsSynchLeft = TRUE;
        waittime 0.5;
        NewCycleArmsSynchLeft:=FALSE;
        IF demo = FALSE THEN
            Analysis;
        ENDIF
        
        FullCycleRight;
!        TestmainRight;
!Analysis solutionAnVolume,pressAct;

!PickFilterForAnalysisProc;
!MoveFilterForAnalysis;
!        PickPippete;
!FOR i FROM 25 to 48 DO
!        NozzelNumber:=i;
!         MovForNozzle;
!         EnsureTightEquippingOfNozzle;
!         waittime 5;
         
         
!ENDFOR
!!         MovePippetToMoving;
!         WaitTime 5;
!       MOV2_2;
    ENDPROC
  
    
    
    PROC liquidHandling(num solutionVolume, bool pressAct)
            VAR num dosCount:=0;
            PickPippete;
            NozzelNumber := NozzelNumber + 1;
            MovForNozzle;
            IF pressAct = true then
                FillInPippete;
                WHILE dosCount < (solutionVolume/partVolume-1) DO
                    MoveDispenser pressAct;
                    MoveDispenserBackToBottle;
                    dosCount := dosCount+1;
                ENDWHILE
                dosCount:=0;
                MoveDispenser pressAct;
                
            ELSE
                PippeteFilled:=TRUE;
                MoveJ FillPippete5_2, Normal, z5, GripperRight1;
                MoveJ FillPippete5, Travel, z5, GripperRight1;
                EnsureTightEquippingOfNozzle;
                MoveJ FillPippete6, Travel, z5, GripperRight1;
                MoveJ FillPippeteAbovePillar, Normal, z5, GripperRight1;
                PippeteFilled:=FALSE;
                
                WHILE dosCount < (solutionVolume/partVolume) DO
                        pressAct:=False;
                        MoveDispenser pressAct;
                        MoveDispenserBackToBottle;
                        dosCount := dosCount+1;
                ENDWHILE
                dosCount:=0;
                
                MoveJ MoveDispenser2, Slow, z5, GripperRight1;
                MoveJ MoveDispenser3, Slow, z5, GripperRight1;
            ENDIF
            DropNozzlePos;
            waittime 5;
            
    ENDPROC
    

    
        
     proc pickTestSample() !wjarType
           PippeteInFirstPosition := False;
           MoveJ FillPippete5_2, Travel, z5, GripperRight1;
           MoveJ FillPippete5, Travel, z5, GripperRight1;
           EnsureTightEquippingOfNozzle;
        
        
    ENDPROC 
    
    PROC PickThenPlaceJar()
        MoveJ CameraHome, Travel, z1, GripperRight1;
        g_MoveTo 14;
        MoveJ PickThenPlaceJar_1, v2000, z1, GripperRight1;
        MoveL PickThenPlaceJar_2_1, Normal, z1, GripperRight1;
        WaitTime 0.5;
        g_GripIn;
        WaitTime 0.5;
        MoveL PickThenPlaceJar_2_2, Normal, z1, GripperRight1;
        MoveL PickThenPlaceJar_1, Travel, z1, GripperRight1;
        MoveJ PickThenPlaceJar_3, v1000, z1, GripperRight1;
        Movej PickThenPlaceJar_4_2, Normal, z1, GripperRight1;
        Movej PickThenPlaceJar_5_2, Normal, z1, GripperRight1;
        Movej PickThenPlaceJar_5_3, Normal, z1, GripperRight1;
        WaitTime 0.5;
        Movej PickThenPlaceJar_5_2, Travel, z1, GripperRight1;
        Movej PickThenPlaceJar_4_2, Travel, z1, GripperRight1;
        
        Movej PickThenPlaceJar_4, Travel, z1, GripperRight1;
        MoveL PickThenPlaceJar_5, Normal, z1, GripperRight1;
        
        waittime 0.5;
        g_MoveTo 16;
        Waittime 0.5;
        MoveJ PickThenPlaceJar_4, Travel, z1, GripperRight1;
        MoveJ PickThenPlaceJar_3, Travel, z1, GripperRight1;
        MoveJ CameraHome, Travel, z1, GripperRight1;
    ENDPROC
    
    PROC ZeroingVariables()
        FilterLifted:=FALSE;
        Held_CoverHasBeenRemoved :=FALSE;
        JarClosed := FALSE;
        ReadyToRemoveStuckedNozzel := FALSE;
        JarInPlace := FALSE;
        FilterShifted:=FALSE;
        FilterPicked:=FALSE;
        PlateInPosition:=FALSE;
        DoneWithPosition5:=FALSE;
        R_GripperInPosition5:=FALSE;
        DoneWithPosition4:=FALSE;
        R_GripperInPosition4:=FALSE;
        DoneWithPosition3:=FALSE;
        R_GripperInPosition3:=FALSE;
        VaccumIsOn:=False;
        RightArmWaiting:=False;
        FilterRemovedFromPlate:=False;
        PippeteInThirdPosition := FALSE;
                    PippeteInSecondPosition := False;
                    PippeteInFirstPosition := False;
                    closetisopened_analysis:=FALSE;
                    rightarmmove:=FALSE;
        
    ENDPROC
    
    PROC ZeroingVariablesOfMov2_1()
        L_Capture:=FALSE;
        PhotoTakenandPatternDetected:=FALSE;
        R_Home:=FALSE;
        TakeFistImage := FALSE;
        TakeSecondImage := FALSE;
        CoverPicked := FALSE;
        JarInPlace := FALSE;
        CoverOpened := FALSE;
    ENDPROC
    
    PROC FillInPippete()
        PippeteInFirstPosition := False;
!        MoveJ FillPippete1, Travel, z5, GripperRight1;
!        MoveJ FillPippete2, Travel, z5, GripperRight1;
!        MoveJ FillPippete3, Travel, z5, GripperRight1;
!        MoveJ FillPippete4, Travel, z5, GripperRight1;
        MoveJ FillPippete5_2, Travel, z5, GripperRight1;
!        MoveJ FillPippete5, Travel, z5, GripperRight1;
        EnsureTightEquippingOfNozzle;
        MoveJ FillPippete6, Travel, z5, GripperRight1;
        MoveJ FillPippeteAbovePillar, Normal, z5, GripperRight1;
        MoveJ FillPippeteOnPillar, Normal, z5, GripperRight1;
        PippeteInFirstPosition := TRUE;
        PippeteInSecondPosition := False;
        PippeteInThirdPosition := False;
        WaitUntil PippeteFilled = TRUE;
        WaitTime 1; !was 1 
        MoveJ FillPippeteAbovePillar, Normal, z5, GripperRight1;
        WaitTime 1;
    ENDPROC
    
    PROC EnsureTightEquippingOfNozzle()
        LeftHandPressed := FALSE;
        IF NozzelNumber >= 25 THEN
        MoveJ TightEquipping_3_1, Travel, z5, GripperRight1; !added after second nozzeles station
        ENDIF
        MoveJ TightEquipping_3_2, Travel, z5, GripperRight1; !added after second nozzeles station
        MoveJ FillPippete5, Travel, z5, GripperRight1; ! was Travel
        MoveJ TightEquipping_1, Travel, z5, GripperRight1; 
        MoveL TightEquipping_2, Normal, z5, GripperRight1; 
        MoveL TightEquipping_2_2, Slow, z5, GripperRight1; 
        PippeteReady := TRUE;
        WaitUntil LeftHandPressed = TRUE;
        MoveL TightEquipping_1, Travel, z5, GripperRight1; 
        MoveJ FillPippete5, Travel, z5, GripperRight1;
        PippeteReady := FALSE;
    ENDPROC
    
    PROC FillInPippeteFromDisp()      
        MoveJ MoveDispenser2, Slow, z5, GripperRight1;
        MoveJ FillPippeteAbovePillar, Normal, z5, GripperRight1;
        MoveJ FillPippeteOnPillar, Normal, z5, GripperRight1;
        PippeteInFirstPosition := TRUE;
        WaitUntil PippeteFilled = TRUE;
        WaitTime 1; !was 1 
        MoveJ FillPippeteAbovePillar, Normal, z5, GripperRight1;
        WaitTime 1;
    ENDPROC
    
    PROC EmptyPippete()
        MoveJ EmptyPippeteAbovePillar, Normal, z5, GripperRight1;
        MoveL EmptyPippeteOnPillar, Normal, z5, GripperRight1;
        PippeteInSecondPosition := TRUE;
        PippeteInFirstPosition := False;
        PippeteInThirdPosition := False;
        WaitUntil PippeteEmptied = TRUE;
        WaitTime 2;
        MoveL EmptyPippeteAbovePillar, Normal, z5, GripperRight1;
        MovToDropNozzel_mov2_2;
        WaitUntil NozzelDropped = TRUE;
        
        MoveJ MovToDropNozzel_11, Normal, z5, GripperRight1;
        !MoveJ EmptyPippete1, Normal, z5, GripperRight1;
        MoveJ PickPippete6, Travel, z5, GripperRight1;
        ReadyToRemoveStuckedNozzel := TRUE;
        WaitUntil StuckedNozzelRemoved=TRUE;
        MoveJ PickPippete5, Normal, z5, GripperRight1;
        MoveL PickPippete4, Slow, z5, GripperRight1;
        MoveL PickPippete3, Slow, z5, GripperRight1;
        PickPippeteAroundPippeteTemp.trans.y := PickPippeteAroundPippete.trans.y - 3;
        MoveL PickPippeteAroundPippeteTemp, Slow, z5, GripperRight1;
        WaitTime 1;
        g_GripOut;
        WaitTime 1;
        MoveL PickPippeteNearPippete, Slow, z5, GripperRight1;
        MoveJ FirstOneOriginal, Travel, z5, GripperRight1;
    ENDPROC
    
     PROC DropNozzlePos()
        MovToDropNozzel;
        WaitUntil NozzelDropped = TRUE;
        MoveJ EmptyPippete1, Normal, z5, GripperRight1;
        MoveJ PickPippete6, Travel, z5, GripperRight1;
        ReadyToRemoveStuckedNozzel := TRUE;
        WaitUntil StuckedNozzelRemoved=TRUE;
        MoveJ PickPippete5, Normal, z5, GripperRight1;
        MoveL PickPippete4, Slow, z5, GripperRight1;
        MoveL PickPippete3, Slow, z5, GripperRight1;
        PickPippeteAroundPippeteTemp.trans.y := PickPippeteAroundPippete.trans.y - 3;
        MoveL PickPippeteAroundPippeteTemp, Slow, z5, GripperRight1;
        WaitTime 1;
        g_GripOut;
        WaitTime 1;
        ReadyToRemoveStuckedNozzel := False;
        MoveL PickPippeteNearPippete, Slow, z5, GripperRight1;
        MoveL PickPippete9, Travel, z5, GripperRight1;
        MoveJ FirstOneOriginal, Travel, z5, GripperRight1;
    ENDPROC
    
    PROC MovToDropNozzel()
        MoveJ MovToDropNozzel_1, Travel, z5, GripperRight1;
        MoveJ MovToDropNozzel_2, Normal, z5, GripperRight1;
        MoveJ MovToDropNozzel_3, Normal, z5, GripperRight1;
        MoveJ MovToDropNozzel_4, Normal, z5, GripperRight1;
        PippeteInThirdPosition := TRUE;
        PippeteInSecondPosition := False;
        PippeteInFirstPosition := False;
    ENDPROC    
    
    PROC MovToDropNozzel_mov2_2()
        MoveJ MovToDropNozzel_11, Travel, z5, GripperRight1;
        MoveJ MovToDropNozzel_22, Normal, z5, GripperRight1;
        PippeteInThirdPosition := TRUE;
    ENDPROC
    
    PROC PickPippete()
        MoveJ CameraHome, Travel, z5, GripperRight1;
        MoveJ FirstOneOriginal, Travel, z5, GripperRight1;
        g_GripOut;
        MoveJ PickPippete1, Travel, z5, GripperRight1;
        MoveJ PickPippete2, Travel, z5, GripperRight1;
        MoveJ PickPippeteNearPippete, Normal, z5, GripperRight1;
        MoveL PickPippeteAroundPippete, Normal, z5, GripperRight1;
        WaitTime 1;!Should be 1 ali souliman changed it on 8/11
        g_GripIn;
        WaitTime 1; 
        MoveL PickPippete3, Slow, z5, GripperRight1;
        MoveL PickPippete4_3, Slow, z5, GripperRight1;
        MoveL PickPippete4_2, Slow, z5, GripperRight1;
        MoveL PickPippete4_1, Slow, z5, GripperRight1;
        MoveL PickPippete5, Normal, z5, GripperRight1;
        MoveJ PickPippete6, Normal, z5, GripperRight1;
        MoveL PickPippete7, Travel, z5, GripperRight1;
        !Movej PickPippete8, Normal, z5, GripperRight1;
!        MoveJ FirstOneOriginal, Normal, z5, GripperRight1;
        
    ENDPROC
    
    PROC MoveAndFillJars_RightModf()
        
        VAR num jar;
       IF NewCycle=TRUE THEN
            FindJarsBothArmsFunctioning;
            NewCycle:=FALSE;
       ENDIF
       FOR i FROM 1 TO 20 DO
           WHILE IsJarinPosition{i} DO
                    Held_FillJar_Right;
           ENDWHILE

       ENDFOR


    ENDPROC
    
    
        
    PROC MoveAndFillJars_Right()
        VAR num jar;
       IF NewCycle=TRUE THEN
            FindJarsBothArmsFunctioning;
            NewCycle:=FALSE;
       ENDIF
       FOR i FROM 1 TO 20 DO
                   Held_FillJar_Right;
       ENDFOR


    ENDPROC
    
    Proc Held_FillJar_Right()
        WaitUntil Held_LeftHoldingJar=TRUE;
        HeldJar_OpenCover;
   !     Held_CoverHasBeenRemoved :=TRUE;

   !     waituntil Held_JarIsBackInOrange =TRUE;
        PutCoverOnHeldJar;
        HeldJarTurnCover;
        Held_jarClosed:=TRUE;
        WaitTime 0.5;
        Held_LeftHoldingJar :=FALSE;
        Held_CoverHasBeenRemoved :=FALSE;
        Held_JarIsBackInOrange :=FALSE;
        Held_jarClosed:=FALSE;
        
    ENDPROC

    
    PROC HeldJar_OpenCover()
        MoveJ CameraHome,Travel, z5, GripperRight1;
        MoveJ Midd1,Travel, z5, GripperRight1;
        MoveJ Midd2,Travel, z5, GripperRight1;
        MoveJ HeldJar_AboveJar,Travel, z5, GripperRight1;
        g_MoveTo 20;
        MoveJ HeldJar_PlaceCover,Slow, z5, GripperRight1;
        
        Held_OpenJarLid_right1 := Held_OpenJarLid_right11_Orig;
        Held_OpenJarLid_right3 := Held_OpenJarLid_right33_Orig;
        WaitTime 0.5;
        FOR i FROM 1 TO 3 DO
            MoveJ Held_OpenJarLid_right3, v1000, z5, GripperRight1;
            WaitTime 1;
            g_GripIn;
            WaitTime 1;
            Held_OpenJarLid_right3.trans.z := Held_OpenJarLid_right3.trans.z + 1.5;
            MoveJ Held_OpenJarLid_right1, v1000, z5, GripperRight1;
            WaitTime 1;
            IF i<>3 THEN
                g_MoveTo 14;
            ENDIF
            WaitTime 0.5; 
            Held_OpenJarLid_right1.trans.z := Held_OpenJarLid_right1.trans.z + 2;
        ENDFOR
        
        
        MoveL HeldJar_AboveJar,Slow, z5, GripperRight1;
        
        MoveJ Midd3, normal, z5, GripperRight1;
        MoveJ Midd4, normal, z5, GripperRight1;
        Held_CoverHasBeenRemoved := TRUE;
        waittime 5;
        MoveJ Midd5, normal, z5, GripperRight1;
        WaitTime 1;
        g_MoveTo 15;
        WaitTime 1;
        MoveJ Midd6, normal, z5, GripperRight1;
        MoveJ Midd7, normal, z5, GripperRight1;
        MoveJ Midd8, normal, z5, GripperRight1;
        g_MoveTo 3;
        WaitTime 1;
        MoveJ Midd9, verySlow, z5, GripperRight1;
        WaitTime 1; 
        MoveJ Midd8, verySlow, z5, GripperRight1;
        
        !MoveJ Midd11,Slow, z5, GripperRight1;
        MoveJ Midd10, Slow, z5, GripperRight1;
        
        MoveJ Midd11,normal, z5, GripperRight1;
    ENDPROC
    
    
    PROC HeldJar_OpenCover_2()
        MoveJ CameraHome,Travel, z5, GripperRight1;
        MoveJ Midd1,Travel, z5, GripperRight1;
        MoveJ Midd2,Travel, z5, GripperRight1;
        MoveJ HeldJar_AboveJar,Travel, z5, GripperRight1;
        g_MoveTo 20;
        MoveJ HeldJar_PlaceCover,Slow, z5, GripperRight1;
        g_SetForce 20;
        Held_OpenJarLid_right1 := Held_OpenJarLid_right11_Orig;
        Held_OpenJarLid_right3 := Held_OpenJarLid_right33_Orig;
        WaitTime 0.5;
        FOR i FROM 1 TO 3 DO
            MoveJ Held_OpenJarLid_right3, v1000, z5, GripperRight1;
            WaitTime 1;
            g_GripIn;
            WaitTime 1;
            Held_OpenJarLid_right3.trans.z := Held_OpenJarLid_right3.trans.z + 1.5;
            MoveJ Held_OpenJarLid_right1, v1000, z5, GripperRight1;
            WaitTime 1;
            IF i<>3 THEN
                g_MoveTo 14;
            ENDIF
            WaitTime 0.5; 
            Held_OpenJarLid_right1.trans.z := Held_OpenJarLid_right1.trans.z + 2;
        ENDFOR
        
        
        MoveL HeldJar_AboveJar,Slow, z5, GripperRight1;
        CoverOpened := TRUE;
        waittime 1;
        Held_CoverHasBeenRemoved:=TRUE;
        MoveJ Midd3, normal, z5, GripperRight1;
        MoveJ Midd20, Travel, z5, GripperRight1;
        MoveJ Midd21, Travel, z5, GripperRight1;
        g_GripOut;
        MoveJ Midd22, Travel, z5, GripperRight1;
        MoveJ CameraHome, Travel, z5, GripperRight1;
        
    ENDPROC
    

    
    
!    PROC PutCoverOnHeldJar()
!        !MoveJ Midd1,Normal, z5, GripperRight1;
!        !MoveJ Midd2,Normal, z5, GripperRight1;
!        MoveJ Midd3,Normal, z5, GripperRight1;
!        g_MoveTo 15;
!        MoveJ HeldJar_PickCover,Normal, z5, GripperRight1;
!        WaitTime 0.5;
!        g_MoveTo 7;
!        WaitTime 0.5;
!        MoveJ Midd3,Normal, z5, GripperRight1;
!        MoveJ Midd4,Normal, z5, GripperRight1;

!        MoveJ HeldJar_AboveJar, Normal, z5, GripperRight1;
!        !WaitTime 5;
!        MoveL HeldJar_PlaceCover, Slow, z5, GripperRight1;
!        WaitTime 1;
!        MoveL HeldJar_PlaceCover2, Slow, z5, GripperRight1;
!        WaitTime 5;
!        !HeldJar_PlaceCoverAbs.robax.rax_6 := 50;    
!        !MoveAbsJ HeldJar_PlaceCoverAbs, Slow, z5, GripperRight1;
!!        WaitTime 1;
!!        g_MoveTo 9;
!!        waittime 0.5;
!!        MoveL HeldJar_AboveJar, Slow, z5, GripperRight1;
       
!    ENDPROC

    PROC PutCoverOnHeldJar()
        CoverPicked := False;
        !MoveJ Midd1,Normal, z5, GripperRight1;
        !MoveJ Midd2,Normal, z5, GripperRight1;
        MoveJ Midd12,Normal, z5, GripperRight1;
        MoveJ Midd13,Normal, z5, GripperRight1;
        MoveJ Midd14,Normal, z5, GripperRight1;
        WaitUntil JarOnOrangeStation=TRUE;
        MoveJ Midd15,Normal, z5, GripperRight1;
        g_MoveTo 16;
        MoveJ Midd16,Normal, z5, GripperRight1;
        MoveL Midd17,Slow, z5, GripperRight1;
        g_Init \maxSpd := 25, \holdForce := 7;
        WaitTime 1;
        g_GripIn;
        WaitTime 1;
        MoveL Midd16,Normal, z5, GripperRight1;
        MoveJ Midd18,Normal, z5, GripperRight1;
        CoverPicked := TRUE;
        WaitUntil JarHolded=TRUE;
        MoveJ Midd19,Normal, z5, GripperRight1;
        MoveJ HeldJar_AboveJar,Normal, z5, GripperRight1;
        !WaitTime 50;
!        MoveL HeldJar_PlaceCover,slow, z5, GripperRight1;
         MoveL cap1,Slow, z5, GripperRight1;
         MoveL cap2,Slow, z5, GripperRight1;
         WaitTime 2;
         g_JogOut;
         MoveJ HeldJar_AboveJar,Normal, z5, GripperRight1;
         rightArmReadyReadyToPress:= TRUE;
         g_GripIn;
         MoveL cap3,Slow, z5, GripperRight1;
         WaitTime 1;
         rightArmReadyReadyToPress:= false;
         MoveJ HeldJar_AboveJar,Normal, z5, GripperRight1;
       
    ENDPROC
        
    PROC HeldJarTurnCover()
!        g_MoveTo 15;
!        WaitTime 1;
!        MoveJ Held_OpenJarLid_right1, Travel, z5, GripperRight1;
!        g_MoveTo 7;
!        WaitTime 1;
!        MoveAbsJ Held_OpenJarLid_right2, slow, z5, GripperRight1;
!        WaitTime 1;
!        g_MoveTo 14;
!        g_MoveTo 7;
        Held_OpenJarLid_right1 := Held_OpenJarLid_right11_Orig;
        Held_OpenJarLid_right3 := Held_OpenJarLid_right33_Orig;
        Held_OpenJarLid_right1.trans.z := Held_OpenJarLid_right1.trans.z + 5;
        Held_OpenJarLid_right3.trans.z := Held_OpenJarLid_right3.trans.z + 5;
        WaitTime 0.5;
        !MoveJ Held_OpenJarLid_right33_Orig, v1000, z5, GripperRight1;

        g_SetForce 10;
        WaitTime 0.3;
        g_MoveTo 20;
        WaitTime 0.5;
        
        FOR i FROM 1 TO 4 DO
            MoveJ Held_OpenJarLid_right1, v1000, z5, GripperRight1;
            WaitTime 1;
!            g_MoveTo 7;
            if i=1 then
                g_MoveTo 9;
            ELSE
                g_GripIn;
                
            endif
            WaitTime 1;
            IF i<>4 THEN
                Held_OpenJarLid_right3.trans.z := Held_OpenJarLid_right3.trans.z - 1.5;
            endif
            MoveJ Held_OpenJarLid_right3, v1000, z5, GripperRight1;
            WaitTime 1;
            g_MoveTo 14;
            WaitTime 0.5; 
            IF i<>4 THEN
                Held_OpenJarLid_right1.trans.z := Held_OpenJarLid_right1.trans.z - 1.3;
            endif
        ENDFOR
        
!        MoveJ Held_OpenJarLid_right1, v1000, z5, GripperRight1;
!        WaitTime 4;
!        g_GripIn;
!        WaitTime 1;
!        !Held_OpenJarLid_right3.trans.z := Held_OpenJarLid_right3.trans.z ;
!        MoveJ Held_OpenJarLid_right3, v1000, z5, GripperRight1;
!        WaitTime 4;
!        g_MoveTo 14;
!        WaitTime 0.5; 
        MoveJ HeldJar_AboveJar, Slow, z5, GripperRight1;
        MoveJ Midd19, normal, z5, GripperRight1;
        MoveJ Held_RightRest, normal, z5, GripperRight1;
        
        

    ENDPROC
    

    
    
    PROC FillJar_Right()
        g_Init \maxSpd := 25, \holdForce := 10;
        FillJarRready := TRUE;
        WaitUntil FillJarInOpenPosition2Open = TRUE;
        OpenJarLid;
        WaitUntil FillJarInOpenPosition2Close=TRUE;
        TakeOutJarLidAndCloseJar;
        FillJarLidClosed := TRUE;
    ENDPROC
    
    PROC CloseJarLid()
        !MoveAbsJ OpenJarLid_right3, Slow, z5, GripperRight1;
        OpenJarLid_right2.robax.rax_6 := 50;
        MoveAbsJ OpenJarLid_right2, Slow, z5, GripperRight1;
        WaitTime 3;
        OpenJarLid_right2.robax.rax_6 := 85;
        g_MoveTo 19;
        FillJarRightHandReadyforRising := TRUE;
        WaitUntil FillJarLeftHandRaised=TRUE;
        WaitTime 0.5;
        MoveAbsJ OpenJarLid_right3, Travel, z5, GripperRight1;
        WaitTime 10;
        WaitTime 0.5;
        g_GripIn;
        WaitTime 1;
        MoveAbsJ OpenJarLid_right2, Slow, z5, GripperRight1;
        WaitTime 1;
        g_MoveTo 19;
        g_GripIn;
        WaitTime 0.5;
        MoveJ OpenJarLid_right1,Normal, z5, GripperRight1;
        WaitTime 1.5;
        
        g_MoveTo 19;
        WaitTime 0.5;
        MoveAbsJ OpenJarLid_right3, Travel, z5, GripperRight1;
        WaitTime 0.5;
        g_GripIn;
        WaitTime 1;
        MoveAbsJ OpenJarLid_right2, Slow, z5, GripperRight1;
        WaitTime 1;
        g_MoveTo 19;
        g_GripIn;
        WaitTime 0.5; 
        MoveJ OpenJarLid_right1,Normal, z5, GripperRight1;
        WaitTime 1.5;
        
        g_MoveTo 19;
        WaitTime 0.5;
        MoveAbsJ OpenJarLid_right3, Travel, z5, GripperRight1;
        WaitTime 0.5;
        g_GripIn;
        WaitTime 1;
        MoveAbsJ OpenJarLid_right2, Slow, z5, GripperRight1;
        WaitTime 1;
        g_MoveTo 19;
        g_GripIn;
        WaitTime 0.5;
        MoveJ OpenJarLid_right1,Normal, z5, GripperRight1;
        WaitTime 1.5;
        OpenJarLid_right1temp := OpenJarLid_right1;
        OpenJarLid_right1temp.trans.z := OpenJarLid_right1temp.trans.z + 15;
        MoveJ OpenJarLid_right1temp,Normal, z5, GripperRight1;
        
        g_MoveTo 25;
        WaitTime 1;
        MoveL TakeOutJarLidAndCloseJar5,Normal, z5, GripperRight1;
        
    ENDPROC
    
    PROC PutLidInStation()
        g_GripIn;
        MoveJ TakeOutJarLidAndCloseJar4,Normal, z5, GripperRight1;
        MoveL TakeOutJarLidAndCloseJar5, Travel, z5, GripperRight1;
        FillJarLidInPosition := TRUE;
        MoveJ TakeOutJarLidAndCloseJar3, Travel, z5, GripperRight1;
        MoveJ TakeOutJarLidAndCloseJar2, Travel, z5, GripperRight1;
        TakeOutJarLidAndCloseJar1Temp := TakeOutJarLidAndCloseJar1;
        TakeOutJarLidAndCloseJar1Temp.trans.x := TakeOutJarLidAndCloseJar1Temp.trans.x + 3;
        MoveL TakeOutJarLidAndCloseJar1Temp,Normal, z5, GripperRight1;
        WaitTime 1;
        g_MoveTo 25;
        MoveJ Calibration_1, Normal, z5, GripperRight1;
        g_MoveTo 10;
        WaitTime 1;
        MoveL Calibration_2, Slow, z5, GripperRight1;
        WaitTime 1;
        MoveJ Calibration_1, Normal, z5, GripperRight1;
        WaitTime 1;
        MoveJ Calibration_3, Normal, z5, GripperRight1;
        MoveJ TakeOutJarLidAndCloseJar3, Travel, z5, GripperRight1;
        MoveL TakeOutJarLidAndCloseJar5, Travel, z5, GripperRight1;
        
    ENDPROC
    
    PROC TakeOutJarLidAndCloseJar()
        g_MoveTo 19;
        WaitTime 1;
        !MoveJ TakeOutJarLidAndCloseJar4,Normal, z5, GripperRight1;
        !MoveL TakeOutJarLidAndCloseJar5,Normal, z5, GripperRight1;
        MoveJ TakeOutJarLidAndCloseJar3, Travel, z5, GripperRight1;
        MoveJ TakeOutJarLidAndCloseJar2, Travel, z5, GripperRight1;
        MoveL TakeOutJarLidAndCloseJar1,Normal, z5, GripperRight1;
        WaitTime 1;
        g_GripIn;
        MoveJ TakeOutJarLidAndCloseJar2, Travel, z5, GripperRight1;
        MoveJ TakeOutJarLidAndCloseJar3, Travel, z5, GripperRight1;
        MoveL TakeOutJarLidAndCloseJar5, Travel, z5, GripperRight1;
        MoveL TakeOutJarLidAndCloseJar4, Travel, z5, GripperRight1;
        
        !OpenJarLid_right1.trans.z:=OpenJarLid_right1.trans.z+8;
        MoveJ temppp, Slow, z5, GripperRight1;
        
        CloseJarLid;
    ENDPROC
    
    
    PROC OpenJarLid()
        g_MoveTo 19;
        MoveJ TakeOutJarLidAndCloseJar4, Normal, z5, GripperRight1;
        MoveJ OpenJarLid_right1, Normal, z5, GripperRight1;
        WaitTime 1;
        g_GripIn;
        
        MoveAbsJ OpenJarLid_right2, Slow, z5, GripperRight1;
        WaitTime 1;
        g_MoveTo 17;
        g_GripIn;
        MoveAbsJ OpenJarLid_right3, Slow, z5, GripperRight1;
        WaitTime 1.5;
        g_MoveTo 19;
        
        MoveJ OpenJarLid_right1, Travel, z5, GripperRight1;
        WaitTime 0.5;
        g_GripIn;
        MoveAbsJ OpenJarLid_right2, Slow, z5, GripperRight1;
        WaitTime 1;
        g_MoveTo 17;
        g_GripIn;
        MoveAbsJ OpenJarLid_right3, Slow, z5, GripperRight1;
        WaitTime 1.5;
        g_MoveTo 19;
        
        MoveJ OpenJarLid_right1, Travel, z5, GripperRight1;
        WaitTime 0.5;
        g_GripIn;
        MoveAbsJ OpenJarLid_right2, Slow, z5, GripperRight1;
        WaitTime 1;
        g_MoveTo 17;
        g_GripIn;
        MoveAbsJ OpenJarLid_right3, Slow, z5, GripperRight1;
        WaitTime 1.5;
        
        PutLidInStation;
        
    ENDPROC

    PROC FindJarsBothArmsFunctioning()
        WaitUntil FindJars_Lhome = TRUE;
        FindJars_Rhome := FALSE;
        FindingJarsBasedOnStandardDev;
        FindJars_Rhome := TRUE;
    ENDPROC
    
    PROC MovR()
        ! Pos_1
        MoveJ Pos_1,Normal, z5, GripperRight1;
        
        CamSetProgramMode CognexCamera;
        CamStartLoadJob CognexCamera, "JarsDetection_1.job";
        CamWaitLoadJob CognexCamera;
        CamSetExposure CognexCamera \ExposureTime:=10;
        CamSetRunMode CognexCamera;
        CamReqImage CognexCamera \SceneId:= Scene_1;
        FOR i FROM 1 TO 6 DO
            diff := 0;
            CamGetResult CognexCamera, mycamtarget \SceneId:= Scene_1;
            diff := diff + Abs(mycamtarget.val1 - mycamtarget.val2);
            diff := diff + Abs(mycamtarget.val1 - mycamtarget.val3);
            diff := diff + Abs(mycamtarget.val1 - mycamtarget.val4);
            diff := diff + Abs(mycamtarget.val2 - mycamtarget.val3);
            diff := diff + Abs(mycamtarget.val2 - mycamtarget.val4);
            diff := diff + Abs(mycamtarget.val3 - mycamtarget.val4);
            
            IF diff<30 THEN
                MoveJ JarInPosition,Normal, z5, GripperRight1;
            ELSEIF diff>30 THEN
                MoveJ JarNotInPosition,Normal, z5, GripperRight1;
            ENDIF
            MoveJ Pos_1,Normal, z5, GripperRight1;
            WaitTime 1;
        ENDFOR
        WaitTime 2;
        
        
        ! Pos_2
        MoveJ Pos_2,Normal, z5, GripperRight1;
        
        CamSetProgramMode CognexCamera;
        CamStartLoadJob CognexCamera, "JarsDetection_1.job";
        CamWaitLoadJob CognexCamera;
        CamSetExposure CognexCamera \ExposureTime:=10;
        CamSetRunMode CognexCamera;
        CamReqImage CognexCamera \SceneId:= Scene_1;
        FOR i FROM 1 TO 6 DO
            diff := 0;
            CamGetResult CognexCamera, mycamtarget \SceneId:= Scene_1;
            diff := diff + Abs(mycamtarget.val1 - mycamtarget.val2);
            diff := diff + Abs(mycamtarget.val1 - mycamtarget.val3);
            diff := diff + Abs(mycamtarget.val1 - mycamtarget.val4);
            diff := diff + Abs(mycamtarget.val2 - mycamtarget.val3);
            diff := diff + Abs(mycamtarget.val2 - mycamtarget.val4);
            diff := diff + Abs(mycamtarget.val3 - mycamtarget.val4);
            
            IF diff<30 THEN
                MoveJ JarInPosition,Normal, z5, GripperRight1;
            ELSEIF diff>30 THEN
                MoveJ JarNotInPosition,Normal, z5, GripperRight1;
            ENDIF
            MoveJ Pos_2,Normal, z5, GripperRight1;
            WaitTime 1;
        ENDFOR
        WaitTime 2;

        
        
        ! Pos_3
        MoveJ Pos_3,Normal, z5, GripperRight1;
        
        CamSetProgramMode CognexCamera;
        CamStartLoadJob CognexCamera, "JarsDetection_2.job";
        CamWaitLoadJob CognexCamera;
        CamSetExposure CognexCamera \ExposureTime:=10;
        CamSetRunMode CognexCamera;
        CamReqImage CognexCamera \SceneId:= Scene_1;
        FOR i FROM 1 TO 4 DO
            diff := 0;
            CamGetResult CognexCamera, mycamtarget \SceneId:= Scene_1;
            diff := diff + Abs(mycamtarget.val1 - mycamtarget.val2);
            diff := diff + Abs(mycamtarget.val1 - mycamtarget.val3);
            diff := diff + Abs(mycamtarget.val1 - mycamtarget.val4);
            diff := diff + Abs(mycamtarget.val2 - mycamtarget.val3);
            diff := diff + Abs(mycamtarget.val2 - mycamtarget.val4);
            diff := diff + Abs(mycamtarget.val3 - mycamtarget.val4);
            
            IF diff<30 THEN
                MoveJ JarInPosition,Normal, z5, GripperRight1;
            ELSEIF diff>30 THEN
                MoveJ JarNotInPosition,Normal, z5, GripperRight1;
            ENDIF
            MoveJ Pos_3,Normal, z5, GripperRight1;
            WaitTime 1;
        ENDFOR
        WaitTime 2;

        
        ! Pos_4
        MoveJ Pos_4,Normal, z5, GripperRight1;
        
        CamSetProgramMode CognexCamera;
        CamStartLoadJob CognexCamera, "JarsDetection_2.job";
        CamWaitLoadJob CognexCamera;
        CamSetExposure CognexCamera \ExposureTime:=10;
        CamSetRunMode CognexCamera;
        CamReqImage CognexCamera \SceneId:= Scene_1;
        FOR i FROM 1 TO 4 DO
            diff := 0;
            CamGetResult CognexCamera, mycamtarget \SceneId:= Scene_1;
            diff := diff + Abs(mycamtarget.val1 - mycamtarget.val2);
            diff := diff + Abs(mycamtarget.val1 - mycamtarget.val3);
            diff := diff + Abs(mycamtarget.val1 - mycamtarget.val4);
            diff := diff + Abs(mycamtarget.val2 - mycamtarget.val3);
            diff := diff + Abs(mycamtarget.val2 - mycamtarget.val4);
            diff := diff + Abs(mycamtarget.val3 - mycamtarget.val4);
            
            IF diff<30 THEN
                MoveJ JarInPosition,Normal, z5, GripperRight1;
            ELSEIF diff>30 THEN
                MoveJ JarNotInPosition,Normal, z5, GripperRight1;
            ENDIF
            MoveJ Pos_4,Normal, z5, GripperRight1;
            WaitTime 1;
        ENDFOR
        WaitTime 2;

    ENDPROC
    
    PROC MovR2()
        FOR i FROM 1 TO 20 DO
            MoveJ G{i},Normal, z5, GripperRight1;
            CamSetProgramMode CognexCamera;
            CamStartLoadJob CognexCamera, "JarsDetection_3.job";
            CamWaitLoadJob CognexCamera;
            CamSetExposure CognexCamera \ExposureTime:=100;
            CamSetRunMode CognexCamera;
            CamReqImage CognexCamera \SceneId:= Scene_1;
        
            diff := 0;
            CamGetResult CognexCamera, mycamtarget \SceneId:= Scene_1;
            diff := diff + Abs(mycamtarget.val1 - mycamtarget.val2);
            diff := diff + Abs(mycamtarget.val1 - mycamtarget.val3);
            diff := diff + Abs(mycamtarget.val1 - mycamtarget.val4);
            diff := diff + Abs(mycamtarget.val2 - mycamtarget.val3);
            diff := diff + Abs(mycamtarget.val2 - mycamtarget.val4);
            diff := diff + Abs(mycamtarget.val3 - mycamtarget.val4);   
            
            IF diff<120 THEN
                Temp := G{i};
                Temp.trans.z := Temp.trans.z + 25;
                MoveJ Temp,Normal, z5, GripperRight1;
                WaitTime 0.2;
                Temp.trans.z := Temp.trans.z - 25;
                MoveJ Temp,Normal, z5, GripperRight1;
                WaitTime 0.2;
            ELSEIF diff>120 THEN
                
            ENDIF
            
        ENDFOR
        
        MoveJ Middle,Normal, z5, GripperRight1;
        MoveJ G{1},Normal, z5, GripperRight1;
        

    ENDPROC
    
    PROC MOV2_1()        
        
        L_Capture:=FALSE;
        PhotoTakenandPatternDetected:=FALSE;
        R_Home:=FALSE;
        TakeFistImage := FALSE;
        TakeSecondImage := FALSE;
            

        
        WaitUntil TakeFistImage=TRUE;
        FindJars_RightArm;
        
        WaitUntil TakeSecondImage=TRUE;
        FindJars_RightArm;
    ENDPROC
    
    PROC robRINIT()
        g_init;
        g_gripout;
        g_stop;
        MotionSup\Off; 
        MoveJ CameraHome,Travel, z5, GripperRight1;
    ENDPROC
    
    PROC GrabDispenser()
        MoveJ HoToDis,Travel, z5, GripperRight1;
        MoveJ DisPClose,Fast, z5, GripperRight1;
        WaitTime 1; 
        MoveL DisP,Slow, z5, GripperRight1;
        WaitTime 1;
        g_gripIn;
        WaitTime 0.5;
        MoveL DisPAbove,Slow, z5, GripperRight1;
    ENDPROC
    
    PROC PutDispenser()
        MoveL DisPAbove,Slow, z5, GripperRight1;
        MoveL DisP,Slow, z5, GripperRight1;
        WaitTime 1; 
        g_gripout;
        WaitTime 0.5;
        g_stop; 
        MoveL DisPClose,Fast, z5, GripperRight1;
        MoveJ HoToDis,Travel, z5, GripperRight1;
        MoveJ CameraHome,Travel, z5, GripperRight1;
    ENDPROC
    
    
    PROC NozzleEquip()
        
        MoveJ Noz1Above,Fast, z5, GripperRight1;
        WaitTime 0.5;
        MoveJ Noz1SLAbove,Normal, z5, GripperRight1;
        WaitTime 1;
        MoveL Noz1,VerySlow, z5, GripperRight1;
        WaitTime 1;
        MoveJ Noz1SLAbove,Slow, z5, GripperRight1;
        MoveJ Noz1Above,Normal, z5, GripperRight1;
        WaitTime 1;
        MoveL NozHome,Normal, z5, GripperRight1;
        WaitTime 6;
!        g_stop;
         
!        FOR i FROM 0 TO 3 DO
!            FOR b FROM 0 TO 5 DO
!                NozTempAbove:= Noz1Above;
!                NozTemp:=Noz1;
!                NozTempAbove.trans.x := NozTempAbove.trans.x - 15*b;
!                NozTempAbove.trans.y := NozTempAbove.trans.y + 15*i;
!                NozTemp.trans.x := NozTemp.trans.x - 15*b;
!                NozTemp.trans.y := NozTemp.trans.y + 15*i;
!                MoveJ NozTempAbove,Fast, z5, GripperRight1;
!                WaitTime 0.5;
!                MoveL NozTemp,VerySlow, z5, GripperRight1;
!                WaitTime 1;
!                MoveL NozTempAbove,Normal, z5, GripperRight1;
!                WaitTime 2;
!            ENDFOR
!        ENDFOR
    ENDPROC
    
    
    PROC FindJars_RightArm()
        L_Capture:=FALSE;
        PhotoTakenandPatternDetected:=FALSE;
        R_Home:=FALSE;
        MotionSup\Off;
        MoveJ CameraHome, Travel, z5, GripperRight1;
        
        WaitUntil L_Home = TRUE;
        MoveJ CameraCapture, Travel, z5, GripperRight1;
        L_Capture := TRUE;
        WaitUntil PhotoTakenandPatternDetected = TRUE;
        MoveJ CameraHome, Travel, z5, GripperRight1;
        R_Home := TRUE;
        
    ENDPROC
    
    
    PROC FindingJarsBasedOnStandardDev() 
        EstablishCommunication;
        FOR i FROM 1 TO 20 DO
            MoveJ G{i},Travel, z5, GripperRight1;
            WaitTime 0.3;
            CamSetProgramMode CognexCamera;
            CamStartLoadJob CognexCamera, "FindingJarsBasedOnStandardDev.job";
            CamWaitLoadJob CognexCamera;
            FOR j FROM 1 TO 15 Do
                CamSetExposure CognexCamera \ExposureTime:=5+j;
                CamSetRunMode CognexCamera;
                CamReqImage CognexCamera \SceneId:= Scene_1;
                CellValue:=GetCellValue(CellNumber);
                !CellValueStr:=valtostr(cellvalue);
                !stringReceived := CellNumber + "  " + CellValueStr;
                !TPWrite stringReceived;
                SDEV{i,j}:=CellValue;
            ENDFOR
            draft:=CalculateDiffInSDev(i);
            
            IF draft<300 THEN
                IsJarinPosition{i}:=TRUE;
            ELSEIF CellValue>300 THEN
                IsJarinPosition{i}:=FALSE;
            ENDIF
            CellValueStr:=valtostr(IsJarinPosition{i});
            TPWrite CellValueStr\num:=draft;

        ENDFOR
        
        MoveJ Middle,Normal, z5, GripperRight1;
        MoveJ CameraHome,Normal, z5, GripperRight1;

    ENDPROC

    func num CalculateDiffInSDev(intnum i)
            draft:=0;
            FOR j FROM 1 TO 14 DO
                FOR k FROM j+1 TO 15 DO
                    draft:= draft + abs(SDev{i,j} - SDev{i,k});
                ENDFOR 
            ENDFOR
            
            RETURN draft;
    ENDfunc
    
        PROC EstablishCommunication()
  
        Start:
       
        SocketClose socket1;
        SocketCreate socket1;
        SocketConnect socket1, "192.168.125.204", 23;
        TPWrite "Connect sussessful!";
        SocketReceive socket1\Str:=stringReceived;
        TPWrite "server say_" + stringReceived;
        SocketSend socket1\Str:="admin\0d\0a";
        SocketReceive socket1\Str:=stringReceived;
        IF stringReceived <> "Password: " THEN
            TPErase;
            TPWrite "Vision Login Error(Password Prompt)";
            Stop;
            GOTO Start;
        ENDIF
        TPWrite stringReceived;
        SocketSend socket1\Str:="\0d\0a";
        SocketReceive socket1\Str:=stringReceived;
        TPWrite stringReceived;
        IF stringReceived <> "User Logged In\0d\0a" THEN
            TPErase;
            TPWrite "Vision Login Error( Uers Login prompt)";
            Stop;
            GOTO Start;
        ENDIF
        TPErase;
    ENDPROC
    
    Func num GetCellValue(string cellnumber)
        SocketSend socket1\Str:="gv"+cellnumber+"\0d\0a";
        SocketReceive socket1\Str:=stringReceived;
        CellValueStr:= StrPart(stringReceived, 3, StrLen(stringReceived)-2);
        ok:=StrToVal(CellValueStr,cellValueNum);
         !IF ok THEN
         !   TPWrite "good";
        !ELSE
         !  TPWrite "bad";  
        !ENDIF
        !TPWrite CellValueStr\num:=CellValueNum;
        RETURN CellValueNum;
    ENDFUNC
    
    
    
    PROC  MovForNozzle() !I replaced NozNum with global variable since we need it in analysis proc also. It is going to be helpful, when we'll have to incorporate analysis proc into main workflow. 
        VAR num Row := 0;
!
        VAR num Column := 0;
        VAR num i:=0;
        MoveJ FillPippete5_2, Normal, z5, GripperRight1;  ! was normal
        Row := (NozzelNumber - 1) DIV 6;
        Column := NozzelNumber - Row*6;
        TPWrite"infun"\Num:=NozzelNumber;
        IF NozzelNumber >24 THEN !delete the condition and all references to i in this PROC 30/9/2022
            i:=2;
        EndIf
        
        FirstOne := FirstOneOriginal;
        FirstOne.trans.z := FirstOne.trans.z + 20;
        FirstOne.trans.y := FirstOne.trans.y + 20*Row+i;
        FirstOne.trans.x := FirstOne.trans.x - 20*(Column-1);
        
        MoveJ FirstOne, Normal, z5, GripperRight1;                                                                                        
        !MoveJ FirstOneOriginal, Normal, z5, GripperRight1;
        WaitTime 0.5;
        FirstOne.trans.z := FirstOne.trans.z - 50.5;! it was 50 it was 55.5
        MoveL FirstOne, slow, z5, GripperRight1; 
        WaitTime 1;
        ! added the condition for 20 21 13 14 19 to prevent the robot from hitting the cabinate holder
        IF NozzelNumber = 20 THEN
            MoveL FirstOne_20, Normal, z5, GripperRight1;
        ELSEIF NozzelNumber = 21 THEN
            MoveL FirstOne_21, Normal, z5, GripperRight1;
        ELSEIF NozzelNumber = 13 THEN
            MoveL FirstOne_13, Normal, z5, GripperRight1;
        ELSEIF NozzelNumber = 14 THEN
            MoveL FirstOne_14, Normal, z5, GripperRight1;
        ELSEIF NozzelNumber = 19 THEN
            MoveL FirstOne_19, Normal, z5, GripperRight1;
        ELSEIF NozzelNumber = 5 THEN
            movel FirstOne_5, Normal, z5, GripperRight1;
        ELSEIF NozzelNumber = 11 THEN
            movel FirstOne_11, Normal, z5, GripperRight1;
        ELSE
            FirstOne.trans.z := FirstOne.trans.z + 146;!it was 146 20/10/2022
            
!            FirstOne.extax.eax_a:=FirstOne.extax.eax_a-30;
            MoveL FirstOne, Normal, z5, GripperRight1; ! was normal
        ENDIF
        
        
        IF NozzelNumber= 18 THEN
            MoveL FirstOne_18, Normal, z5, GripperRight1;
        ENDIF
        WaitTime 0.5;
        
    ENDPROC
    
    PROC MovForNozzles()
        FOR j FROM 1 TO 4 STEP 2 DO
            FirstOne := FirstOneOriginal;
            FOR i FROM 1 TO 6 STEP 2 DO
                FirstOne.trans.z := FirstOne.trans.z + 20;
                MoveJ FirstOne, Normal, z5, GripperRight1;
                WaitTime 3;
                FirstOne.trans.z := FirstOne.trans.z - 55;
                MoveL FirstOne, Slow, z5, GripperRight1; 
                WaitTime 1;
                FirstOne.trans.z := FirstOne.trans.z + 145;
                MoveL FirstOne, Normal, z5, GripperRight1;
                WaitTime 1;
!                FirstOne.trans.x := FirstOne.trans.x - 20*2;
!                FirstOne.trans.z := FirstOne.trans.z - 110;
                
!                WaitTime 2;
            ENDFOR
!            FirstOneOriginal.trans.y := FirstOneOriginal.trans.y + 20*2;
        ENDFOR

        
    ENDPROC
    
        
    
    PROC PutUsedFilterInPlate()
        g_GripOut;
        MoveJ CameraHome, Travel, z5, GripperRight1;
        MoveJ PutUsedFilterInPlate1, Normal, z5, GripperRight1;
        MoveJ PutUsedFilterInPlate2, Normal, z5, GripperRight1;
        MoveJ PutUsedFilterInPlate3, Normal, z5, GripperRight1;
        MoveJ PutUsedFilterInPlate4, Normal, z5, GripperRight1;
        MoveJ PutUsedFilterInPlate5, Travel, z5, GripperRight1;
        MoveJ PutUsedFilterInPlate6, slow, z5, GripperRight1;
        MoveJ PlateInPlace, Slow, z5, GripperRight1;
        waittime 10;
        PlateInPosition := TRUE;
        waittime 5;
        MoveJ PutUsedFilterInPlate6, Normal, z5, GripperRight1;
        MoveJ PutUsedFilterInPlate5, Travel, z5, GripperRight1;
        MoveJ CameraHome, Travel, z5, GripperRight1;
    ENDPROC
    
    PROC PickNewFilterAndPlaceItOnMissile()
        
        MoveJ CameraHome, Travel, z5, GripperRight1;
!        MoveJ PickNewFilter1, Travel, z5, GripperRight1;
        g_VacuumOn1 ;
        Movej AboveFiltersContainer1_1, Travel, z5, GripperRight1;
        Movej AboveFiltersContainer1, Travel, z5, GripperRight1;
        MoveL InsideFiltersContainer1, slow, z5, GripperRight1;
        waittime 0.5;
        MoveL AboveFiltersContainer2, slow, z5, GripperRight1;
        waittime 0.5;
        MoveL AboveFiltersContainer3, VerySlow, z5, GripperRight1;
        waittime 2;
        g_VacuumOff1;
        waittime 0.5;
        MoveL InsideFiltersContainer2, slow, z5, GripperRight1;
        waittime 0.5;
        g_VacuumOn1;
        waittime 0.5;
        MoveL InsideFiltersContainer3, slow, z5, GripperRight1;
        waittime 1;
        MoveL AboveFiltersContainer4, Slow, z5, GripperRight1;
        waittime 0.5;
!        MoveL AboveFiltersContainer1, Slow, z5, GripperRight1;
!        waittime 0.5;
        MoveJ PickNewFilter1, Normal, z5, GripperRight1;
        MoveJ PickNewFilter3, Normal, z5, GripperRight1;
        MoveJ FilterAboveBigJar, Normal, z5, GripperRight1;
        MoveJ PlaceFilterOnBigJar, slow, z5, GripperRight1;
        WaitTime 1;
        g_VacuumOff1;
        WaitTime 0.5;
        MoveJ FilterAboveBigJar, Normal, z5, GripperRight1;
        MoveJ PickNewFilter3, Travel, z5, GripperRight1;
        MoveJ CameraHome, Travel, z5, GripperRight1;
    ENDPROC
       
    PROC PickAndPlaceFunnel()
        MoveJ PickNewFilter1, Travel, z5, GripperRight1;
        !MoveJ PickAndPlaceFunnel2, Travel, z5, GripperRight1;
        g_GripOut;
        MoveJ AboveFunnel, Normal, z5, GripperRight1;
        MoveL AroundFunnel, VerySlow, z5, GripperRight1;
        waittime 2;
        g_Init \maxSpd := 25, \holdForce := 5;
        g_GripIn;
        waittime 0.5;
        MoveL AboveFunnel, Slow, z5, GripperRight1;
        MoveJ PickAndPlaceFunnel3, Normal, z5, GripperRight1;
        MoveJ PickAndPlaceFunnel4, Normal, z5, GripperRight1;
        MoveJ FunnelAboveBigJar, Normal, z5, GripperRight1;
        Movel FunnelOnBigJar, Slow, z5, GripperRight1;
        waittime 2;
        g_MOVETO 23.5;
        
    ENDPROC
    
    PROC RturnFunnelToHomePosition()    
        g_gripin;
        MoveL FunnelAboveBigJar, Slow, z5, GripperRight1;
        MoveJ PickAndPlaceFunnel4, Normal, z5, GripperRight1;
        MoveJ PickAndPlaceFunnel3, Normal, z5, GripperRight1;
        MoveJ AboveFunnel, Normal, z5, GripperRight1;
        MoveL AroundFunnel, Slow, z5, GripperRight1;
        waittime 1;
        g_GripOut;
        waittime 1;
        MoveL AboveFunnel, Slow, z5, GripperRight1;
        !MoveJ PickAndPlaceFunnel2, Normal, z5, GripperRight1;
        MoveJ PickNewFilter1, Travel, z5, GripperRight1;
        MoveJ CameraHome, Travel, z5, GripperRight1;
    ENDPROC
    
    PROC FilterFormMissileToPlate()
        MoveJ CameraHome, Travel, z5, GripperRight1;
        MoveJ FilterFormMissileToPlate1, Travel, z5, GripperRight1;
        MoveJ FilterFormMissileToPlate2, Normal, z5, GripperRight1;
        g_VacuumOn1;
        MoveJ FilterFormMissileToPlate3, Slow, z5, GripperRight1;
        WaitTime 1;
        MoveJ FilterFormMissileToPlate2, VerySlow, z5, GripperRight1;
        MoveJ FilterFormMissileToPlate4, Slow, z5, GripperRight1;
        MoveJ FilterFormMissileToPlate5, Slow, z5, GripperRight1;
        WaitTime 1;
        g_VacuumOff1;
        MoveJ FilterFormMissileToPlate4, Normal, z5, GripperRight1;
        MoveJ FilterFormMissileToPlate1, Normal, z5, GripperRight1;
        MoveJ CameraHome, Travel, z5, GripperRight1;
        
    ENDPROC
    PROC PushFilter()
        MoveJ CameraHome, Travel, z5, GripperRight1;
        MoveJ PickNewFilter3, Travel, z5, GripperRight1;
        MoveJ PushFilter1, Travel, z5, GripperRight1;
        MoveL PushFilter2, Slow, z5, GripperRight1;
        MoveL PushFilter3, VerySlow, z5, GripperRight1;
        MoveL PushFilter4, VerySlow, z5, GripperRight1;
        MoveL PushFilter5, VerySlow, z5, GripperRight1;
        MoveL PushFilter6, VerySlow, z5, GripperRight1;
        MoveL PushFilter20, VerySlow, z5, GripperRight1;
        waittime 1;
        MoveL PushFilter7, Slow, z5, GripperRight1;
        MoveL PushFilter8, Slow, z5, GripperRight1;        
        MoveJ PushFilter9, Travel, z5, GripperRight1;
        FilterShifted := TRUE;
        WaitUntil FilterLifted = TRUE;

        MoveJ PushFilter15, Normal, z5, GripperRight1;
        MoveJ PushFilter16, Slow, z5, GripperRight1;
        g_MoveTo 10;
        MoveL PushFilter17, Slow, z5, GripperRight1;
        MoveL PushFilter18, Slow, z5, GripperRight1;
        MoveL PushFilter17, Slow, z5, GripperRight1;
        MoveL PushFilter16, Slow, z5, GripperRight1;
        MoveJ PushFilter15, Slow, z5, GripperRight1;
        MoveJ PushFilter9, Slow, z5, GripperRight1;
        
        g_VacuumOn1;
        MoveJ PushFilter10, Normal, z5, GripperRight1;
        MoveJ PushFilter11, VerySlow, z5, GripperRight1;
        waittime 1;
        MoveL PushFilter12, Slow, z5, GripperRight1;
        FilterPicked := TRUE;
        MoveJ PushFilter13, Slow, z5, GripperRight1;
        waittime 1;
        g_VacuumOff1;
        MoveJ PushFilter14, Normal, z5, GripperRight1;
        MoveJ CameraHome, Travel, z5, GripperRight1;
        
    ENDPROC
    
    PROC BorderingFilterToPutInPlate()
        MoveJ CameraHome, Normal, z5, GripperRight1;
        g_GripIn;
        waittime 0.5;
        g_Stop;
        MoveJ BorderingFilterToPutInPlate1, Travel, z5, GripperRight1;
        MoveJ BorderingFilterToPutInPlate2, Travel, z5, GripperRight1, \WObj:=vacuumTowerR;
        MoveJ BorderingFilterToPutInPlate3, Normal, z5, GripperRight1, \WObj:=vacuumTowerR;
        Movel BorderingFilterToPutInPlate4, Slow, z5, GripperRight1, \WObj:=vacuumTowerR;
        Movel BorderingFilterToPutInPlate5, VerySlow, z5, GripperRight1, \WObj:=vacuumTowerR;
        R_GripperInPosition5 := TRUE;
        WaitUntil DoneWithPosition5 = TRUE;
        g_MoveTo 24;
        WaitTime 0.5;
        Movel BorderingFilterToPutInPlate4, Normal, z5, GripperRight1;
        R_GripperInPosition4 := TRUE;
        WaitUntil DoneWithPosition4 = TRUE;
        g_MoveTo 24;
        WaitTime 0.5;
        
        MoveJ BorderingFilterToPutInPlate3, Normal, z5, GripperRight1;
!        R_GripperInPosition3 := TRUE;
!        WaitUntil DoneWithPosition3 = TRUE;
!        Movel BorderingFilterToPutInPlate6, Normal, z5, GripperRight1;
        MoveJ BorderingFilterToPutInPlate2, Normal, z5, GripperRight1;
        MoveJ BorderingFilterToPutInPlate1, Travel, z5, GripperRight1;
        MoveJ CameraHome, Travel, z5, GripperRight1;
    ENDPROC
    PROC MOV2_4()
        ZeroingVariables;
        BorderingFilterToPutInPlate;
        PutUsedFilterInPlate;
    ENDPROC
    
    PROC PickPlate()
        
        ! 14.5 mm is the thickness of one plate
        g_GripIn;
!        NumberOfPlates := 9;
        MoveJ CameraHome, Travel, z5, GripperRight1;
        MoveJ PickPlate1, Travel, z5, GripperRight1;
        MoveJ PickPlate2, Travel, z5, GripperRight1;
        Movej PickPlate10_4, Travel, z5, GripperRight1;
        MoveL PickPlate11_Down, Travel, z5, GripperRight1;
        
        !in case we have too many plates
        PickPlate11_Up.trans.z := 100 + PlateThick*NumberOfPlates + 30;
        MoveL PickPlate11_Up, Normal, z5, GripperRight1;
        
        g_VacuumOn2;
        PickPlate12.trans.z := 100 + PlateThick*NumberOfPlates + 30;
        MoveL PickPlate12, Normal, z5, GripperRight1;
        
        IF NumberOfPlates>5 THEN
            PickPlate13.trans.z := 100 + PlateThick*NumberOfPlates;
        ELSEIF NumberOfPlates>2 THEN
            PickPlate13.trans.z := 100 + PlateThick*NumberOfPlates - 1.5;
        ELSE
            PickPlate13.trans.z := 100 + PlateThick*NumberOfPlates - 2.5;
        ENDIF
        MoveL PickPlate13, Slow, z5, GripperRight1;
        waittime 1.5;
        MoveL PickPlate12, Slow, z5, GripperRight1;
        !in case of too many plates
        MoveL PickPlate11_Up, Normal, z5, GripperRight1;
        MoveL PickPlate11_Down, Normal, z5, GripperRight1;
        !MoveL PickPlate10_1, Normal, z5, GripperRight1;
        MoveL PickPlate10_2, Slow, z5, GripperRight1;
        waittime 1;
        g_VacuumOff2;
        g_BlowOn2;
        WaitTime 1;
        g_BlowOff2;
        MoveL PickPlate10_3, Normal, z5, GripperRight1;
        MoveL PickPlate9, Travel, z5, GripperRight1;
        MoveJ PickPlate8, Travel, z5, GripperRight1;
        g_MoveTo 8;
        MoveJ PickPlate7, Normal, z5, GripperRight1;
        MoveL PickPlate6, VerySlow, z5, GripperRight1;
        WaitTime 1;
        MoveL PickPlate7, Slow, z5, GripperRight1;
        
        
        Movej PickPlate10_4, Travel, z5, GripperRight1;
        MoveL PickPlate11_Down, Travel, z5, GripperRight1;
        MoveL PickPlate11_Up, Normal, z5, GripperRight1;
        g_VacuumOn2;
        MoveL PickPlate12, Normal, z5, GripperRight1;
        ! 14.5 mm is the thickness of one plate
        IF NumberOfPlates>4 THEN
            PickPlate13.trans.z := 100 + PlateThick*NumberOfPlates - PlateThick + 2;
        ELSEIF NumberOfPlates>2 THEN
            PickPlate13.trans.z := 100 + PlateThick*NumberOfPlates - PlateThick + 0.5;
        ELSE
            PickPlate13.trans.z := 100 + PlateThick*NumberOfPlates - PlateThick - 0.5;
        ENDIF
        MoveL PickPlate13, Slow, z5, GripperRight1;
        waittime 1.5;
        PickPlate13.trans.z := 100 + PlateThick*NumberOfPlates + PlateThick;
        MoveL PickPlate13, Normal, z5, GripperRight1;
        ! add point to throw away the cover
        Movej PickPlate14_ThrowPlateCover, Normal, z5, GripperRight1;
        waittime 0.5;
        g_BlowOn2;
        WaitTime 0.5;
        g_BlowOff2;
        !Movej PickPlate12, Normal, z5, GripperRight1;
        !in case of too many plates
        MoveL PickPlate11_Up, Normal, z5, GripperRight1;
        MoveL PickPlate11_Down, Normal, z5, GripperRight1;
        Movej PickPlate10_4, Normal, z5, GripperRight1;
        
        MoveJ PickPlate5, Normal, z5, GripperRight1;
        g_GripOut;
        MoveJ PickPlate4, Normal, z5, GripperRight1;
        MoveL PickPlate3, VerySlow, z5, GripperRight1;
        waittime 3;
        g_GripIn;
        MoveL PickPlate4, Normal, z5, GripperRight1;
        MoveJ PickPlate2, Travel, z5, GripperRight1;
        MoveJ PickPlate1, Travel, z5, GripperRight1;
        NumberOfPlates := NumberOfPlates - 1;
    ENDPROC
    
    PROC MovePlateToNearMissile()
        MoveJ PutUsedFilterInPlate6, Travel, z5, GripperRight1;
        MoveJ PlateInPlace, Slow, z5, GripperRight1;
    ENDPROC
    
    PROC PutPlateInCapinet()
        MoveJ PutPlateInCapinet1PreMoving, Travel, z5, GripperRight1;
        
        MoveJ PutPlateInCapinet1, Travel, z5, GripperRight1;
!        MoveJ PutPlateInCapinet2, Travel, z5, GripperRight1;
!        MoveJ PutPlateInCapinet3, Normal, z5, GripperRight1;
        MoveJ PutPlateInCapinet4, Normal, z5, GripperRight1;
        MoveL PutPlateInCapinet5, Slow, z5, GripperRight1;
        
        waittime 1;
        g_GripOut;
        MoveJ PutPlateInCapinet6, Slow, z5, GripperRight1;
!        MoveJ PutPlateInCapinet3, Slow, z5, GripperRight1;
        MoveJ PutPlateInCapinet2, Normal, z5, GripperRight1;!must be travel 12-08-2022
        MoveJ CameraHome, Travel, z5, GripperRight1;
    ENDPROC

    PROC TakePlateOut()
        
!        MoveJ PutPlateInCapinet3, Slow, z5, GripperRight1;
        MoveJ CameraHome, Travel, z5, GripperRight1;
        MoveJ PutPlateInCapinet2, Travel, z5, GripperRight1;
        waittime 1;
        g_SetForce 15;
        g_GripOut;
        
        MoveJ AbovePlateInCloset, Normal, z5, GripperRight1;
        Movel AroundPlateInCloset, Slow, z5, GripperRight1;
        WaitTime 1;
        g_GripIn;
        Movel AbovePlateInCloset, Slow, z5, GripperRight1;
        MoveJ TakePlateOut1, Normal, z5, GripperRight1;
        MoveJ PutPlateInCapinet1, Normal, z5, GripperRight1;
        MoveJ TakePlateOut2, Normal, z5, GripperRight1;
        MoveJ PlateAboveBigJar, Normal, z5, GripperRight1;
        MoveL PlateOnBigJar, Slow, z5, GripperRight1;
        waittime 1;
        g_GripOut;
        MoveL PlateAboveBigJar, Slow, z5, GripperRight1;
        MoveJ PutPlateInCapinet1, Normal, z5, GripperRight1;
        
        
        
    ENDPROC
    PROC removePlateAfterAnalysis(var bool needToRemove) !Plate was still on top of the vacuum filter, had to add a proc to remove it before new filtration cycle
            IF needToRemove = true then
                MoveJ Held_RightRest, normal, z5, GripperRight1;
                g_GripOut;
                MoveJ CameraHome, normal, z5, GripperRight1;
                MoveJ PutPlateInCapinet1, Normal, z5, GripperRight1;
                MoveJ TakePlateOut2, Normal, z5, GripperRight1;
                MoveJ PlateAboveBigJar, Normal, z5, GripperRight1;
                MoveL PlateOnBigJar, Slow, z5, GripperRight1;
                waittime 1;
                g_GripIn;
                MoveL PlateAboveBigJar, Slow, z5, GripperRight1;
                MoveJ PutPlateInCapinet1, Normal, z5, GripperRight1;
                MoveJ CameraHome, normal, z5, GripperRight1;
                MoveJ Held_RightRest, normal, z5, GripperRight1;
                waittime 1;
                g_GripOut;
                filterNeedsRemoval:=FALSE;
            ENDIF
    ENDPROC
    
    PROC PickFilterForAnalysisProc()
        g_GripIn;
        MoveJ PickFilterForAnalysis1, Normal, z5, GripperRight1;
        !RightArmWaiting :=TRUE;
        !WaitUntil VaccumIsOn = TRUE;
        WaitTime 0.5;
        g_VacuumOn1 ;
        MoveJ AboveFilterForAnalysis, Normal, z5, GripperRight1;
        MoveL PickFilterForAnalysis, Slow, z5, GripperRight1;
        waittime 0.2;
        MoveL AboveFilterForAnalysis, VerySlow, z5, GripperRight1;
        MoveJ PickFilterForAnalysis1, Normal, z5, GripperRight1;
        FilterRemovedFromPlate := TRUE;
        
    ENDPROC
    

    PROC MoveFilterForAnalysis()
        !MoveJ MoveFilterForAnalysis1, Slow, z5, GripperRight1;
        !MoveJ MoveFilterForAnalysis2, Slow, z5, GripperRight1;
        MoveJ MoveFilterForAnalysis3, Slow, z5, GripperRight1;
        MoveJ MoveFilterForAnalysis4, Normal, z5, GripperRight1;
        MoveJ MoveFilterForAnalysis5, Normal, z5, GripperRight1;
        MoveJ MoveFilterForAnalysis6, Normal, z5, GripperRight1;
        MoveJ MoveFilterForAnalysis7, Normal, z5, GripperRight1;
        MoveJ MoveFilterForAnalysis8, Slow, z5, GripperRight1;
        MoveL MoveFilterForAnalysis9, Slow, z5, GripperRight1;
        Waittime 1;
        g_VacuumOff1;
        Movel MoveFilterForAnalysis8, Slow, z5, GripperRight1;
        MoveJ MoveFilterForAnalysis7, Normal, z5, GripperRight1;
        MoveJ MoveFilterForAnalysis6, Normal, z5, GripperRight1;
        MoveJ MoveFilterForAnalysis5, Normal, z5, GripperRight1;
        MoveJ MoveFilterForAnalysis4, Normal, z5, GripperRight1;
        MoveJ MoveFilterForAnalysis3, Travel, z5, GripperRight1;
        MoveJ CameraHome, Normal, z5, GripperRight1;
        
  
    ENDPROC
    
    
    
    
    
    PROC CloseCapinet()
        g_GripIn;
        MoveJ CameraHome, Travel, z5, GripperRight1;
        MoveJ CloseCapinet1, Travel, z5, GripperRight1;
        MoveJ CloseCapinet2, Travel, z5, GripperRight1;
        MoveJ CloseCapinet3, Travel, z5, GripperRight1;
        MoveJ CloseCapinet4, Normal, z5, GripperRight1;
        MoveJ CloseCapinet5, Slow, z5, GripperRight1;
        MoveJ CloseCapinet6, Normal, z5, GripperRight1;
        MoveJ CloseCapinet7, Normal, z5, GripperRight1;
        MoveJ CloseCapinet8, Normal, z5, GripperRight1;
        MoveJ CloseCapinet9, Normal, z5, GripperRight1;
        reset custom_DO_7;
        MoveJ CloseCapinet10, Slow, z5, GripperRight1;
        waittime 1;
        MoveJ CloseCapinet9, Normal, z5, GripperRight1;
        MoveJ CloseCapinet8, Travel, z5, GripperRight1;
        MoveJ CameraHome, Travel, z5, GripperRight1;
        
    ENDPROC
    
    PROC MovePlateFromStackToRedLocation()
        MoveJ MovePlateFromStackToRedLocation1, Normal, z5, GripperRight1;
        MoveJ MovePlateFromStackToRedLocation2, Normal, z5, GripperRight1;
        MoveJ MovePlateFromStackToRedLocation3, Normal, z5, GripperRight1;
        MoveJ MovePlateFromStackToRedLocation4, Normal, z5, GripperRight1;
        MoveJ MovePlateFromStackToRedLocation5, Normal, z5, GripperRight1;
        MoveJ MovePlateFromStackToRedLocation6, Normal, z5, GripperRight1;
        MoveJ MovePlateFromStackToRedLocation7, Normal, z5, GripperRight1;
        MoveJ MovePlateFromStackToRedLocation8, Normal, z5, GripperRight1;
        
    ENDPROC
    
    PROC ZeroingVariablesForMOV2_3()
        FunnelInPosition := FALSE;
        PlateInPosition := FALSE;
        CapinetOpened := FALSE;
        R_GripperInPosition5 := FALSE;
        R_GripperInPosition4 := FALSE;
        R_GripperInPosition3 := FALSE;
        DoneWithPosition3 := FALSE;
        DoneWithPosition4 := FALSE;
        DoneWithPosition3 := FALSE;
        PlateAlreadyInCapinet := FALSE;
        filterDis:=FALSE;
        reg1:=0;
    ENDPROC
    
    proc membraneFiltration(var Bool DoINeedToClose)
        ZeroingVariablesForMOV2_3;
        PickNewFilterAndPlaceItOnMissile;
!        WHILE reg1 <> 4 DO
!            TPErase;
!            TPReadFK reg1, "Filter assembled?", stEmpty, stEmpty, stEmpty, "Yes", "No";
!        ENDWHILE
!        reg1:=0;
        PickAndPlaceFunnel;
        FunnelInPosition := TRUE;
        WaitUntil FilteringFinished = TRUE;
!        WHILE reg1 <> 4 DO
!            TPErase;
!            TPReadFK reg1, "Filter disassembled?", stEmpty, stEmpty, stEmpty, "Yes", "No";
!        ENDWHILE
        filterDis:=TRUE;
!        reg1:=0;
        RturnFunnelToHomePosition;
!        BorderingFilterToPutInPlate;
        PickPlate;
        MovePlateToNearMissile;
        PlateInPosition := TRUE;
        WaitUntil FilterInPlate = TRUE;
        WaitUntil CapinetOpened = TRUE;
!        WHILE reg1 <> 4 DO
!            TPErase;
!            TPReadFK reg1, "Should i proceed?", stEmpty, stEmpty, stEmpty, "Yes", "No";
!        ENDWHILE
!        reg1:=0;
        PutPlateInCapinet;
        IF DoINeedToClose = TRUE THEN
            CloseCapinet;
        EndIF
    ENDPROC
    
    PROC MoveDispenser(var bool pressAction)
        !MoveJ MoveDispenser1, Slow, z5, GripperRight1;
        MoveJ MoveDispenser2, Slow, z5, GripperRight1;
        MoveJ MoveDispenser3, Slow, z5, GripperRight1;
        MoveJ MoveDispenser31, Slow, z5, GripperRight1;
        MoveJ MoveDispenser4, Slow, z5, GripperRight1;
        MoveL MoveDispenser5, Slow, z5, GripperRight1;
        MoveL MoveDispenser6_1, Slow, z5, GripperRight1;
        MoveL MoveDispenser6_2, Slow, z5, GripperRight1;
        
        WaitTime 2;
        g_GripOut;
        waittime 2;
        PippeteInSecondPosition := TRUE;
        PippeteInFirstPosition := False;
        PippeteInThirdPosition := False;
        MoveJ MoveDispenser7, Normal, z5, GripperRight1;
        MoveJ MoveDispenser8, Normal, z5, GripperRight1;
        MoveL MoveDispenser9, Normal, z5, GripperRight1;
        IF pressAction = TRUE THEN
            WaitUntil JarLifted = TRUE;
        ENDIF
        MoveL MoveDispenser10, VerySlow, z5, GripperRight1;
        WaitTime 1;
        IF pressAction = FALSE THEN
            WaitUntil JarLiftedSuc = TRUE;
        ENDIF
        MoveJ MoveDispenser8, VerySlow, z5, GripperRight1;
        PippeteEmptied := TRUE;
        WaitUntil PippeteEmptied = FALSE;
        MoveJ MoveDispenser7, Normal, z5, GripperRight1;
        MoveL MoveDispenser11, Normal, z5, GripperRight1;
        MoveL MoveDispenser12, Slow, z5, GripperRight1;
        WaitTime 2;
        g_GripIn;
        WaitTime 2;
        MoveL MoveDispenser6_1, Slow, z5, GripperRight1;
        MoveL MoveDispenser5, Normal, z5, GripperRight1;
        MoveJ MoveDispenser4, Normal, z5, GripperRight1;
        MoveJ MoveDispenser31, Normal, z5, GripperRight1;
        MoveJ MoveDispenser3, Normal, z5, GripperRight1;
    ENDPROC
    
    PROC MoveDispenserBackToBottle()
        MoveJ MoveDispenser2, Slow, z5, GripperRight1;
        MoveJ FillPippeteAbovePillar, Normal, z5, GripperRight1;
        MoveJ FillPippeteOnPillar, Normal, z5, GripperRight1;
        PippeteInFirstPosition := TRUE;
        PippeteInSecondPosition := False;
        PippeteInThirdPosition := False;
        WaitUntil PippeteFilled = TRUE;
        WaitTime 1; !was 1 
        MoveJ FillPippeteAbovePillar, Normal, z5, GripperRight1;
    ENDPROC
    

    PROC FillAnalysisJars() 
!Tubes handling and dispencer handling should be added here. As well as left hand cooperation. Since we are using different process for analysis NozzleNumber variable probably should be made global (already did). Since we are going to change it inside Analysis proc as well as here.
        FOR i FROM 1 TO 2 DO
        TPWrite "Filled first jar";
            
            waittime 10;
            ZeroingVariables;
            ZeroingVariablesOfMov2_1;
                    IF i = 2 THEN
                        WaitUntil rightarmmove=TRUE;
                    ENDIF
            PickThenPlaceJar;
            Held_CoverHasBeenRemoved:=FALSE;!added 01-02-2023 the left arm wasn't waiting for the ght arm to fully remove the cover
            JarInPlace := TRUE;
            WaitUntil Held_LeftHoldingJar = TRUE;
            HeldJar_OpenCover_2;
            WaitUntil JarOnBlackStation = TRUE;
            
            solutionVolume:=solutionAnVolume;
            pressAct:=TRUE;
            liquidHandling solutionVolume, pressAct;
            
            WaitUntil JarAtRedStaion_Analysis=TRUE;
            IF i = 1 then
                MoveJarFromRedStation2Stationary;
                JarAtRedStaion_Analysis:=FALSE;
            ELSE
                MoveJarFromRedStation2Moving;
            ENDIF
                DoneFillingStationaryJar:=TRUE;
                waittime 16;
        ENDFOR
    ENDPROC
    
    PROC MoveJarFromRedStation2Stationary()
        g_GripIn;
        MoveJ CameraHome,Travel, z5, GripperRight1;
        MoveJ Midd1,Travel, z5, GripperRight1;
        MoveJ MoveJarFromRedStation2analysis1, Normal, z5, GripperRight1;
        MoveJ MoveJarFromRedStation2analysis2, Normal, z5, GripperRight1;
        MoveJ MoveJarFromRedStation2analysis3, Normal, z5, GripperRight1;!above tube
        g_GripOut;
        WaitTime 0.2;
        MoveL MoveJarFromRedStation2analysis4, Normal, z5, GripperRight1;!around tube
        WaitTime 0.2;
        g_GripIn;
        MoveL MoveJarFromRedStation2Analysis3, Slow, z5, GripperRight1;!above tube
        MoveJ MoveJarFromRedStation2analysis5, Normal, z5, GripperRight1;
        MoveJ MoveJarFromRedStation2analysis6, Normal, z5, GripperRight1;
        MoveJ MoveJarFromRedStation2analysis7, Normal, z5, GripperRight1;
        MoveJ MoveJarFromRedStation2analysis8, Normal, z5, GripperRight1;
        MoveJ MoveJarFromRedStation2analysis9, Slow, z5, GripperRight1;
        MoveJ MoveJarFromRedStation2analysis10, Normal, z5, GripperRight1;
        WaitTime 3;
        MoveJ MoveJarFromRedStation2analysis9, Slow, z5, GripperRight1;
        MoveJ MoveJarFromRedStation2analysis8, Normal, z5, GripperRight1;
        MoveJ MoveJarFromRedStation2analysis7, Normal, z5, GripperRight1;
        waittime 0.5;
        g_GripOut;
        MoveJ MoveJarFromRedStation2analysis6, Normal, z5, GripperRight1;
        MoveJ MoveJarFromRedStation2analysis5, Normal, z5, GripperRight1;
        MoveJ CameraHome,Travel, z5, GripperRight1;
        
    ENDPROC
    
    PROC MoveJarFromRedStation2Moving()
        g_GripIn;
        MoveJ CameraHome,Travel, z5, GripperRight1;
        MoveJ Midd1,Travel, z5, GripperRight1;
        MoveJ MoveJarFromRedStation2analysis1, Normal, z5, GripperRight1;
        MoveJ MoveJarFromRedStation2analysis2, Normal, z5, GripperRight1;
        MoveJ MoveJarFromRedStation2analysis3, Normal, z5, GripperRight1;!above tube
        g_GripOut;
        WaitTime 0.2;
        MoveL MoveJarFromRedStation2analysis4, Normal, z5, GripperRight1;!around tube
        WaitTime 0.2;
        g_GripIn;
        MoveL MoveJarFromRedStation2Analysis3, Slow, z5, GripperRight1;!above tube
        MoveJ MoveJarFromRedStation2analysis5, Normal, z5, GripperRight1;
        MoveJ MoveJarFromRedStation2analysis6, Normal, z5, GripperRight1;
        MoveJ MoveJarFromRedStation2analysis7, Normal, z5, GripperRight1;
        MoveJ MoveJarFromRedStation2Moving1, Normal, z5, GripperRight1;
        MoveJ MoveJarFromRedStation2Moving2, Slow, z5, GripperRight1;
        MoveJ MoveJarFromRedStation2Moving3, Normal, z5, GripperRight1;
        WaitTime 3;
        MoveJ MoveJarFromRedStation2Moving2, Slow, z5, GripperRight1;
        MoveJ MoveJarFromRedStation2Moving1, Normal, z5, GripperRight1;
        MoveJ MoveJarFromRedStation2analysis7, Normal, z5, GripperRight1;
        waittime 0.5;
        g_GripOut;
        MoveJ MoveJarFromRedStation2analysis6, Normal, z5, GripperRight1;
        MoveJ MoveJarFromRedStation2analysis5, Normal, z5, GripperRight1;
        MoveJ CameraHome,Travel, z5, GripperRight1;
    ENDPROC
    
       PROC DragRailStationToJars()
        g_GripIn;
        MoveJ CameraHome,Travel, z5, GripperRight1;
        MoveJ MoveJarFromRedStation2analysis5, Normal, z5, GripperRight1;
        MoveJ MoveJarFromRedStation2analysis6, Normal, z5, GripperRight1;
        MoveJ MoveJarFromRedStation2analysis7, Normal, z5, GripperRight1;
        g_MoveTo 15;
        MoveJ DragRailStation1, Normal, z5, GripperRight1;
        MoveJ DragRailStation2, Slow, z5, GripperRight1;
        WaitTime 1;
        g_GripIn;
        WaitTime 1;
         g_Stop;
        MoveJ DragRailStation2, Slow, z5, GripperRight1;
        
        MoveL DragRailStation3, Slow, z5, GripperRight1;
        MoveL DragRailStation6, Slow, z5, GripperRight1;
       
        MoveL DragRailStation4, slow, z5, GripperRight1;
        MoveL DragRailStation7, slow, z5, GripperRight1;
         WaitTime 1;
        
        g_GripOut;
        WaitTime 0.5;
        MoveJ DragRailStation5, Normal, z5, GripperRight1;
        g_GripIn;
        MoveJ MoveJarFromRedStation2analysis7, Normal, z5, GripperRight1;
        MoveJ MoveJarFromRedStation2analysis6, Normal, z5, GripperRight1;
        MoveJ MoveJarFromRedStation2analysis5, Normal, z5, GripperRight1;
        MoveJ CameraHome,Travel, z5, GripperRight1;
        
    ENDPROC
    
    PROC PushRailStation()
        g_GripIn;
        MoveJ PushRailStation1, Normal, z5, GripperRight1;
        MoveJ PushRailStation2, Normal, z5, GripperRight1;
        MoveJ PushRailStation3, Normal, z5, GripperRight1;
        MoveL PushRailStation4, Slow, z5, GripperRight1;
        MoveL PushRailStation5, Slow, z5, GripperRight1;
        MoveL PushRailStation6, VerySlow, z5, GripperRight1;
        Movel PushRailStation3, Normal, z5, GripperRight1;
        MoveJ PushRailStation2, Normal, z5, GripperRight1;
        MoveJ PushRailStation1, Normal, z5, GripperRight1;
        MoveJ CameraHome,Normal, z5, GripperRight1;
        
    ENDPROC
    
    PROC PickWeirdJar()
        MoveJ CameraHome,Normal, z5, GripperRight1;
        MoveJ PickWeirdJar1,Normal, z5, GripperRight1;
        g_GripOut;
        MoveJ PickWeirdJar2,Normal, z5, GripperRight1;
        MoveJ PickWeirdJar3,Normal, z5, GripperRight1;
        MoveJ AboveWeirdJar,Normal, z5, GripperRight1;
        MoveL AroundWeirdJar,Slow, z5, GripperRight1;
        WaitTime 0.6;
        g_GripIn;
        MoveL AboveWeirdJar,Slow, z5, GripperRight1;
        MoveJ PickWeirdJar3,Normal, z5, GripperRight1;
        MoveJ PickWeirdJar2,Normal, z5, GripperRight1;
    ENDPROC
    
    PROC PlaceStationaryWeirdJar()
        MoveJ PlaceStatinaryWeirdJar1,Normal, z5, GripperRight1;
        MoveJ PlaceStatinaryWeirdJar2,Normal, z5, GripperRight1;
        MoveJ PlaceStatinaryWeirdJar3,Normal, z5, GripperRight1;
        MoveJ AboveStationary,Normal, z5, GripperRight1;
        MoveL InStationary,VerySlow, z5, GripperRight1;
        waittime 0.9;
        g_GripOut;
        MoveL AboveStationary,Slow, z5, GripperRight1;
        MoveJ PlaceStatinaryWeirdJar3,Normal, z5, GripperRight1;
        MoveJ PlaceStatinaryWeirdJar2,Normal, z5, GripperRight1;
        MoveJ PlaceStatinaryWeirdJar1,Normal, z5, GripperRight1;
        MoveJ CameraHome,Normal, z5, GripperRight1;
    ENDPROC
    
    PROC PlaceMovingWeirdJar()
        MoveJ PlaceMovingWeirdJar1,Normal, z5, GripperRight1;
        MoveJ PlaceMovingWeirdJar2,Normal, z5, GripperRight1;
        MoveJ PlaceMovingWeirdJar3,Normal, z5, GripperRight1;
        MoveJ AboveMoving,Normal, z5, GripperRight1;
        MoveL InMoving,VerySlow, z5, GripperRight1;
        waittime 2;
        g_GripOut;
        MoveL AboveMoving,Slow, z5, GripperRight1;
        MoveJ PlaceMovingWeirdJar3,Normal, z5, GripperRight1;
        MoveJ PlaceMovingWeirdJar2,Normal, z5, GripperRight1;
        MoveJ PlaceMovingWeirdJar1,Normal, z5, GripperRight1;
        MoveJ CameraHome,Normal, z5, GripperRight1;
    ENDPROC
    
    PROC MovePippetToStationary()
        MoveJ MovePippetToStationary1,Normal, z5, GripperRight1;
        MoveJ MovePippetToStationary2,Normal, z5, GripperRight1;
        MoveJ MovePippetToStationary2_2,Normal, z5, GripperRight1;
        MoveJ MovePippetToStationary3,Normal, z5, GripperRight1;
        MoveL MovePippetToStationary4,Normal, z5, GripperRight1;
        MoveL MovePippetToStationary5,Normal, z5, GripperRight1;
        MoveL MovePippetToStationary6,Slow, z5, GripperRight1;! need to recheck
        MoveJ MovePippetToStationary7,Slow, z5, GripperRight1;
        WaitTime 1;
        g_GripOut;
        FillFromStationary;
        MoveJ MovePippetToStationary7,Slow, z5, GripperRight1;
        waittime 1;
        g_GripIn;
        MoveL MovePippetToStationary6,Slow, z5, GripperRight1;! need to recheck
        MoveL MovePippetToStationary5,Slow, z5, GripperRight1;! need to recheck
        MoveL MovePippetToStationary4,Slow, z5, GripperRight1;! need to recheck
        MoveJ MovePippetToStationary3,Normal, z5, GripperRight1;! need to recheck
        MoveJ MovePippetToStationary2_2,Normal, z5, GripperRight1;
        MoveJ MovePippetToStationary2,Normal, z5, GripperRight1;! need to recheck
        MoveJ MovePippetToStationary1,Normal, z5, GripperRight1;! need to recheck
        EmptyPippetInTube_Analysis;

    ENDPROC
    
    PROC MovePippetToMoving()
        MoveJ MovePippetToStationary1,Normal, z5, GripperRight1;
        MoveJ MovePippetToStationary2,Normal, z5, GripperRight1;
        MoveJ MovePippetToStationary2_2,Normal, z5, GripperRight1;
        MoveJ MovePippetToStationary3,Normal, z5, GripperRight1;
        MoveL MovePippetToStationary4,Normal, z5, GripperRight1;
        MoveL MovePippetToMoving5,Slow, z5, GripperRight1;
        MoveL MovePippetToMoving6,Slow, z5, GripperRight1;! need to recheck
        MoveJ MovePippetToMoving7,Slow, z5, GripperRight1;
        WaitTime 1;
        g_GripOut;
        FillFromMoving;
        MoveJ MovePippetToMoving7,Slow, z5, GripperRight1;
        waittime 1;
        g_GripIn;
        MoveL MovePippetToMoving6,Slow, z5, GripperRight1;! need to recheck
        MoveL MovePippetToMoving5,Slow, z5, GripperRight1;! need to recheck
        MoveL MovePippetToStationary4,Slow, z5, GripperRight1;! need to recheck
        MoveJ MovePippetToStationary3,Slow, z5, GripperRight1;! need to recheck
        MoveJ MovePippetToStationary2_2,Slow, z5, GripperRight1;
        MoveJ MovePippetToStationary2,Slow, z5, GripperRight1;! need to recheck
        MoveJ MovePippetToStationary1,Slow, z5, GripperRight1;! need to recheck
        EmptyPippetInTube_Analysis;
    ENDPROC
    
    PROC FillFromStationary()
        MoveJ FillFromStationary1,Normal, z5, GripperRight1;
        MoveJ FillFromStationary_AbovePippet,Normal, z5, GripperRight1;
        MoveJ FillFromStationary3,VerySlow, z5, GripperRight1;
        waittime 0.3;
        MoveJ FillFromStationary_AbovePippet,Slow, z5, GripperRight1;
        MoveJ FillFromStationary1,Slow, z5, GripperRight1;
    ENDPROC
    
    PROC FillFromMoving()
        MoveJ FillFromMoving1,Normal, z5, GripperRight1;
        MoveJ FillFromMoving_AbovePippet,Normal, z5, GripperRight1;
        MoveJ FillFromMoving3,VerySlow, z5, GripperRight1;
        waittime 0.3;
        MoveJ FillFromMoving_AbovePippet,Slow, z5, GripperRight1;
        MoveJ FillFromMoving1,Normal, z5, GripperRight1;
    ENDPROC
PROC EmptyPippetInTube_Analysis()
        MoveJ MoveDispenser2, Slow, z5, GripperRight1;
        MoveJ MoveDispenser3, Slow, z5, GripperRight1;
        MoveJ MoveDispenser31, Slow, z5, GripperRight1;
        MoveJ MoveDispenser4, Slow, z5, GripperRight1;
        MoveL MoveDispenser5, Slow, z5, GripperRight1;
        MoveL MoveDispenser6_1, Slow, z5, GripperRight1;
        MoveL MoveDispenser6_2, Slow, z5, GripperRight1;
        
        
        WaitTime 2;
        g_GripOut;
        waittime 2;
        PippeteInSecondPosition := TRUE;
        MoveJ MoveDispenser7, Normal, z5, GripperRight1;
        MoveJ MoveDispenser8, Normal, z5, GripperRight1;
        MoveL MoveDispenser9, Normal, z5, GripperRight1;
        Waituntil JarLifted= TRUE;
        MoveL MoveDispenser10, VerySlow, z5, GripperRight1;
!        WaitTime 1;
!        IF pressAction = FALSE THEN
!            WaitUntil JarLiftedSuc = TRUE;
!        ENDIF
!        MoveJ MoveDispenser8, VerySlow, z5, GripperRight1;
        PippeteEmptied := TRUE;
        MoveL MoveDispenser9, VerySlow, z5, GripperRight1;
        MoveL MoveDispenser8, VerySlow, z5, GripperRight1;
        MoveJ MoveDispenser7, Normal, z5, GripperRight1;
        MoveL MoveDispenser11, Normal, z5, GripperRight1;
        MoveL MoveDispenser12, Slow, z5, GripperRight1;
        WaitTime 2;
        g_GripIn;
        WaitTime 2;
        MoveL MoveDispenser6_1, Slow, z5, GripperRight1;
        MoveL MoveDispenser5, Normal, z5, GripperRight1;
        MoveJ MoveDispenser4, Normal, z5, GripperRight1;
        MoveJ MoveDispenser31, Normal, z5, GripperRight1;
        MoveJ MoveDispenser3, Normal, z5, GripperRight1;
        MoveJ MoveDispenser2, Slow, z5, GripperRight1;
ENDPROC
PROC RemoveMovingWeirdJar()
        Movej CameraHome, Normal, z5, GripperRight1;
        MoveJ PickWeirdJar2,Normal, z5, GripperRight1;
        MoveJ PlaceMovingWeirdJar1,Normal, z5, GripperRight1;
        MoveJ PlaceMovingWeirdJar2,Normal, z5, GripperRight1;
        g_GripOut;
        MoveJ PlaceMovingWeirdJar3,Normal, z5, GripperRight1;
        MoveJ AboveMoving,Slow, z5, GripperRight1;
        MoveL InMoving,Slow, z5, GripperRight1;
        waittime 0.6;
        g_GripIn;
        
        MoveL AboveMoving,Slow, z5, GripperRight1;
        MoveJ PlaceMovingWeirdJar3,Normal, z5, GripperRight1;
        MoveJ PlaceMovingWeirdJar2,Normal, z5, GripperRight1;
        MoveJ RemoveMovingWeirdJar1,Normal, z5, GripperRight1;
        MoveJ RemoveMovingWeirdJar2,Normal, z5, GripperRight1;
        WaitTime 1;
        g_GripOut;
        MoveJ RemoveMovingWeirdJar1,Normal, z5, GripperRight1;
        MoveJ PlaceMovingWeirdJar2,Normal, z5, GripperRight1;
        MoveJ PlaceMovingWeirdJar1,Normal, z5, GripperRight1;
        MoveJ CameraHome,Normal, z5, GripperRight1;
    ENDPROC
    
    PROC RemoveStationaryWeirdJar()
        Movej CameraHome, Normal, z5, GripperRight1;
        MoveJ PickWeirdJar2,Normal, z5, GripperRight1;
        MoveJ PlaceStatinaryWeirdJar1,Normal, z5, GripperRight1;
        MoveJ PlaceStatinaryWeirdJar2,Normal, z5, GripperRight1;
        g_GripOut;
        MoveJ PlaceStatinaryWeirdJar3,Normal, z5, GripperRight1;
        MoveJ AboveStationary,Normal, z5, GripperRight1;
        MoveL InStationary,Slow, z5, GripperRight1;
        WaitTime 0.6;
        g_GripIn;
        MoveL AboveStationary,Slow, z5, GripperRight1;
        MoveJ PlaceStatinaryWeirdJar3,Normal, z5, GripperRight1;
        MoveJ PlaceStatinaryWeirdJar2,Normal, z5, GripperRight1;
        
        MoveJ PlaceMovingWeirdJar2,Normal, z5, GripperRight1;
        MoveJ RemoveMovingWeirdJar1,Normal, z5, GripperRight1;
        MoveJ RemoveStationaryWeirdJar2,Normal, z5, GripperRight1;
        WaitTime 1;
        g_GripOut;
        MoveJ RemoveMovingWeirdJar1,Normal, z5, GripperRight1;
        MoveJ PlaceMovingWeirdJar2,Normal, z5, GripperRight1;
        MoveJ PlaceMovingWeirdJar1,Normal, z5, GripperRight1;
        MoveJ CameraHome,Normal, z5, GripperRight1;
    ENDPROC
    
PROC ReMoveFilterFromAnalysis()
        !MoveJ MoveFilterForAnalysis1, Slow, z5, GripperRight1;
        !MoveJ MoveFilterForAnalysis2, Slow, z5, GripperRight1;
        MoveJ MoveFilterForAnalysis3, Normal, z5, GripperRight1;
        MoveJ MoveFilterForAnalysis4, Normal, z5, GripperRight1;
        MoveJ MoveFilterForAnalysis5, Normal, z5, GripperRight1;
        MoveJ MoveFilterForAnalysis6, Normal, z5, GripperRight1;
        MoveJ MoveFilterForAnalysis7, Normal, z5, GripperRight1;
        MoveJ MoveFilterForAnalysis8, Slow, z5, GripperRight1;
        MoveL MoveFilterForAnalysis9, Slow, z5, GripperRight1;
        Waittime 1;
        g_VacuumOn1;
        Movel MoveFilterForAnalysis8, Slow, z5, GripperRight1;
        MoveJ MoveFilterForAnalysis7, Normal, z5, GripperRight1;
        MoveJ MoveFilterForAnalysis6, Normal, z5, GripperRight1;
        MoveJ MoveFilterForAnalysis5, Normal, z5, GripperRight1;
        MoveJ MoveFilterForAnalysis4, Normal, z5, GripperRight1;
        MoveJ MoveFilterForAnalysis3, Normal, z5, GripperRight1;
        Movej AboveFilterForAnalysis, Normal, z5, GripperRight1;
        Movel PickFilterForAnalysis, Slow, z5, GripperRight1;
        WaitTime 0.5;
        g_VacuumOff1;
        Movel AboveFilterForAnalysis, Slow, z5, GripperRight1;
        Movej CameraHome, Travel, z5, GripperRight1; 
    ENDPROC

    PROC MovePlateAfterAnalysis()
    !        MoveJ PutPlateInCapinet3, Slow, z5, GripperRight1;
        MoveJ CameraHome, Travel, z5, GripperRight1;
        g_GripOut;
        
        MoveJ MovePlateAfterAnalysis4, Normal, z5, GripperRight1;
        MoveJ MovePlateAfterAnalysis3, Normal, z5, GripperRight1;
        waittime 1;
        g_GripIn;
        MoveL MovePlateAfterAnalysis4, Normal, z5, GripperRight1;
        MoveJ MovePlateAfterAnalysis5, Normal, z5, GripperRight1;
        MoveJ MovePlateAfterAnalysis6, Normal, z5, GripperRight1;
        MoveJ MovePlateAfterAnalysis7, Normal, z5, GripperRight1;
        waittime 1;
        g_GripOut;
        
        MoveJ MovePlateAfterAnalysis6, Normal, z5, GripperRight1;
        MoveJ MovePlateAfterAnalysis5, Normal, z5, GripperRight1;
        MoveJ CameraHome, Travel, z5, GripperRight1;
        
        
        
!        MoveJ PlateAboveBigJar, Normal, z5, GripperRight1;
!        MoveL PlateOnBigJar, Slow, z5, GripperRight1;
!        MoveL PlateOnBigJar1, Slow, z5, GripperRight1;
        
!        waittime 1;
!        g_GripIn;
!        MoveL PlateAboveBigJar, Slow, z5, GripperRight1;
    ENDPROC
    
    PROC TestmainRight()
        VAR num JarNumFilledByS1_2 := 0;
        VAR num NumIf0CntfgIf1Filter := 0; 
        VAR num draft := 0;
        VAR num i := 0;
        VAR num dosCount :=0; 
        VAR bool NotUsed;
        VAR bool DoINeedToClose:= False;
        DoneFillingStationaryJar:=FALSE;
          
        solutionAnVolume:=50;! analysis bottle volume
        anDos:= 10;! test sample volume should be about the same as solutionAnVolume 
        anhTime := 24;
        partVolume :=5;
        PippeteReady := FALSE;
        ZeroingVariables;
        ZeroingVariablesOfMov2_1;
        ZeroingVariablesForMOV2_3;
        JarAtRedStaion_Analysis:=FALSE;
        WaitingForClosetIsOpend_analysis:=FALSE;
!        IF anSet = FALSE THEN
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
            WaitTime wJarClosingTime;
            FillAnalysisJars;
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
!        ELSE
!            IF (GetTime(\Hour) >= anHour) AND (GetTime (\Min) >= anMinute) THEN
    waittime 10; !For the test remove later
!    AnalysisOver:=TRUE;
    ZeroingVariables;
            ZeroingVariablesOfMov2_1;
                DragRailStationToJars;
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
                    MoveJ FillPippete5_2, Travel, z5, GripperRight1;
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
                !! After analysis bottles separated move them somewhere else
                reset custom_DO_6;
                anSet := FALSE;
                WaitTime 90;
                RemoveMovingWeirdJar;
                RemoveStationaryWeirdJar;
                ReMoveFilterFromAnalysis;
                MovePlateAfterAnalysis;

!            ENDIF
!        ENDIF
    ENDPROC
    PROC ShakeTimer()
        readytoCount:=TRUE;
        WaitUntil ShakeStarted = TRUE;
        WaitTime ShakeTime;
        ShakeOver:=TRUE;
        readytoCount:=FALSE;
        WaitTime 1.5;
        ShakeOver:=FALSE;
        
    ENDPROC
    PROC ClampUp(bool act)
        MoveJ PlaceMovingWeirdJar1,Normal, z5, GripperRight1;
        MoveJ PlaceMovingWeirdJar2,Normal, z5, GripperRight1;
        MoveJ PlaceMovingWeirdJar3,Normal, z5, GripperRight1;
        IF act = TRUE THEN
            ClampVar:=ClampBase;
            ClampVar2:=ClampSet;
        ELSE    
            ClampVar2:=ClampBase;
            ClampVar:=ClampSet;
        ENDIF
            g_GripOut;
            ClampVar.trans.z := ClampVar.trans.z + 100;
            MoveJ ClampVar,Normal, z5, GripperRight1;
            
            ClampVar.trans.z := ClampVar.trans.z - 100;
            MoveL ClampVar,Slow, z5, GripperRight1;
            waittime 2;
            g_GripIn;
            
            ClampVar.trans.z := ClampVar.trans.z + 100;
            MoveJ ClampVar,Normal, z5, GripperRight1;
            
            ClampVar2.trans.z := ClampVar2.trans.z + 100;
            MoveJ ClampVar2,Normal, z5, GripperRight1;
            
            ClampVar2.trans.z := ClampVar2.trans.z - 100;
            MoveL ClampVar2,Slow, z5, GripperRight1;
            waittime 2;
            g_GripOut;
            
            ClampVar2.trans.z := ClampVar2.trans.z + 100;
            MoveL ClampVar2,Normal, z5, GripperRight1;
            MoveJ PlaceMovingWeirdJar3,Normal, z5, GripperRight1;
            MoveJ PlaceMovingWeirdJar2,Normal, z5, GripperRight1;
            MoveJ PlaceMovingWeirdJar1,Normal, z5, GripperRight1;
            MoveJ CameraHome,Normal, z5, GripperRight1;
    ENDPROC
    
      ! camera home joints:63 -86 42 -5 79 79 9
      
 ENDMODULE
