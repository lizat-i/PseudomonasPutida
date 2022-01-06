%% Initialize 
close all
clear all
format longG

addpath("/home/ivan/dev/Project/cobratoolbox","files/","files/iJN1462/","figures/","tutorials/","functions/","tutorials/websiteTUT/")

%% Execute this part only ones when starting work

initCobraToolbox(false); % false, as we don't want to update

%change Solver:
      solverName = 'ibm_cplex';
      solverType = 'LP'; 
      changeCobraSolver(solverName, solverType);
      changeCobraSolver ('ibm_cplex', 'QP')
      
%% read original Model

iJN1462_initial    = readCbModel('files/iJN1462/iNogalesEtAl.xml')  ;
%iJN1463_initial    = readCbModel('files/iJN1463.xml')              ;
%iJN1462_initial    = readCbModel('files/iJN1463/iJN1463.xml')  ;
%% Set Medium based lower and upper BoundaryConditions

% choose Medium and adjust BC
   % medium 1 = glucose min Medium M9
   % medium 2 = In silico Luria Broth (LB) medium
   % medium 3 = reseting all reactions to +/- 1000
   
medium = 1;

% copys of the initial model (no medium boundaries set, allways available)
iJN1462       = iJN1462_initial;

%[iJN1462, ~ ] = ititializePHA_metabolism(iJN1462);
%nonStandardBoundariesTab(iJN1462); 

%iJN1463       = iJN1463_initial;
%nonStandardBoundariesTab(iJN1463);


% set medium boundaries 
iJN1462     = setMediumBoundaries(iJN1462_initial,medium)   ; 
%iJN1463     = setMediumBoundaries(iJN1463_initial,medium)   ;
 
%% Create Experiment specific BoundaryConditions
[iJN1462_GLC_UR6_3,iJN1462_GLC_UR7_3,iJN1462_GLN_UR5_1,iJN1462_GLC_UR10_9,iJN1462_OCT_UR3_4,iJN1462_OCT_URexp]  =   deal(iJN1462);

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
iJN1462_OCT_UR3_4   = changeRxnBounds(iJN1462_OCT_UR3_4,'EX_glc__D_e',1000,'u')     ;
iJN1462_OCT_UR3_4   = changeRxnBounds(iJN1462_OCT_UR3_4,'EX_octa_e',-3.4,'l')       ;
iJN1462_OCT_UR3_4   = changeRxnBounds(iJN1462_OCT_UR3_4,'EX_nh4_e',-3.1,'l')        ; %Nitrogen uptake constraint 
iJN1462_OCT_UR3_4   = changeRxnBounds(iJN1462_OCT_UR3_4,'EX_o2_e',-13.5,'l')        ; %Oxygen   uptake constraint 


%%
[pos_skPHA,~]      =   getIDPositions(iJN1462_OCT_URexp,'sink_PHAg','rxns')             ;
[pos_biom,~]      =   getIDPositions(iJN1462_OCT_URexp,'BiomassKT2440_WT3','rxns')          ;
 
iJN1462_OCT_URexp.c(pos_skPHA) = 1      ;
iJN1462_OCT_URexp.c(pos_biom) =  0      ;

iJN1462_OCT_URexp.rxns(iJN1462_OCT_URexp.c ~= 0)


iJN1462_OCT_URexp   = changeRxnBounds(iJN1462_OCT_URexp,'EX_glc__D_e',-0,'l')        ;
iJN1462_OCT_URexp  = changeRxnBounds(iJN1462_OCT_URexp,'EX_glc__D_e',0,'u')      ;
iJN1462_OCT_URexp   = changeRxnBounds(iJN1462_OCT_URexp,'EX_octa_e',-3.4,'l')       ;
iJN1462_OCT_URexp   = changeRxnBounds(iJN1462_OCT_URexp,'EX_nh4_e',-3.1,'l')        ; %Nitrogen uptake constraint 
iJN1462_OCT_URexp   = changeRxnBounds(iJN1462_OCT_URexp,'EX_o2_e',-13.5,'l')        ; %Oxygen   uptake constraint
 
%% Solve Problem

S_UR5_1 = optimizeCbModel(iJN1462_GLN_UR5_1)      ;
S_UR6_3 = optimizeCbModel(iJN1462_GLC_UR6_3)      ;
S_UR7_3 = optimizeCbModel(iJN1462_GLC_UR7_3)      ; 
S_UR10_9= optimizeCbModel(iJN1462_GLC_UR10_9)     ;
S_UR3_4 = optimizeCbModel(iJN1462_OCT_UR3_4)      ;
S_URexp= optimizeCbModel(iJN1462_OCT_URexp)      ;

%% make costum printable table with Solutions 

[T_row1] = createRelevantOutput(iJN1462_GLN_UR5_1,S_UR5_1,"Gluconate")	;
[T_row2] = createRelevantOutput(iJN1462_GLC_UR6_3,S_UR6_3,"Glucose")	;
[T_row3] = createRelevantOutput(iJN1462_GLC_UR7_3,S_UR7_3,"Glucose")	;   
[T_row4] = createRelevantOutput(iJN1462_GLC_UR10_9,S_UR10_9,"Glucose")	;
[T_row5] = createRelevantOutput(iJN1462_OCT_UR3_4,S_UR3_4,"Octanoate")	;
[T_rowexp] = createRelevantOutput(iJN1462_OCT_URexp,S_URexp,"Octanoate")	;
 
T = [T_row1;T_row2;T_row3;T_row4;T_row5 ;T_rowexp];

disp(T)
%% check exchange reaction wih solutions
 

%% check PHA Metabolism reactions wih solutions
surfNetPHAR(iJN1462_OCT_UR3_4,S_UR3_4)

%% experiment


%%


%fluxEnrichmentResult = FEA(model, rxnSet, group)
