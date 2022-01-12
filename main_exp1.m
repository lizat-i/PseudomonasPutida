%% Initialize 
close all
clear all
format
addpath("/home/ivan/dev/Project/cobratoolbox","files/","files/iJN1462/","figures/","tutorials/","functions/","tutorials/websiteTUT/")

%% Execute this part only ones when starting work
initCobraToolbox(false); % false, as we don't want to update
%change Solver:
     changeCobraSolver ('ibm_cplex', 'LP');
     changeCobraSolver ('ibm_cplex', 'MILP');
     changeCobraSolver ('ibm_cplex', 'QP');
     changeCobraSolver ('ibm_cplex', 'MIQP');
 
      
%% read original Model the iJN1463 
iJN1462_initial    = readCbModel('files/iJN1463/iJN1463.xml')  ;

%% Set Medium based lower and upper BoundaryConditions

% choose Medium and adjust BC
   % medium 1 = glucose min Medium M9
   % medium 2 = In silico Luria Broth (LB) medium
   % medium 3 = reseting all reactions to +/- 1000
   
    medium = 1;
 
    iJN1462     =   iJN1462_initial                                 ;
    iJN1462     =   setMediumBoundaries(iJN1462_initial,medium)   ; 
 
%% Create Experiment specific BoundaryConditions
[Oct_BC,Gluc_const,Gluc_BC,Oct_const,iJN1462_OCT_UR3_4,iJN1462_Glu_URexp]  =   deal(iJN1462);
% BaseCase Octanoat Glucose
Gluc_BC     = changeRxnBounds(Gluc_BC,'EX_glc__D_e',-7.3,'l')   ;
Gluc_BC     = changeRxnBounds(Gluc_BC,'EX_glc__D_e',-7.3,'u')   ;

Oct_BC      = changeRxnBounds(Oct_BC,'EX_glc__D_e',0,'l')       ;
Oct_BC      = changeRxnBounds(Oct_BC,'EX_glc__D_e',0,'u')       ;
Oct_BC      = changeRxnBounds(Oct_BC,'EX_octa_e',-3.4,'l')      ;
Oct_BC      = changeRxnBounds(Oct_BC,'EX_octa_e',-3.4,'u')      ;
Oct_BC      = setDemandBoundaries(Oct_BC,3)                 	; 

%% constr
Gluc_const   = changeRxnBounds(Gluc_const,'EX_glc__D_e',-7.3,'l')       ;
Gluc_const   = changeRxnBounds(Gluc_const,'EX_glc__D_e',-7.3,'u')       ;
Gluc_const   = changeRxnBounds(Gluc_const,'EX_nh4_e',-0.1,'l')          ;
Gluc_const   = changeRxnBounds(Gluc_const,'EX_o2_e',-6.1,'l')             ;
Gluc_const   = changeRxnBounds(Gluc_const,'EX_etoh_e',0,'l')            ;
Gluc_const   = changeRxnBounds(Gluc_const,'EX_etoh_e',0,'u')            ;
Gluc_const    = setDemandBoundaries(Gluc_const,3) ;

Oct_const  = changeRxnBounds(Oct_const,'EX_glc__D_e',0,'l')       ;
Oct_const  = changeRxnBounds(Oct_const,'EX_glc__D_e',0,'u')       ;
Oct_const  = changeRxnBounds(Oct_const,'EX_octa_e',-3.4,'l')      ;
Oct_const  = changeRxnBounds(Oct_const,'EX_octa_e',-3.4,'u')      ;
Oct_const  = changeRxnBounds(Oct_const,'EX_nh4_e',-3.1,'l')       ;  
Oct_const  = changeRxnBounds(Oct_const,'EX_o2_e',-13.5,'l')       ;  
Oct_const  = setDemandBoundaries(Oct_const,3)                       ; 

%C Sources = glucanate

iJN1462_OCT_UR3_4   = changeRxnBounds(iJN1462_OCT_UR3_4,'EX_glc__D_e',0,'l')        ;
iJN1462_OCT_UR3_4   = changeRxnBounds(iJN1462_OCT_UR3_4,'EX_glc__D_e',0,'u')     ;
iJN1462_OCT_UR3_4   = changeRxnBounds(iJN1462_OCT_UR3_4,'EX_octa_e',-3.4,'l')       ;
iJN1462_OCT_UR3_4   = changeRxnBounds(iJN1462_OCT_UR3_4,'EX_octa_e',-3.4,'u')       ;
iJN1462_OCT_UR3_4   = changeRxnBounds(iJN1462_OCT_UR3_4,'EX_nh4_e',-3.1,'l')        ; %Nitrogen uptake constraint 
iJN1462_OCT_UR3_4   = changeRxnBounds(iJN1462_OCT_UR3_4,'EX_o2_e',-13.5,'l')        ; %Oxygen   uptake constraint 


iJN1462_Glu_URexp   = changeRxnBounds(iJN1462_Glu_URexp,'EX_glc__D_e',0,'l')       ;
iJN1462_Glu_URexp  = changeRxnBounds(iJN1462_Glu_URexp,'EX_glc__D_e',0,'u')         ;
iJN1462_Glu_URexp   = changeRxnBounds(iJN1462_Glu_URexp,'EX_octa_e',-3.4,'l')       ;
iJN1462_Glu_URexp   = changeRxnBounds(iJN1462_Glu_URexp,'EX_octa_e', -3.4,'u')       ;
iJN1462_Glu_URexp   = changeRxnBounds(iJN1462_Glu_URexp,'EX_nh4_e',-3.1,'l')        ; %Nitrogen uptake constraint 
iJN1462_Glu_URexp   = changeRxnBounds(iJN1462_Glu_URexp,'EX_o2_e',-13.5,'l')        ; %Oxygen   uptake constraint

% Demand reaction constraint
iJN1462_Glu_URexp = setDemandBoundaries(iJN1462_Glu_URexp,3)                        ; %setDemandOutput
%% Solve Problem

S_Gluc_BC           = optimizeCbModel(Gluc_BC)              ;
S_Oct_BC            = optimizeCbModel(Oct_BC)               ;
S_Gluc_const        = optimizeCbModel(Gluc_const)           ; 
S_Oct_const         = optimizeCbModel(Oct_const)            ;
S_UR3_4             = optimizeCbModel(iJN1462_OCT_UR3_4)    ;
S_URexp             = optimizeCbModel(iJN1462_Glu_URexp)    ;
 
%% make costum printable table with Solutions 

[T_row1] = createRelevantOutput(Gluc_BC,S_Gluc_BC,"Glucose")	;
[T_row2] = createRelevantOutput(Gluc_const,S_Gluc_const,"Glucose")	;   
[T_row3] = createRelevantOutput(Oct_BC,S_Oct_BC,"Octanoate")	;
[T_row4] = createRelevantOutput(Oct_const,S_Oct_const,"Octanoate")	;

[T_row5] = createRelevantOutput(iJN1462_OCT_UR3_4,S_UR3_4,"Octanoate")	;
[T_rowexp] = createRelevantOutput(iJN1462_Glu_URexp,S_URexp,"Octanoate");
 
T = [T_row1;T_row2;T_row3;T_row4;T_row5 ;T_rowexp];

disp(T)

%% Difference between two Solutions

 
surfNet(Gluc_const,'RECOAH13',true, S_Gluc_const.x, false,true,[],[],[])


%surfNetExchRComp(Gluc_BC, S_Gluc_BC, S_Gluc_const) 