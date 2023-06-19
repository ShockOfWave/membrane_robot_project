MODULE MainModule
    PERS bool demo;
    !! Variables to synchronize the movement of two arems while capturing the centrifuge
    PERS bool L_Home:=FALSE;   
    PERS bool L_Capture:=FALSE;
    PERS bool PhotoTakenandPatternDetected:=FALSE;
    PERS bool R_Home;
    PERS bool filterDis;
    PERS BOOL TakeFistImage;
    PERS BOOL TakeSecondImage;
    PERS bool rightArmReadyReadyToPress;
    PERS bool VaccumIsOn:=FALSE;
    PERS bool RightArmWaiting:=FALSE;
    PERS bool FilterRemovedFromPlate:=FALSE;
    PERS bool TubeMovedToDelivery:=FALSE;
    ! Two Boolian variables To find how many jars are on the station
    PERS Bool FindJars_Rhome := FALSE;
    PERS Bool FindJars_Lhome := FALSE;
    PERS bool readytoCount;
    PERS bool rightarmmove:=FALSE;
    VAR num NumOfDoneAnalysisJar:=1;
    VAR bool liftAct;
    
    
    ! Variables for opening, closing and filling in the jar
    
    PERS Bool FillJarRready := FALSE;
    PERS Bool FillJarLready := FALSE;
    PERS Bool FillJarInOpenPosition2Open := FALSE;
    PERS Bool FillJarLidInPosition := FALSE;
    PERS Bool FillJarInOpenPosition2Close := FALSE;
    PERS Bool FillJarLidClosed := FALSE;
    PERS Bool FillJarRightHandReadyforRising := FALSE;
    PERS Bool FillJarLeftHandRaised :=FALSE;
    
    !Variables to open and colse Jar Held in Hole in Orange
    PERS Bool Held_LeftHoldingJar :=TRUE;
    PERS Bool Held_CoverHasBeenRemoved :=TRUE;
    PERS Bool Held_JarIsBackInOrange :=FALSE;
    PERS Bool  Held_jarClosed:=FALSE;
    
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
    PERS Bool DoneWithFirstJat := FALSE;
    PERS Bool DoneWithSecondJar:= FALSE;
    PERS Bool CoverPicked := FALSE;
    PERS Bool JarHolded := FALSE;
    PERS BOOL ReadyToRemoveStuckedNozzel := FALSE;
    PERS BOOL StuckedNozzelRemoved := FALSE;
    PERS BOOL JarInPlace := TRUE;
    PERS BOOL JarLifted := TRUE;
    PERS BOOL JarLiftedSuc:=FALSE;
    PERS BOOL bottleChanged:=TRUE;
    VAR num solutionVolume;
    PERS num solution1Volume;
    PERS num solution2Volume;
    PERS num solution3Volume;
    PERS num solutionAnVolume;
    PERS num partVolume;
    PERS num anDos;
         
    PERS Bool FunnelInPosition := FALSE;
    PERS Bool FilteringFinished := FALSE;
    PERS Bool FilterInPlate := FALSE;
    PERS Bool CapinetOpened := FALSE;
    PERS Bool PlateAlreadyInCapinet := FALSE;
    PERS Bool CoverOpened := FALSE;
    
    !variable for MoveAndFillJars
    VAR bool MoveNextJar:=FALSE;
    VAR bool NewCycle:=TRUE;
    
    ! variables to move filter from big jar to plate
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
    
    !variable to ensure tight equippment of the nozzle
    PERS bool LeftHandPressed := TRUE;
    PERS bool PippeteReady := FALSE;
    PERS bool anset;
    PERS bool JarAtRedStaion_Analysis :=FALSE;
    PERS bool WaitingForClosetIsOpend_analysis := FALSE;
    PERS bool ClosetIsOpened_analysis := FALSE;
    PERS bool DoneFillingStationaryJar := TRUE;
    PERS bool MoveFromBlackToRed_analysis := TRUE;
    
    PERS bool AnalysisOver:= TRUE;
    PERS bool leftReadyAnalysis;
    PERS bool ShakeStarted:= FALSE;
    PERS bool ShakeOver := FALSE;
    
    
    
 
    ! Variables used during angle6 calculation
    VAR num PatternAngle;
    VAR num q6_ZeroPosition := 0;
    VAR num q6_Angle;
    

    ! some variables for camera
    VAR num Scene_1;
    VAR cameratarget mycamtarget;
    PERS wobjdata GreenCover;
    VAR Bool  ContnuLoop := TRUE;
    
    
    
    ! Speeds defenitions:
    VAR speeddata Testing := [25,100,100,25];
    VAR speeddata VerySlow := [5,20,20,5];
    VAR speeddata Slow := [20,50,50,50];
    VAR speeddata Normal := [200,50,50,200];
    VAR speeddata Fast := [300,150,150,300];
    VAR speeddata Travel := [500,200,200,500];
    
    ! Control Boolian variable To automate the process, the main concern is "New and Old Jars" they are different in height
    VAR Bool NewJars := FALSE;
    
    
    PERS bool IsJarinPosition{20};
   
    VAR num botCap:= 17;
    var num centTime:=60*90+140; !90 min cetrifuge process plus 3 min 20 sec for acceleration to 4k RPM
    VAR num centBrake:=155; !Brake time 2 min 25 sec +10 seconds just to be sure
    VAR num draft3 := 0;
    VAR bool fr := TRUE;
    
    VAR intnum err_int;

    VAR bool st:= FALSE;
    VAR num numm:=4;
    
    PERS bool NewCycleArmsSynchRight;
    PERS bool NewCycleArmsSynchLeft;
    
    PROC Main()
!        IEnable;
!        CONNECT err_int WITH CamInterrupt;
!        IError HARDWARE_ERR, TYPE_ERR, err_int;
!        FindJars_LeftArm;
        VAR num gg;
        
!        gg := MoveFromMainMidPointToMidCtfg(NewJars);
        MotionSup \On;
        g_Calibrate;
        
!        gg := Move2ApproachPoint();
        
        g_GripIn;
        WaitTime 2;
        
       
        
        g_Calibrate;
        
        g_Init \maxSpd := 25, \holdForce := 10;
        NewJars:=True;
        L_Home:=FALSE;   
        L_Capture:=FALSE;
        PhotoTakenandPatternDetected:=FALSE;
        R_Home:=FALSE;
        TakeFistImage := FALSE;
        TakeSecondImage := FALSE;
        FindJars_Lhome:=FALSE;
        FindJars_Rhome:=FALSE;
        NewJars := TRUE;
        WaitingForClosetIsOpend_analysis:=FALSE;
        closetisopened_analysis:=FALSE;
!        FOR i FROM 1 TO 20 DO
!            PippeteReady := FALSE;
!            EnsureTightEquippingOfNozzle;
!        ENDFOR

        

!    ZeroingVariables;
!   PickFilterForAnalysisProc;
        NewCycleArmsSynchLeft:=TRUE;
        waituntil NewCycleArmsSynchRight = TRUE;
        waittime 0.5;
        NewCycleArmsSynchRight:=FALSE;
            IF demo = FALSE THEN
                Analysis;
            ENDIF
            FullCycleLeft;
!    Analysis;
!    testingRunLeft;
    
!        MOV2_2;
 
    ENDPROC
    
PROC gripConError () !This proc is here for error handling reference. Might go to the thrashBin proc otherwise.
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
    
    PROC liquidHandling(num solutionVolume, bool liftAct)
        VAR num dosCount:=0;
        EnsureTightEquippingOfNozzle;
        IF liftAct = TRUE then
            WHILE dosCount < (solutionVolume/partVolume) DO !Unite the whole thing under the dependable PROC. Done.
                WaitUntil PippeteInFirstPosition = TRUE;
                PressToFill;
                WaitUntil PippeteInSecondPosition = TRUE;
                PippeteFilled := False;
                LiftJarToNozzle liftAct;
                dosCount := dosCount+1;
            ENDWHILE
        ELSE
            WHILE dosCount < (solutionVolume/partVolume) DO
                    waituntil PippeteInSecondPosition = TRUE;
                    PippeteFilled := False;
                    LiftJarToNozzle liftAct;
                    WaitUntil PippeteInFirstPosition = TRUE;
                    PressToFill;
                    dosCount := dosCount+1;
            ENDWHILE
        ENDIF
        dosCount:=0;
        WaitUntil PippeteInThirdPosition = TRUE;
        PressToDropNozzel;
        StuckedNozzleRemoval;
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
    
    
    PROC ZeroingVariablesOfMov2_1()
        NewJars:=True;
        L_Home:=FALSE;   
        L_Capture:=FALSE;
        PhotoTakenandPatternDetected:=FALSE;
        R_Home:=FALSE;
        TakeFistImage := FALSE;
        TakeSecondImage := FALSE;
        FindJars_Lhome:=FALSE;
        FindJars_Rhome:=FALSE;
        JarHolded := FALSE;
    ENDPROC
    
    PROC PressToFill() 
!        MoveJ PressToFill_1, Travel, z1, GripperLeft;
        MoveJ MainMidPoint, Travel, z1, GripperLeft;
        MoveJ PressToFill_2, Travel, z1, GripperLeft;
        MoveJ PressToFill_3, Travel, z1, GripperLeft;
        MoveJ PressToFill_4, Slow, z1, GripperLeft;
        WaitTime 2;
        MoveJ PressToFill_3, Slow, z1, GripperLeft;
        MoveJ PressToFill_2, Travel, z1, GripperLeft;
        MoveJ MainMidPoint, Travel, z1, GripperLeft;
        PippeteFilled := TRUE;
    ENDPROC
    
    PROC PressToEmpty() 
        
        MoveJ PressToEmpty_2, Travel, z1, GripperLeft;
        MoveJ PressToEmpty_3, Normal, z1, GripperLeft;
        MoveJ PressToEmpty_4, Slow, z1, GripperLeft;
        WaitTime 2;
        MoveJ PressToEmpty_3, Normal, z1, GripperLeft;
        MoveJ PressToEmpty_2, Travel, z1, GripperLeft;
        MoveJ MainMidPoint, Travel, z1, GripperLeft;
    ENDPROC
    
    PROC EnsureTightEquippingOfNozzle()
        WaitUntil PippeteReady = TRUE;
        g_GripOut;
        MoveJ TightEquipping_1, Travel, z5, GripperLeft; 
        MoveJ TightEquipping_2, Travel, z5, GripperLeft; 
        MoveJ TightEquipping_2_2, Normal, z5, GripperLeft;
        g_MoveTo 18.5;
        WaitTime 0.5;
        MoveL TightEquipping_3, Slow, z5, GripperLeft;
        WaitTime 1;
        MoveL TightEquipping_2_2, Normal, z5, GripperLeft; 
        MoveJ TightEquipping_2, Travel, z5, GripperLeft;
        MoveJ TightEquipping_1, Travel, z5, GripperLeft; 
        MoveJ MainMidPoint, Travel, z5, GripperLeft; 
        LeftHandPressed := TRUE;
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
    
    PROC PressToDropNozzel() 
        
        MoveJ PressToDropNozzel_1, Travel, z1, GripperLeft;
        MoveJ PressToDropNozzel_2, Travel, z1, GripperLeft;
        MoveJ PressToDropNozzel_3, Normal, z1, GripperLeft;
        MoveJ PressToDropNozzel_4, Slow, z1, GripperLeft;
        WaitTime 1;
        MoveJ PressToDropNozzel_3, Normal, z1, GripperLeft;
        MoveJ PressToDropNozzel_2, Travel, z1, GripperLeft;
        MoveJ PressToDropNozzel_1, Travel, z1, GripperLeft;
        MoveJ MainMidPoint, Travel, z1, GripperLeft;
        NozzelDropped := TRUE;
    ENDPROC
    
    PROC ZeroingVariables()
        Held_LeftHoldingJar :=FALSE;
        Held_JarIsBackInOrange :=FALSE;
        JarOnBlackStation := FALSE;
        PippeteInFirstPosition:= FALSE;
        PippeteFilled := FALSE;
        PippeteInSecondPosition := FALSE;
        PippeteEmptied := FALSE;
        PippeteInThirdPosition := FALSE;
        NozzelDropped := FALSE;
        JarOnOrangeStation := FALSE;
        DoneWithFirstJat:=FALSE;
        DoneWithSecondJar:=FALSE;
        JarHolded := FALSE;
        StuckedNozzelRemoved := FALSE;
        FilterLifted:=FALSE;
        FilterShifted:=FALSE;
        FilterPicked:=FALSE;
        PlateInPosition:=FALSE;
        DoneWithPosition5:=FALSE;
        R_GripperInPosition5:=FALSE;
        DoneWithPosition4:=FALSE;
        R_GripperInPosition4:=FALSE;
        DoneWithPosition3:=FALSE;
        R_GripperInPosition3:=FALSE;
        JarLifted:=FALSE;
        JarLiftedSuc:=FALSE;
        VaccumIsOn:=False;
        RightArmWaiting:=False;
        FilterRemovedFromPlate:=False;
        
    ENDPROC

    PROC Held_ToMainMidPoint()
        g_GripOut;
        MoveJ NearJar, travel, z1, GripperLeft;
        WaitTime 0.5;
        g_GripIn;       
        MoveJ MainMidPoint, Normal, z1, GripperLeft;
        g_GripIn;
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
    
    PROC HoldJarInOrange()
        
        MoveJ MainMidPoint, Normal, z1, GripperLeft;        
        MoveJ AboveJar, Travel, z1, GripperLeft;
        g_GripIn;
        MoveJ AboveJarGripperClosedWithCover, normal, z1, GripperLeft;
        WaitTime 0.5;
        MoveJ AboveJar, normal, z1, GripperLeft;
        g_GripOut;
        WaitTime 1;
        MoveJ AroundJar2, Normal, z1, GripperLeft;
        WaitTime 1;
        g_GripIn;
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
    
    PROC Held_MoveJarFromOrange2Black()
        !HoldJarInOrange;
        MoveL AboveJar, Slow, z1, GripperLeft;        
        MoveJ Mid_4, Travel, z1, GripperLeft;
        MoveJ Mid_5, Normal, z1, GripperLeft;
        MoveJ Mid_6, Normal, z1, GripperLeft;
        JarOnBlackStation := TRUE;
        MoveJ AboveJarOnBlackStation, Normal, z1, GripperLeft;
        MoveL AroundJarOnBlackStation, Slow, z1, GripperLeft;
        WaitTime 1;
        g_MoveTo 15;
        MoveL AboveJarOnBlackStation, Normal, z1, GripperLeft;
        
        ! make sure jar reached the table surface
        g_GripIn;
        MoveL AboveJarOnBlackStationGripClosed, Normal, z1, GripperLeft;
        WaitTime 0.5;
        
        MoveJ AboveJarOnBlackStation, Normal, z1, GripperLeft;
        MoveJ Mid_6, Normal, z1, GripperLeft;
        MoveJ Mid_5, Normal, z1, GripperLeft;
        MoveJ Mid_4, Travel, z1, GripperLeft;
        MoveJ MainMidPoint, Travel, z1, GripperLeft;
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
    
    PROC StuckedNozzleRemoval()
        g_GripIn;
        MoveJ MainMidPoint, normal, z1, GripperLeft; 
        MoveJ Mid_55, normal, z1, GripperLeft;
        MoveJ Mid_5, normal, z1, GripperLeft;
        
        WaitUntil ReadyToRemoveStuckedNozzel=TRUE;
        g_GripOut;
        MoveJ Mid_7, normal, z1, GripperLeft;
        MoveJ Mid_8, normal, z1, GripperLeft;
        MoveJ Mid_9, normal, z1, GripperLeft;
        g_GripIn;
        WaitTime 1;
        MoveJ Mid_10, normal, z1, GripperLeft;
        MoveJ Mid_11, normal, z1, GripperLeft;
        MoveL Mid_12, normal, z1, GripperLeft;
        MoveJ Mid_13, normal, z1, GripperLeft;
        StuckedNozzelRemoved := TRUE;
        MoveJ Mid_14, normal, z1, GripperLeft;
        WaitTime 0.5;
        g_MoveTo 15;
        WaitTime 0.5;
        MoveJ Mid_13, normal, z1, GripperLeft;
        MoveJ Mid_12, normal, z1, GripperLeft;
        MoveJ Mid_11, normal, z1, GripperLeft;
        MoveJ Mid_10, normal, z1, GripperLeft;
        MoveJ Mid_9, normal, z1, GripperLeft;
        MoveJ Mid_8, normal, z1, GripperLeft;
        MoveJ Mid_7, normal, z1, GripperLeft;
        NozzelDropped := False;
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
    
    PROc Held_FromBlackToOrange()
        
!        VAR   robtarget HoldingPoint:=[[438.2388,-72.98116,358.5548],[0.00297478,-0.001265666,0.7255163,-0.6881974],[1,3,1,4],[-105.4292,9E+09,9E+09,9E+09,9E+09,9E+09]];
!        g_GripIn;
!        MoveJ MainMidPoint, normal, z1, GripperLeft; 
!        MoveJ Mid_55, normal, z1, GripperLeft;
!        MoveJ Mid_5, normal, z1, GripperLeft;
        
!        WaitUntil ReadyToRemoveStuckedNozzel=TRUE;
!        g_GripOut;
!        MoveJ Mid_7, normal, z1, GripperLeft;
!        MoveJ Mid_8, normal, z1, GripperLeft;
!        MoveJ Mid_9, normal, z1, GripperLeft;
!        g_GripIn;
!        WaitTime 1;
!        MoveJ Mid_10, normal, z1, GripperLeft;
!        WaitTime 1;
!        g_MoveTo 15;
!        WaitTime 0.5;
!        MoveJ Mid_9, normal, z1, GripperLeft;
!        MoveJ Mid_8, normal, z1, GripperLeft;
!        MoveJ Mid_7, normal, z1, GripperLeft;
!        StuckedNozzelRemoved := TRUE;
        
        g_GripIn;
        WaitTime 1;
        MoveJ Mid_6, Normal, z1, GripperLeft;
        MoveJ AboveJarOnBlackStation, Normal, z1, GripperLeft;
        g_MoveTo 15;
        MoveL AroundJarOnBlackStation, Normal, z1, GripperLeft;
        WaitTime 1.5;
        g_GripIn;
        WaitTime 0.5;
        MoveL AboveJarOnBlackStation, Slow, z1, GripperLeft;
        MoveJ Mid_6, Normal, z1, GripperLeft;
        MoveJ Mid_5, normal, z1, GripperLeft;
        MoveJ Mid_4, normal, z1, GripperLeft;
        MoveJ AboveJar, normal, z1, GripperLeft;
        MoveL AroundJar2, Slow, z1, GripperLeft;
        g_GripOut;
        MoveJ AboveJar, normal, z1, GripperLeft;
        g_GripIn;
        MoveJ AboveJarGripperClosed, normal, z1, GripperLeft;
        WaitTime 0.5;
        MoveJ AboveJar, normal, z1, GripperLeft;
        MoveJ Mid_4, normal, z1, GripperLeft;
        
        JarOnOrangeStation:=TRUE;
        WaitUntil CoverPicked=TRUE;
        MoveJ AboveJar, normal, z1, GripperLeft;
        g_GripOut;
        MoveL AroundJar2, Normal, z1, GripperLeft;
        g_GripIn;
        JarHolded := TRUE;
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
    
    PROC MoveJarFromBlack2Orange_analysis()
         g_GripIn;
        WaitTime 1;
        MoveJ Mid_6, Normal, z1, GripperLeft;
        MoveJ AboveJarOnBlackStation, Normal, z1, GripperLeft;
        g_MoveTo 15;
        MoveL AroundJarOnBlackStation, Normal, z1, GripperLeft;
        WaitTime 1.5;
        g_GripIn;
        WaitTime 5;
        MoveL AboveJarOnBlackStation, Slow, z1, GripperLeft;
        MoveJ Mid_6, Normal, z1, GripperLeft;
        MoveJ Mid_5, normal, z1, GripperLeft;
        MoveJ Mid_4, normal, z1, GripperLeft;
        MoveJ AboveJar, normal, z1, GripperLeft;
        MoveL AroundJar2, Slow, z1, GripperLeft;
        g_GripOut;
        MoveJ AboveJar, normal, z1, GripperLeft;
        g_GripIn;
        MoveJ AboveJarGripperClosed, normal, z1, GripperLeft;
        WaitTime 0.5;
        MoveJ AboveJar, normal, z1, GripperLeft;
        MoveJ Mid_4, normal, z1, GripperLeft;
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
    PROC MoveJarFromOrangeStation2Black()
        MoveJ MainMidPoint, Normal, z1, GripperLeft;
        MoveJ Mid_1, Normal, z1, GripperLeft;
        MoveJ Mid_2, Normal, z1, GripperLeft;
        MoveJ Mid_3, Normal, z1, GripperLeft;
        MoveJ NearJar, Normal, z1, GripperLeft;
        g_GripOut;
        WaitTime 1;
        MoveJ AroundJar, Normal, z1, GripperLeft;
        g_GripIn;
        WaitTime 1;
        MoveL AboveJar, Normal, z1, GripperLeft;
        
        MoveJ Mid_4, Normal, z1, GripperLeft;
        MoveJ Mid_5, Normal, z1, GripperLeft;
        MoveJ Mid_6, Normal, z1, GripperLeft;
        MoveJ AboveJarOnBlackStation, Normal, z1, GripperLeft;
        MoveL AroundJarOnBlackStation, Slow, z1, GripperLeft;
        WaitTime 1;
        g_MoveTo 15;
        MoveJ AboveJarOnBlackStation, Normal, z1, GripperLeft;
        MoveJ Mid_6, Normal, z1, GripperLeft;
        MoveJ Mid_5, Normal, z1, GripperLeft;
        MoveJ Mid_4, Normal, z1, GripperLeft;
        MoveJ Mid_3, Normal, z1, GripperLeft;
        MoveJ Mid_2, Normal, z1, GripperLeft;
        MoveJ Mid_1, Normal, z1, GripperLeft;
        MoveJ MainMidPoint, Normal, z1, GripperLeft;
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
    
    
    PROC FindJars_LeftArm()
        
        VAR num Unused := 0;
        VAR num Direction := 0;
        VAR num Rep := 0; ! repetition times
        VAR num Counter := 0;
        VAR num NumberOfResults := 10;
        VAR bool Unused2 := FALSE;
        VAR bool IsThereResult:= FALSE;
        L_Home:=FALSE;   
        L_Capture:=FALSE;
        PhotoTakenandPatternDetected:=FALSE;
        R_Home:=FALSE;
        
        g_Init \maxSpd := 25, \holdForce := 15;

        MotionSup\Off;
!        MoveJ LeftArmHome, Travel, z5, GripperLeft;
        MoveJ MainMidPoint, Normal, z1, GripperLeft;

        CamSetProgramMode CognexCamera;
        CamStartLoadJob CognexCamera, "CentrifugeCenterPart_lightpart.job";
        CamWaitLoadJob CognexCamera;
        CamSetExposure CognexCamera \ExposureTime:=40;
        CamSetRunMode CognexCamera;
        
        WHILE Counter<=10 DO
            TPWrite "Nothing found! I am taking another photo";
            CamReqImage CognexCamera \SceneId:= Scene_1;
            WaitTime 1;
            if CamNumberOfResults(CognexCamera)>=1 THEN
                IsThereResult := TRUE;
                TPWrite "I found a PeakyBlinder! :))";
                Counter := 11;
            ENDIF
            WaitTime 1;
            Counter := Counter + 1;
        ENDWHILE
        
        IF IsThereResult=FALSE THEN
            Unused := MoveFromMainMidPointToMidCtfg(Unused2);
            Counter := -1;
        ENDIF
        WHILE NOT(IsThereResult) DO
            CamReqImage CognexCamera \SceneId:= Scene_1;
            WaitTime 1;
!            TPWrite "Number of identified parts : "\Num:=NumberOfResults;
            if CamNumberOfResults(CognexCamera) >= 1 THEN
                IsThereResult := TRUE;
                TPWrite "I found a PeakyBlinder! :))";
            ENDIF
            if IsThereResult = FALSE THEN 
                TurnCtfgIfjarsDetectionFailed;
            ENDIF
            WaitTime 1;
            TPWrite "Nothing found! I am taking another photo";
        ENDWHILE
        IF Counter = -1 THEN
            Unused := MoveFromMidCtfgToMainMidPoint(Unused2);
        ENDIF
        
!        ERROR
!        IF ERRNO = ERR_CAM_NO_MORE_DATA THEN
!        ENDIF
        WaitTime 3;
        CamGetResult CognexCamera, mycamtarget \SceneId:= Scene_1;
        PatternAngle := mycamtarget.val1;
        IF (PatternAngle>-5 AND PatternAngle<85) THEN
            PatternAngle := PatternAngle - 20;
        ELSEIF (PatternAngle<-100 AND PatternAngle>-190) THEN
            PatternAngle := PatternAngle - 20;
        ENDIF
            
!        PhotoTakenandPatternDetected:=TRUE;
!        WaitUntil R_Home=TRUE;
        
        Unused := Move2ApproachPoint();
        
        g_GripOut;
        WaitTime 1;
        
        q6_Angle := CalculateAngleOf_q6();
        JointValuesAboveRotationPoint.robax.rax_6 := q6_Angle+45;
        MoveAbsJ JointValuesAboveRotationPoint, Normal, z5, GripperLeft;
        WaitTime 1;
        JointValuesAtRotationPoint.robax.rax_6 := q6_Angle+45;
        MoveAbsJ JointValuesAtRotationPoint, Slow, z5, GripperLeft;
        WaitTime 1;
        g_GripIn;
        WaitTime 1;
        IF (q6_Angle+45)>-9 THEN
            Direction := -1;
        ELSE
            Direction := 1;
        ENDIF
        Rep := Round(abs(q6_Angle+45-9) ) DIV 30;
        WHILE Rep>0 DO
            JointValuesAtRotationPoint.robax.rax_6 := JointValuesAtRotationPoint.robax.rax_6 + 30*Direction;
            MoveAbsJ JointValuesAtRotationPoint, VerySlow, z5, GripperLeft;
            g_MoveTo 21;
            WaitTime 0.8;
            g_GripIn;
            WaitTime 0.2;
            Rep := Rep - 1;
        ENDWHILE
        JointValuesAtRotationPoint.robax.rax_6 := -9;
        MoveAbsJ JointValuesAtRotationPoint, VerySlow, z5, GripperLeft;
        WaitTime 3;
        g_GripOut;
        WaitTime 0.5;
        JointValuesAboveRotationPoint.robax.rax_6 := -9;
        MoveAbsJ JointValuesAboveRotationPoint, Normal, z5, GripperLeft;
        WaitTime 1;
        
        MoveJ CentrifugeCenter, Normal, z1, GripperLeft;

        L_Home:=FALSE;   
        L_Capture:=FALSE;
        PhotoTakenandPatternDetected:=FALSE;
        R_Home:=FALSE;
!        draft3:= MoveFromMidCtfgToMainMidPoint(fr);
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
    
    PROC TurnCtfgIfjarsDetectionFailed()
        VAR bool draft := FALSE;
        VAR num draft2;
        MoveAbsJ ApproachingPointAboveBlackSpot_2, Normal, z5, GripperLeft;
        g_GripOut;
        MoveJ Error_TurnCtfg1, Normal, z1, GripperLeft;
        WaitTime 0.5;
        g_GripIn;
        waittime 0.5;
        MoveAbsJ ApproachingPointAboveBlackSpot, Slow, z5, GripperLeft;
        WaitTime 1;
        g_GripOut;
        WaitTime 0.5;
        MoveAbsJ ApproachingPointAboveBlackSpot_2, Normal, z5, GripperLeft;
        MoveJ CentrifugeCenter, Normal, z1, GripperLeft;
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
    
    FUNC num CalculateAngleOf_q6()
        IF (PatternAngle>=0.00 AND PatternAngle<=90.00) OR (PatternAngle<=-90.00 AND PatternAngle>=-180.00) OR (PatternAngle<=0.00 AND PatternAngle>=-90.00) THEN
            RETURN q6_ZeroPosition + PatternAngle;
        ELSE
            RETURN q6_ZeroPosition + PatternAngle + 360;
        ENDIF
    ENDFUNC   
        
    func num Move2ApproachPoint()
        VAR num draft;
        VAR Bool T := FALSE;
!        MoveFromHomeToMainMidPoint;
        draft := MoveFromMainMidPointToMidCtfg(T);
        !MoveJ ApproachingPointAboveBlackSpot, [50,50,50,50], z5, GripperLeft;
        RETURN 0;
    ENDFUNC
    
    PROC CloseLid()
        !MoveFromCentrifugiToClosingPoint;
        MoveJ p21, Travel, z5, GripperLeft;
        MoveJ p22, Normal, z1, GripperLeft;
        MoveJ p23, Slow, z1, GripperLeft;
        MoveJ p24, Slow, z1, GripperLeft;
        MoveJ p25, Normal, z1, GripperLeft;
        MoveJ p26, Normal, z1, GripperLeft;
        MoveJ p27, Normal, z1, GripperLeft;
        MoveJ p28, Normal, z1, GripperLeft;
        MoveJ p29, Normal, z1, GripperLeft;
        MoveJ p210, Normal, z1, GripperLeft;
!        MoveJ p211, Normal, z1, GripperLeft;
!        MoveJ p212, Normal, z1, GripperLeft;
        Waittime 5;
    ENDPROC
    
    proc MoveFromHomeToMainMidPoint() 
        MoveJ LeftArmHome, Travel, z1, GripperLeft;
        MoveJ MainMidPoint, Travel, z1, GripperLeft;
    ENDPROC
    
    proc MoveFromMainMidPointToHome()
        MoveJ MainMidPoint, Travel, z1, GripperLeft;
        MoveJ LeftArmHome, Travel, z1, GripperLeft;
    ENDPROC
    
    proc OpenLidFromMainMidPoint()
        MoveJ MainMidPoint, Normal, z1, GripperLeft;
        MoveJ FromMainMidPointToOpenLid1, Travel, z1, GripperLeft;
        MoveJ FromMainMidPointToOpenLid2, Travel, z1, GripperLeft;
        MoveJ FromMainMidPointToOpenLid3, Normal, z1, GripperLeft;
        MoveJ FromMainMidPointToOpenLid4, Slow, z1, GripperLeft;
        WaitTime 1;
        MoveJ FromMainMidPointToOpenLid3, Normal, z1, GripperLeft;
        MoveJ StuckLidOpen1, Normal, z1, GripperLeft;
        MoveJ StuckLidOpen2, Normal, z1, GripperLeft;
        MoveJ StuckLidOpen3, Normal, z1, GripperLeft;
        MoveJ StuckLidOpen4, Slow, z1, GripperLeft;
        MoveJ StuckLidOpen5, Slow, z1, GripperLeft;
!        MoveJ StuckLidOpen6, Slow, z1, GripperLeft;
!        MoveJ StuckLidOpen7, Slow, z1, GripperLeft;
!        MoveJ StuckLidOpen6, Travel, z1, GripperLeft;
        MoveJ MainMidPoint, Travel, z1, GripperLeft;
    ENDPROC
    
    proc MoveFromLidOpeningToMainMidPoint()
        MoveJ FromMainMidPointToOpenLid3, Travel, z1, GripperLeft;
        MoveJ FromMainMidPointToOpenLid2, Travel, z1, GripperLeft;
        MoveJ FromMainMidPointToOpenLid1, Travel, z1, GripperLeft;
        MoveJ MainMidPoint, Travel, z1, GripperLeft;
    ENDPROC
    
    FUNC num MoveFromMainMidPointToMidCtfg(var bool IsHandLoaded)
        var speeddata spd := [0,0,0,0];
        IF IsHandLoaded THEN
            spd := Normal;
        ELSE
            spd := v500;
        ENDIF
        MoveJ MainMidPoint, spd, z1, GripperLeft;
        MoveJ FromMainMidPointToMidCtfg3, spd, z1, GripperLeft;
        MoveJ FromMainMidPointToMidCtfg4, spd, z1, GripperLeft;
        MoveJ FromMainMidPointToMidCtfg5, spd, z1, GripperLeft;
        MoveJ CentrifugeCenter, spd, z1, GripperLeft;
        RETURN 0;
    ENDFUNC
    
    FUNC num MoveFromMidCtfgToMainMidPoint(var bool IsHandLoaded)
        var speeddata spd := [0,0,0,0];
        IF IsHandLoaded THEN
            spd := Normal;
        ELSE
            spd := v500;
        ENDIF
        MoveJ CentrifugeCenter, spd, z1, GripperLeft;
        MoveJ FromMainMidPointToMidCtfg5, spd, z1, GripperLeft;
        MoveJ FromMainMidPointToMidCtfg4, spd, z1, GripperLeft;
        MoveJ FromMainMidPointToMidCtfg3, spd, z1, GripperLeft;
        MoveJ MainMidPoint, spd, z1, GripperLeft;        
        RETURN 0;
    ENDFUNC
    
    PROC PutJarIn_0_angleHole()
        MoveJ CentrifugeCenter, Normal, z1, GripperLeft;
        MoveJ FromMidCtfg1To_0_angleHole1, Normal, z1, GripperLeft;
        MoveJ FromMidCtfg1To_0_angleHole2, Normal, z1, GripperLeft;
        IF NewJars=TRUE THEN
          MoveJ FromMidCtfg1To_0_angleHole3_New, Slow, z1, GripperLeft;
        ELSE
          MoveJ FromMidCtfg1To_0_angleHole3, Slow, z1, GripperLeft;
        ENDIF 
        g_MoveTo 20;
        WaitTime 1;
        MoveToMidCtfgFrom_0_angleHole;
    ENDPROC
    
    PROC TakeOutJarFrom_0_angleHole()
        g_MoveTo 20;
        MoveJ FromMidCtfg1To_0_angleHole1, Normal, z1, GripperLeft;
        MoveJ FromMidCtfg1To_0_angleHole2, Normal, z1, GripperLeft;
        
        IF NewJars=TRUE THEN
            MoveL FromMidCtfg1To_0_angleHole3_New, Slow, z1, GripperLeft;
        ELSE
            MoveL FromMidCtfg1To_0_angleHole3, Slow, z1, GripperLeft;
        ENDIF
        WaitTime 0.5;
        g_GripIn;
        WaitTime 1;
        MoveToMidCtfgFrom_0_angleHole;        
    ENDPROC
    
    PROC MoveToMidCtfgFrom_0_angleHole()
        IF NewJars=TRUE THEN
            MoveJ FromMidCtfg1To_0_angleHole3_New, Slow, z1, GripperLeft;
        ELSE
            MoveJ FromMidCtfg1To_0_angleHole3, Slow, z1, GripperLeft;
        ENDIF
        MoveL FromMidCtfg1To_0_angleHole2, Slow, z1, GripperLeft;
        MoveJ FromMidCtfg1To_0_angleHole1, Normal, z1, GripperLeft;
        MoveJ CentrifugeCenter, Normal, z1, GripperLeft;
    ENDPROC
    
    PROC PutJarIn_180_angleHole()
        MoveJ CentrifugeCenter, Normal, z1, GripperLeft;
        MoveJ FromMidCtfg1To_180_angleHole1, Normal, z1, GripperLeft;
        MoveJ FromMidCtfg1To_180_angleHole2, Normal, z1, GripperLeft;
        IF NewJars=TRUE THEN
            MoveJ FromMidCtfg1To_180_angleHole3_Ne, Slow, z1, GripperLeft;
        ELSE
            MoveJ FromMidCtfg1To_180_angleHole3, Slow, z1, GripperLeft;
        ENDIF
        
        g_MoveTo 20;
        WaitTime 1;
        MoveToMidCtfgFrom_180_angleHole;
    ENDPROC
    
    PROC TakeOutJarFrom_180_angleHole()
        g_MoveTo 20;
        WaitTime 0.5;
        MoveJ FromMidCtfg1To_180_angleHole1, Normal, z1, GripperLeft;
        MoveJ FromMidCtfg1To_180_angleHole2, Normal, z1, GripperLeft;
        IF NewJars=TRUE THEN
            MoveJ FromMidCtfg1To_180_angleHole3_Ne, Normal, z1, GripperLeft;
        ELSE
            MoveJ FromMidCtfg1To_180_angleHole3, Normal, z1, GripperLeft;
        ENDIF
        WaitTime 0.5;
        g_GripIn;
        WaitTime 1;
        MoveToMidCtfgFrom_180_angleHole;
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
    
    PROC MoveToMidCtfgFrom_180_angleHole()
        IF NewJars=TRUE THEN
            MoveJ FromMidCtfg1To_180_angleHole3_Ne, Normal, z1, GripperLeft;
        ELSE
            MoveJ FromMidCtfg1To_180_angleHole3, Normal, z1, GripperLeft;
        ENDIF
        MoveJ FromMidCtfg1To_180_angleHole2, Slow, z1, GripperLeft;
        MoveJ FromMidCtfg1To_180_angleHole1, Normal, z1, GripperLeft;
        MoveJ CentrifugeCenter, Normal, z1, GripperLeft;
    ENDPROC
    
    PROC Turn_On_Off_Centrifuge_from_MMP()
        g_GripIn;
        MoveJ MainMidPoint, Travel, z1, GripperLeft;
        MoveJ FromMainMidPointToRotCtfg1, Travel, z1, GripperLeft;
        MoveJ FromMainMidPointToRotCtfg2, Travel, z1, GripperLeft;
        MoveJ FromMainMidPointToRotCtfg3, Travel, z1, GripperLeft;
        MoveJ FromMainMidPointToRotCtfg4, Slow, z1, GripperLeft;
        WaitTime 2;
        MoveJ FromMainMidPointToRotCtfg3, Normal, z1, GripperLeft;
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
    
    proc MoveFromTurningCntfgOnOffTo_MMP()
        MoveJ FromMainMidPointToRotCtfg3, Travel, z1, GripperLeft;
        MoveJ FromMainMidPointToRotCtfg2, Travel, z1, GripperLeft;
        MoveJ FromMainMidPointToRotCtfg1, Travel, z1, GripperLeft;
        MoveJ MainMidPoint, Travel, z1, GripperLeft;
    ENDPROC
    
    PROC MoveFrom_MMP_ToClosingPoint()
        MoveAbsJ MidPointForClosing, Travel, z5, GripperLeft;
        MoveJ ClosingPoint, Travel, z5, GripperLeft;
    ENDPROC
    
    PROC MoveTo_MMP_FromLastClosingPoint()
        MoveAbsJ FromLastClosingPointToMMP1, Travel, z5, GripperLeft;
        MoveAbsJ MidPointForClosing, Travel, z5, GripperLeft;
        MoveJ MainMidPoint, Travel, z1, GripperLeft;
    ENDPROC
    
    PROC PickJar()
        g_GripOut;
        Movej temp11, Normal, z1, GripperLeft;
        MoveL temp22_2, Normal, z1, GripperLeft;
        WaitTime 1;
        g_GripIn;
        WaitTime 0.5;
        MoveL temp11, Normal, z1, GripperLeft;
        WaitTime 0.5;
        Movej temp33, Normal, z1, GripperLeft;
        Movej MainMidPoint, Normal, z1, GripperLeft;
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
    
    PROC PutJarInOrangeStation()
        Movej temp33, Normal, z1, GripperLeft;
        Movej temp11, Normal, z1, GripperLeft;
        MoveL temp22_2, Slow, z1, GripperLeft;
        WaitTime 1;
        g_GripOut;
        WaitTime 0.5;
        MoveL temp11, Normal, z1, GripperLeft;
        Movej temp33, Travel, z1, GripperLeft;
        Movej MainMidPoint, Travel, z1, GripperLeft;
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
    
    PROC PickSecondJar()
        g_GripOut;
        MoveJ PickSecondJar_1, Travel, z1, GripperLeft;
        IF NewJars=TRUE THEN
           MoveJ PickSecondJar_2_New, Normal, z1, GripperLeft;
       ELSE
            MoveJ PickSecondJar_2, Normal, z1, GripperLeft;
       ENDIF
        g_GripIn;
        MoveJ PickSecondJar_1, Normal, z1, GripperLeft;
        MoveJ MainMidPoint, Normal, z1, GripperLeft;
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
    
    PROC PlaceFirstJar()
        MoveJ PickFirstJar_1, Normal, z1, GripperLeft;
        MoveJ PickFirstJar_2, Normal, z1, GripperLeft;
        WaitTime 1;
        g_GripOut;
        WaitTime 0.5;
        MoveJ MainMidPoint, Travel, z1, GripperLeft;
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
    
    PROC PlaceSecondJar()
        MoveJ PickSecondJar_1, Normal, z1, GripperLeft;
        MoveJ PickSecondJar_2, Normal, z1, GripperLeft;
        WaitTime 1;
        g_GripOut;
        WaitTime 0.5;
        MoveJ MainMidPoint, Travel, z1, GripperLeft;
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
    
    PROC ChangePoints()
        FromMidCtfg1To_0_angleHole3.trans.x := FromMidCtfg1To_0_angleHole3.trans.x + 10;
        FromMidCtfg1To_0_angleHole3.trans.z := FromMidCtfg1To_0_angleHole3.trans.z + 18;

        FromMidCtfg1To_180_angleHole3.trans.x := FromMidCtfg1To_180_angleHole3.trans.x + 10;
        FromMidCtfg1To_180_angleHole3.trans.z := FromMidCtfg1To_180_angleHole3.trans.z + 18;
        
        PickFirstJar_2.trans.z := PickFirstJar_2.trans.z + 18;
        PickSecondJar_2.trans.z := PickSecondJar_2.trans.z + 18;

    ENDPROC
    
    PROC MoveJarFromCtfgToOrangeStation()
        VAR bool IsItLoaded := TRUE;
        VAR num draft;
        TakeOutJarFrom_0_angleHole;
        draft := MoveFromMidCtfgToMainMidPoint(IsItLoaded);
        Movej temp11, Normal, z1, GripperLeft;
        MoveL temp22_2, Normal, z1, GripperLeft;
        waittime 1;
        g_GripOut;
        Movej temp11, Normal, z1, GripperLeft;
        Movej MainMidPoint, Normal, z1, GripperLeft;
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
    
    PROC EmptyJarInFunnel()
!        HoldJarInOrange;
        !OpenCoverByRightHnd
        Movej EmptyJarInFunnel1, Normal, z1, GripperLeft;
        Movej EmptyJarInFunnel2, Normal, z1, GripperLeft;
        Movej EmptyJarInFunnel3, Normal, z1, GripperLeft;
        Movej EmptyJarInFunnel4, Normal, z1, GripperLeft;
        Movej EmptyJarInFunnel5, Normal, z1, GripperLeft;
        MoveAbsJ EmptyJarInFunnel6, slow, z5, GripperLeft;
        Movej EmptyJarInFunnel7, Slow, z1, GripperLeft;
        MoveAbsJ EmptyJarInFunnel8, slow, z5, GripperLeft;
        Movej EmptyJarInFunnel7, Normal, z1, GripperLeft;
        MoveAbsJ EmptyJarInFunnel6, Normal, z5, GripperLeft;
        Movej EmptyJarInFunnel5, Travel, z1, GripperLeft;
        Movej EmptyJarInFunnel4, Travel, z1, GripperLeft;
        Movej MainMidPoint, Travel, z1, GripperLeft;
        Movej LeftArmHome2, Travel, z1, GripperLeft;
        WaitTime 0.5;
        g_GripOut;
        Movej MainMidPoint, Travel, z1, GripperLeft;
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
    


    
    
    FUNC bool TurnOnOffPump(bool state)
        g_GripIn;
        Movej MainMidPoint, Normal, z1, GripperLeft;
        Movej TurnOnOffPump1, Travel, z1, GripperLeft;
        IF state = TRUE THEN
            Movej TurnOnOffPump2, Normal, z1, GripperLeft;
            Movej TurnOnOffPump3, slow, z1, GripperLeft;
            WaitTime 1;
        ELSEIF state = FALSE THEN
            Movej TurnOnOffPump4, Normal, z1, GripperLeft;
            Movej TurnOnOffPump5, slow, z1, GripperLeft;
            WaitTime 1;
        ENDIF
        Movej TurnOnOffPump1, Normal, z1, GripperLeft;
        Movej MainMidPoint, Travel, z1, GripperLeft;
        RETURN state;
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
    ENDFUNC
    
!    PROC PutUsedFilterInPlate()
!        WaitUntil PlateInPosition = TRUE;
!        MoveL PutUsedFilterInPlate9_4, VerySlow, z5, GripperLeft;
!        MoveJ PutUsedFilterInPlate10, Slow, z5, GripperLeft;
!        MoveJ PutUsedFilterInPlate11, Normal, z5, GripperLeft;
!        MoveJ PutUsedFilterInPlate12, Travel, z5, GripperLeft;
!        MoveJ PutUsedFilterInPlate13, Travel, z5, GripperLeft;
!        MoveJ PutUsedFilterInPlate2, Travel, z5, GripperLeft;
!        MoveJ PutUsedFilterInPlate1, Travel, z5, GripperLeft;
!        Movej MainMidPoint, Travel, z1, GripperLeft;
        
!    ENDPROC
    
    PROC BorderingFilterToPutInPlate()
        Movej MainMidPoint, Travel, z1, GripperLeft;
        g_GripOut;
        MoveJ PutUsedFilterInPlate1, Travel, z5, GripperLeft;
        MoveJ PutUsedFilterInPlate2, Travel, z5, GripperLeft;
        MoveJ PutUsedFilterInPlate3, Travel, z5, GripperLeft;
        MoveJ PutUsedFilterInPlate4, Travel, z5, GripperLeft;
        MoveJ PutUsedFilterInPlate5, Normal, z5, GripperLeft;
        MoveJ PutUsedFilterInPlate6, Normal, z5, GripperLeft;
        
!        MoveJ PutUsedFilterInPlate7, Normal, z5, GripperLeft;
        MoveJ PutUsedFilterInPlate8, Slow, z5, GripperLeft;
        WaitUntil R_GripperInPosition5 = TRUE;
        MoveL PutUsedFilterInPlate9_1, VerySlow, z5, GripperLeft;
        DoneWithPosition5 := TRUE;
        WaitUntil R_GripperInPosition4 = TRUE;
        MoveL PutUsedFilterInPlate9_2, VerySlow, z5, GripperLeft;
        DoneWithPosition4 := TRUE;
!        WaitUntil R_GripperInPosition3 = TRUE;
!!        MoveL PutUsedFilterInPlate9_3, VerySlow, z5, GripperLeft;
!        DoneWithPosition3 := TRUE;
        WaitUntil PlateInPosition=TRUE;
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
    
    PROC PutFilterInPLate_FinalPush_()
        
        MoveL PutUsedFilterInPlate9_4, VerySlow, z5, GripperLeft;
        MoveJ PutUsedFilterInPlate7, Slow, z5, GripperLeft;
        FilterInPlate := TRUE;
        MoveJ PutUsedFilterInPlate10, Normal, z5, GripperLeft;
        MoveJ PutUsedFilterInPlate11, Normal, z5, GripperLeft;
        MoveJ PutUsedFilterInPlate12, Travel, z5, GripperLeft;
        MoveJ PutUsedFilterInPlate13, Travel, z5, GripperLeft;
        MoveJ PutUsedFilterInPlate2, Travel, z5, GripperLeft;
        MoveJ PutUsedFilterInPlate1, Travel, z5, GripperLeft;
        Movej MainMidPoint, Travel, z1, GripperLeft;
    ENDPROC
    
    
    PROC MOV2_4()
        ZeroingVariables;
        BorderingFilterToPutInPlate;
    ENDPROC

    PROC OpenLock()
        Movej MainMidPoint, Normal, z1, GripperLeft;
        Movej OpenLock1, Normal, z1, GripperLeft;
        Movej OpenLock2, Travel, z1, GripperLeft;
        Movej OpenLock3, Travel, z1, GripperLeft;
        g_MoveTo 6;
        Movej OpenLock4, Travel, z1, GripperLeft;
        
        Set custom_DO_7;
        Movej OpenLock5, Slow, z1, GripperLeft;
        waittime 1;
        g_GripIn;
        WaitTime 1;
        g_MoveTo 6;
        Movej OpenLock6, Slow, z1, GripperLeft;
        Movej OpenLock7, Slow, z1, GripperLeft;
        Movej OpenLock8, Slow, z1, GripperLeft;
        Movej OpenLock9, Normal, z1, GripperLeft;
        g_GripIn;
        Movej OpenDoor1, Travel, z1, GripperLeft;
        Movej OpenDoor2, SLow, z1, GripperLeft;
        Movej OpenDoor3, SLow, z1, GripperLeft;
        Movej OpenDoor4, Normal, z1, GripperLeft;
!        Movej OpenDoor5, Slow, z1, GripperLeft;
        Movej OpenDoor6, Normal, z1, GripperLeft;
        Movej OpenDoor7, Normal, z1, GripperLeft;
        Movej OpenDoor8, Normal, z1, GripperLeft;
        Movej OpenDoor9, Slow, z1, GripperLeft;
        Movej OpenDoor8, Normal, z1, GripperLeft;
        Movej OpenDoor7, Travel, z1, GripperLeft;
        Movej OpenDoor6, Travel, z1, GripperLeft;
        Movej OpenLock9, Travel, z1, GripperLeft;
        
       ! Reset custom_DO_7;
        Movej OpenLock3, Travel, z1, GripperLeft;
        Movej OpenLock2, Travel, z1, GripperLeft;
        Movej OpenLock1, Travel, z1, GripperLeft;
        Movej MainMidPoint, Travel, z1, GripperLeft;
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
    
    PROC ZeroingVariablesForMOV2_3()
        FilterInPlate := FALSE;
        CapinetOpened := FALSE;
        FilteringFinished := FALSE;
        FunnelInPosition := FALSE;
        R_GripperInPosition5 := FALSE;
        R_GripperInPosition4 := FALSE;
        R_GripperInPosition3 := FALSE;
        DoneWithPosition3 := FALSE;
        DoneWithPosition4 := FALSE;
        DoneWithPosition3 := FALSE;
    ENDPROC
    
    func Bool MOV2_3(var Bool DoINeedToOpen)
        VAR bool State := TRUE;
        VAR bool NotUsed;
        WaitUntil CoverOpened = TRUE;
        g_Stop;
        ZeroingVariablesForMOV2_3;
        WaitUntil FunnelInPosition = TRUE;
        Held_ToMainMidPoint;
        NotUsed := TurnOnOffPump(State);
        HoldJarInOrange;
        WaitTime 0.5;
        EmptyJarInFunnel;
        WaitTime 12;
        State := FALSE;
!        WHILE reg1 <> 4 DO
!            TPErase;
!            TPReadFK reg1, "Filtration proc finished?", stEmpty, stEmpty, stEmpty, "Yes", "No";
!        ENDWHILE
!        reg1:=0;
        NotUsed := TurnOnOffPump(State);
        FilteringFinished := TRUE;
        Waituntil filterDis = TRUE;
!        BorderingFilterToPutInPlate;
!        PutFilterInPLate_FinalPush_;
        TweezersLeft;
        IF DoINeedToOpen = TRUE THEN
            OpenLock;
            Held_LeftHoldingJar := FALSE;
        ENDIF
        WaitTime 5;
        CapinetOpened := TRUE;
        
        RETURN DoINeedToOpen;
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
        
    ENDFUNC
    
    PROC TweezersLeft()
        MoveJ MainMidPoint,Travel, z1, GripperLeft;
        WaitUntil PlateInPosition = TRUE;
        g_Init \maxSpd := 25;
        g_GripOut;
        MoveJ AboveTweezers,Normal,z1,GripperLeft;
        MoveL AroundTweezersGrip,Slow,z1,GripperLeft;
        
        waittime 5;
        g_gripin \holdForce :=20;
        
        MoveL AboveTweezers,Normal,z1,GripperLeft;
        MoveJ PlaceFilterT1,Travel, z1, GripperLeft;
        MoveJ PlaceFilterT2,Normal, z1, GripperLeft;
        waittime 1;
       
        Movej PlaceFilterT3,Slow, z1, GripperLeft, \WObj:=vacuumTower;
        waittime 2;
        
        Movel PlaceFilterT4,Slow, z1, GripperLeft, \WObj:=vacuumTower;
        waittime 1;
        
        
        
        MoveJ PlaceFilterT5,Slow, z1, GripperLeft, \WObj:=vacuumTower;
        waittime 1;

        g_stop;
        waittime 1;
        g_GripIn \holdForce :=20;
        WaitTime 1;
        MoveJ PlaceFilterNearPlate,Slow, z1, GripperLeft, \WObj:=vacuumTower;
        MoveL PlaceFilterAbovePlate,Normal, z1, GripperLeft, \WObj:=vacuumTower;
        WaitTime 1;
        g_stop;
        MoveL AwayFromPlate,Slow, z1, GripperLeft, \WObj:=vacuumTower;
        WaitTime 1;
        g_GripIn \holdForce :=20;
        MoveJ PlaceFilterT2,Normal, z1, GripperLeft;
        MoveJ PlaceFilterT1,Travel, z1, GripperLeft;
        FilterInPlate := TRUE;
        MoveJ AboveTweezers,Normal,z1,GripperLeft;
        MoveJ AroundTweezersClose,Slow,z1,GripperLeft;
        MoveJ AroundTweezers,Slow,z1,GripperLeft;
        
        waittime 5;
        g_gripout;
        
        MoveL AboveTweezersReorient,Slow,z1,GripperLeft;
        MoveL TweezHelp1,Normal,z1,GripperLeft;
        
        MoveJ MainMidPoint,Travel, z1, GripperLeft;
        
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
    

    PROC LiftJarToNozzle(VAR bool liftAction)
        MoveJ Mid_6, Normal, z1, GripperLeft;
        g_MoveTo 14;
        MoveJ AboveJarOnBlackStation, Normal, z1, GripperLeft;
        MoveL AroundJarOnBlackStation, Normal, z1, GripperLeft;
        MoveL LiftComPos, Slow, z1, GripperLeft;
        WaitTime 1.5;
        g_GripIn;
        WaitTime 0.5;
        
        IF liftAction = TRUE THEN
            MoveL JarLiftPositionFill, Slow, z1, GripperLeft;
            WaitTime 1;
            JarLifted := TRUE;
        ELSEIF liftAction = FALSE THEN
            MoveL JarLiftPositionSuc, Slow, z1, GripperLeft;
            WaitTime 2;
            JarLiftedSuc := TRUE;
        ENDIF
        
        
        WaitUntil PippeteEmptied = TRUE;
        MoveL LiftComPos, Slow, z1, GripperLeft;
        WaitTime 0.5;
        g_MoveTo 14;
        WaitTime 0.5;
        PippeteEmptied:=FALSE;
        JarLifted := FALSE;
        JarLiftedSuc := FALSE;
        MoveL AroundJarOnBlackStation, Normal, z1, GripperLeft;
        MoveL AboveJarOnBlackStation, Normal, z1, GripperLeft;
        MoveL Mid_6, Normal, z1, GripperLeft;
        MoveJ Mid_5, Normal, z1, GripperLeft;
        MoveJ Mid_4, Travel, z1, GripperLeft;
        MoveJ MainMidPoint, Travel, z1, GripperLeft;
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
    
    
    PROC bottleHandling(var num botNum)
        Movej bottleCommonHome, Travel, z1, GripperLeft;
        g_Init \maxSpd := 25, \holdForce := 20;
        g_gripOut;
        TEST botNum
        CASE 1:
            bottleNumVar:=bottle1Home;
            bottleNumVarAbove:=bottle1AboveHome;
        CASE 2:
            bottleNumVar:=bottle2Home;
            bottleNumVarAbove:=bottle2AboveHome;
        CASE 3:
            bottleNumVar:=bottle3Home;
            bottleNumVarAbove:=bottle3AboveHome;
        CASE 4:
            bottleNumVar:= bottle1AnHome;
            bottleNumVarAbove:=bottle1AnAboveHome;
        CASE 5:
            bottleNumVar:=bottle2AnHome;
            bottleNumVarAbove:=bottle2AnAboveHome;
        ENDTEST
        !Cap removal
        Movej bottleNumVarAbove, Travel, z1, GripperLeft;
        
        bottleNumVar.trans.z:= bottleNumVar.trans.z + botCap;
        MoveL bottleNumVar, Slow, z1, GripperLeft;
        Waittime 0.5;
        g_GripIn;
        Waittime 0.5;
        Movel bottleNumVarAbove, Normal, z1, GripperLeft;
        movel bottleCapAbove,normal, z1, GripperLeft;
        movel bottleCap,normal, z1, GripperLeft;
        waittime 1;
        g_gripout;
        Waittime 0.5;
        movel bottleCapAbove,normal, z1, GripperLeft;
        
        Movej bottleNumVarAbove, Travel, z1, GripperLeft;
        bottleNumVar.trans.z:= bottleNumVar.trans.z - botCap;
        MoveL bottleNumVar, Slow, z1, GripperLeft;
        Waittime 0.5;
        g_GripIn;
        Waittime 0.5;
        MoveL bottleNumVarAbove, Slow, z1, GripperLeft;
        MoveL bottleCommonTrans, Slow, z1, GripperLeft;
        MoveL bottleCommonAboveBase, Slow, z1, GripperLeft;
        MoveL bottleCommonBase, Slow, z1, GripperLeft;
        waittime 0.5;
        g_gripOut;
        bottleChanged:=TRUE;
        MoveL bottleCommonAboveBase, Normal, z1, GripperLeft;
        MoveJ bottleCommonTrans, Travel, z1, GripperLeft;
        MoveJ MainMidPoint,Travel,z1,GripperLeft;
        g_Init \maxSpd := 25, \holdForce := 10;
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
    
    PROC removeBottle(var num botNum)
        bottleChanged := FALSE;
        g_Init \maxSpd := 25, \holdForce := 20;
        g_gripOut;
        MoveJ bottleCommonTrans, Travel, z1, GripperLeft;
        MoveL bottleCommonAboveBase, Normal, z1, GripperLeft;
        MoveL bottleCommonBase, Slow, z1, GripperLeft;
        waittime 0.5;
        g_gripIn;
        waittime 0.5;
        MoveL bottleCommonAboveBase, Slow, z1, GripperLeft;
        MoveJ bottleCommonTrans, Slow, z1, GripperLeft;
        TEST botNum
        CASE 1:
            bottleNumVar:=bottle1Home;
            bottleNumVarAbove:=bottle1AboveHome;
        CASE 2:
            bottleNumVar:=bottle2Home;
            bottleNumVarAbove:=bottle2AboveHome;
        CASE 3:
            bottleNumVar:=bottle3Home;
            bottleNumVarAbove:=bottle3AboveHome;
        CASE 4:
            bottleNumVar:= bottle1AnHome;
            bottleNumVarAbove:=bottle1AnAboveHome;
        CASE 5:
            bottleNumVar:=bottle2AnHome;
            bottleNumVarAbove:=bottle2AnAboveHome;
        ENDTEST
        MoveJ bottleCommonHome, Slow, z1, GripperLeft;
        Movej bottleNumVarAbove, Slow, z1, GripperLeft;
        MoveL bottleNumVar, Slow, z1, GripperLeft;
        Waittime 1;
        g_GripOut;
        Waittime 0.5;
        MoveL bottleNumVarAbove, Normal, z1, GripperLeft;
        
        !Cap returnal
        movel bottleCapAbove,normal, z1, GripperLeft;
        movel bottleCap,normal, z1, GripperLeft;
        waittime 1;
        g_gripin;
        Waittime 0.5;
        movel bottleCapAbove,normal, z1, GripperLeft;
        
        Movej bottleNumVarAbove, Travel, z1, GripperLeft;
        bottleNumVar.trans.z:= bottleNumVar.trans.z + botCap;
        MoveL bottleNumVar, Slow, z1, GripperLeft;
        Waittime 0.5;
        g_GripOut;
        Waittime 0.5;
        Movej bottleNumVarAbove, Normal, z1, GripperLeft;
        
        MoveJ bottleCommonHome, Normal, z1, GripperLeft;
        MoveJ MainMidPoint,Travel,z1,GripperLeft;
        g_Init \maxSpd := 25, \holdForce := 10;
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
    
    PROC shakeTube ()
        VAR num Counter := 5;
        g_Init \maxSpd := 25, \holdForce := 20;
        HoldJarInOrange;
        MoveL AboveJar, Slow, z1, GripperLeft;  
        shakeTubeClosed3 := shakeTubeClosed2;
        ShakeStarted:=TRUE;
        waituntil readytoCount = TRUE;
        WHILE (ShakeOver = FALSE) DO
            shakeTubeClosed3.robax.rax_6 := shakeTubeClosed2.robax.rax_6 + 120;
            MoveABSJ shakeTubeClosed3, v7000, z1, GripperLeft;
            shakeTubeClosed3.robax.rax_6 := shakeTubeClosed2.robax.rax_6 - 140;
            MoveABSJ shakeTubeClosed3, v7000, z1, GripperLeft;
            Counter := Counter - 1;
        ENDWHILE
        ShakeStarted := FALSE;
        ShakeOver := FALSE;
        MoveABSJ shakeTubeClosed2, v7000, z1, GripperLeft;
        WaitTime 1;
        MoveL AroundJar2, Normal, z1, GripperLeft;
        WaitTime 0.5;
        g_GripOut;
        MoveL AboveJar, Travel, z1, GripperLeft; 
        g_GripIn;
        MoveJ AboveJarGripperClosedWithCover, Normal, z1, GripperLeft;
        WaitTime 0.5;
        MoveJ AboveJar, Travel, z1, GripperLeft;
        Movej MainMidPoint, Normal, z1, GripperLeft;  
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
    endproc
    
     
    PROC PickFilterForAnalysisProc()
        VAR BOOL NOTUSED;
        waituntil RightArmWaiting =TRUE;
        NotUsed := TurnOnOffPump(TRUE);
        VaccumIsOn := TRUE;
        WaitTime 0.5;
        WaitUntil FilterRemovedFromPlate = TRUE;
        NotUsed := TurnOnOffPump(FALSE);
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
    
    
PROC PickAndPlaceDoneAnalysisJars()
!    FOR i from 1 TO 2 DO
        g_GripOut;
        waittime 0.5;
        MoveJ AboveJar, normal, z1, GripperLeft;
        MoveJ temp111, Travel, z1, GripperLeft;
        Movej temp11, Normal, z1, GripperLeft;
        MoveL temp22_2, Normal, z1, GripperLeft;
        WaitTime 1;
        g_GripIn;
        WaitTime 0.5;
        MoveL temp11, Normal, z1, GripperLeft;
        WaitTime 0.5;
        Movej PickAndPlaceDoneAnalysisJars1, Normal, z1, GripperLeft;
        Movej PickAndPlaceDoneAnalysisJars2, Normal, z1, GripperLeft;
        Movej PickAndPlaceDoneAnalysisJars3, Normal, z1, GripperLeft;
        Movej PickAndPlaceDoneAnalysisJars4, Normal, z1, GripperLeft;
        IF NumOfDoneAnalysisJar=1 THEN
            Movej PickAndPlaceDoneAnalysisJars5, Slow, z1, GripperLeft;
            Movej PickAndPlaceDoneAnalysisJars6, Slow, z1, GripperLeft;
!           Movej PickAndPlaceDoneAnalysisJars7, Slow, z1, GripperLeft;
            g_MoveTo 11.3;
            Movej PickAndPlaceDoneAnalysisJars5, Normal, z1, GripperLeft;
        NumOfDoneAnalysisJar:=2;!change the number to place the second jar next time the proc is called
        ELSE
            Movej PickAndPlaceDoneAnalysisJars8, Slow, z1, GripperLeft;
            Movej PickAndPlaceDoneAnalysisJars9, Slow, z1, GripperLeft;
!           Movej PickAndPlaceDoneAnalysisJars10, Slow, z1, GripperLeft;
            g_MoveTo 11.3;
            Movej PickAndPlaceDoneAnalysisJars8, Normal, z1, GripperLeft;
            NumOfDoneAnalysisJar:=1;
        ENDIF
        Movej PickAndPlaceDoneAnalysisJars4, Normal, z1, GripperLeft;
        Movej PickAndPlaceDoneAnalysisJars3, Normal, z1, GripperLeft;
        Movej MainMidPoint, Normal, z1, GripperLeft;
        TubeMovedToDelivery := TRUE;
!    ENDFOR

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

PROC testingRunLeft()
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
        
        g_Init \maxSpd := 25, \holdForce := 10;
        !FindJarsBothArmsFunctioning;
        JarNumFilledByS1_2 := 0;
        ZeroingVariables;
        ZeroingVariablesForMOV2_3;
        AnalysisOver:=FALSE; !added 01-02-2023
        WaitUntil WaitingForClosetIsOpend_analysis=TRUE;
       OpenLock;
       closetisopened_analysis:= TRUE;
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
      



!##############################################################
!Now taking samples and emptying weird jars

WaitUntil AnalysisOver=TRUE; ! Analysis gonna take 24 hour to complete. For now it is fine, but for the whole proc gotta add check like in the right's hand code.

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

      ! LeftArmHome joints:-114 -31 71 -86 28 36 -92
      
      
      
      PROC  MOV2_33()
          VAR bool DoINeedToOpen := TRUE;
        VAR bool State := FALSE;
        VAR bool NotUsed;
        WaitUntil CoverOpened = TRUE;
        g_Stop;
        !ZeroingVariablesForMOV2_3;
        WaitUntil FunnelInPosition = TRUE;
        !Held_ToMainMidPoint;
        !NotUsed := TurnOnOffPump(State);
        !HoldJarInOrange;
        WaitTime 0.5;
        !EmptyJarInFunnel;
        WaitTime 12;
        State := FALSE;
!        WHILE reg1 <> 4 DO
!            TPErase;
!            TPReadFK reg1, "Filtration proc finished?", stEmpty, stEmpty, stEmpty, "Yes", "No";
!        ENDWHILE
!        reg1:=0;
        NotUsed := TurnOnOffPump(State);
        FilteringFinished := TRUE;
        Waituntil filterDis = TRUE;
!        BorderingFilterToPutInPlate;
!        PutFilterInPLate_FinalPush_;
        TweezersLeft;
        IF DoINeedToOpen = TRUE THEN
            OpenLock;
            Held_LeftHoldingJar := FALSE;
        ENDIF
        WaitTime 5;
        CapinetOpened := TRUE;
        
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
        
      ENDproc
ENDMODULE