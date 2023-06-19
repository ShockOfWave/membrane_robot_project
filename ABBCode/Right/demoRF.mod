MODULE demoRF
      PROC demonProg()
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
        ZeroingVariables;
        ZeroingVariablesOfMov2_1;
        PickThenPlaceJar;
        JarInPlace := TRUE;
    ENDPROC
    
ENDMODULE