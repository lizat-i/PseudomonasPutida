%% Task1 
%   Recreate the Paper of Nogales et al

%% Create Experiment specific BoundaryConditions
    [iJN1462_GLC_UR6_3,iJN1462_GLC_UR7_3,iJN1462_GLN_UR5_1,iJN1462_GLC_UR10_9,iJN1462_OCT_UR3_4,iJN1462_Glu_URexp]  =   deal(iJN1463);

%C Sources = glucose
    iJN1462_GLC_UR6_3   = changeRxnBounds(iJN1462_GLC_UR6_3,'EX_glc__D_e',-6.3,'l')     ;
    iJN1462_GLC_UR7_3   = changeRxnBounds(iJN1462_GLC_UR7_3,'EX_glc__D_e',-7.3,'l')     ;

% C Sources = glucose ,  
% glucanate & 2-ketoglucanate secretion secretion rates constrained
    iJN1462_GLC_UR10_9  = changeRxnBounds(iJN1462_GLC_UR10_9,'EX_glc__D_e',-10.9,'l')   ;
    iJN1462_GLC_UR10_9  = changeRxnBounds(iJN1462_GLC_UR10_9,'EX_glcn_e',2.8,'l')       ;
    iJN1462_GLC_UR10_9  = changeRxnBounds(iJN1462_GLC_UR10_9,'EX_2dhglcn_e',2.6,'l')    ;

%C Sources = glucanate
    iJN1462_GLN_UR5_1   = changeRxnBounds(iJN1462_GLN_UR5_1,'EX_glc__D_e',0,'l')        ;
    iJN1462_GLN_UR5_1   = changeRxnBounds(iJN1462_GLN_UR5_1,'EX_glc__D_e',1000,'u')   ;
    iJN1462_GLN_UR5_1   = changeRxnBounds(iJN1462_GLN_UR5_1,'EX_glcn_e',-5.1,'l')       ;

    iJN1462_OCT_UR3_4   = changeRxnBounds(iJN1462_OCT_UR3_4,'EX_glc__D_e',0,'l')        ;
    iJN1462_OCT_UR3_4   = changeRxnBounds(iJN1462_OCT_UR3_4,'EX_glc__D_e',0,'u')        ;
    iJN1462_OCT_UR3_4   = changeRxnBounds(iJN1462_OCT_UR3_4,'EX_octa_e',-3.4,'l')       ;
    iJN1462_OCT_UR3_4   = changeRxnBounds(iJN1462_OCT_UR3_4,'EX_octa_e',-3.4,'u')       ;
    iJN1462_OCT_UR3_4   = changeRxnBounds(iJN1462_OCT_UR3_4,'EX_nh4_e',-3.1,'l')        ; %Nitrogen uptake constraint 
    iJN1462_OCT_UR3_4   = changeRxnBounds(iJN1462_OCT_UR3_4,'EX_o2_e',-13.5,'l')        ; %Oxygen   uptake constraint 

%Set Demand Options

    iJN1462_OCT_UR3_4   = setDemandBoundaries(iJN1462_OCT_UR3_4,1)                      ;
 
%% Solve Problem

    S_UR5_1 = optimizeCbModel(iJN1462_GLN_UR5_1)      ;
    S_UR6_3 = optimizeCbModel(iJN1462_GLC_UR6_3)      ;
    S_UR7_3 = optimizeCbModel(iJN1462_GLC_UR7_3)      ; 
    S_UR10_9= optimizeCbModel(iJN1462_GLC_UR10_9)     ;
    S_UR3_4 = optimizeCbModel(iJN1462_OCT_UR3_4)      ;
 
 
%% make costum printable table with Solutions 

    [T_row1] = createRelevantOutput(iJN1462_GLN_UR5_1,S_UR5_1,"Gluconate")	;
    [T_row2] = createRelevantOutput(iJN1462_GLC_UR6_3,S_UR6_3,"Glucose")	;
    [T_row3] = createRelevantOutput(iJN1462_GLC_UR7_3,S_UR7_3,"Glucose")	;   
    [T_row4] = createRelevantOutput(iJN1462_GLC_UR10_9,S_UR10_9,"Glucose")	;
    [T_row5] = createRelevantOutput(iJN1462_OCT_UR3_4,S_UR3_4,"Octanoate")
 
    T = [T_row1;T_row2;T_row3;T_row4;T_row5 ];

    disp(T)
    
 %% FVA of the published result

 
 [minFlux, maxFlux] = fluxVariability(iJN1462_OCT_UR3_4, [], [], {'PHAP2C60','PHAP2C80','PHAP2C120'})

 [minFlux, maxFlux] = fluxVariability(iJN1462_GLC_UR7_3, [], [], {'PHAP2C60','PHAP2C80','PHAP2C120'})
  
iJN1462_GLC_UR7_3   = changeRxnBounds(iJN1462_GLC_UR7_3,'EX_nh4_e',-3.1,'l')        ; %Nitrogen uptake constraint 
iJN1462_GLC_UR7_3   = changeRxnBounds(iJN1462_GLC_UR7_3,'EX_nh4_e',-3.1,'u')        ; %Nitrogen uptake constraint 
 [minFlux, maxFlux] = fluxVariability(iJN1462_GLC_UR7_3, [], [], {'PHAP2C60','PHAP2C80','PHAP2C120'})
 