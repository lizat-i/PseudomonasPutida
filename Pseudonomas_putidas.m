%% Initialize 
clf
clear all
clc
addpath("lib/cobratoolbox","files/iJN1462/","figures/","Tutorials/","functions/")

initCobraToolbox(false) % false, as we don't want to update
%% read original Model

iJN1462    = readCbModel('files/iJN1462/iNogalesEtAl.xml');

%ExchReaSummTab(model,false)

% Modify Boundary Conditions

% choose Medium and adjust BC
   % medium 1 = glucose min Medium M9
   % medium 2 = In silico Luria Broth (LB) medium

medium = 1;

iJN1462     = setMediumBoundaries(iJN1462,medium);

% negative value means uptake, positive means secretion
[iJN1462_GLC_UR6_3,iJN1462_GLC_UR7_3,iJN1462_GLN_UR5_1,iJN1462_GLC_UR10_9,iJN1462_OCT_UR3_4]  =   deal(iJN1462);

iJN1462_GLC_UR6_3   = changeRxnBounds(iJN1462_GLC_UR6_3,'EX_glc__D_e',-6.3,'l')     ;
iJN1462_GLC_UR7_3   = changeRxnBounds(iJN1462_GLC_UR7_3,'EX_glc__D_e',-7.3,'l')     ;


iJN1462_GLN_UR5_1   = changeRxnBounds(iJN1462_GLN_UR5_1,'EX_glc__D_e',0,'l')        ;
iJN1462_GLN_UR5_1   = changeRxnBounds(iJN1462_GLN_UR5_1,'EX_glc__D_e',999999,'u')   ;
iJN1462_GLN_UR5_1   = changeRxnBounds(iJN1462_GLN_UR5_1,'EX_glcn_e',-5.1,'l')       ;

iJN1462_GLC_UR10_9  = changeRxnBounds(iJN1462_GLC_UR10_9,'EX_glc__D_e',-10.9,'l')   ;
iJN1462_GLC_UR10_9  = changeRxnBounds(iJN1462_GLC_UR10_9,'EX_glcn_e',2.8,'l')       ;
iJN1462_GLC_UR10_9  = changeRxnBounds(iJN1462_GLC_UR10_9,'EX_2dhglcn_e',2.6,'l')    ;

%iJN1462_OCT_UR3_4   = changeRxnBounds(iJN1462_OCT_UR3_4,'EX_glc__D_e',0,'l')        ;
%iJN1462_OCT_UR3_4   = changeRxnBounds(iJN1462_OCT_UR3_4,'EX_glc__D_e',99999,'u')    ;
iJN1462_OCT_UR3_4   = changeRxnBounds(iJN1462_OCT_UR3_4,'EX_octa_e',-3.4,'l')       ;
iJN1462_OCT_UR3_4   = changeRxnBounds(iJN1462_OCT_UR3_4,'EX_nh4_e',-3.1,'l')        ; %Nitrogen uptake constraint 
iJN1462_OCT_UR3_4   = changeRxnBounds(iJN1462_OCT_UR3_4,'EX_o2_e',-13.5,'l')        ; %Oxygen   uptake constraint 

% iJN1462_OCT_UR3_4   = changeObjective (iJN1462_OCT_UR3_4,iJN1462_OCT_UR3_4.rxns(329),1);
% iJN1462_OCT_UR3_4   = changeObjective (iJN1462_OCT_UR3_4,iJN1462_OCT_UR3_4.rxns(330),1);

%checkObjective(iJN1462_OCT_UR3_4)

% Solve Problem

S_UR5_1 = optimizeCbModel(iJN1462_GLN_UR5_1,'max')      ;
S_UR6_3 = optimizeCbModel(iJN1462_GLC_UR6_3,'max')      ;
S_UR7_3 = optimizeCbModel(iJN1462_GLC_UR7_3,'max')      ; 
S_UR10_9= optimizeCbModel(iJN1462_GLC_UR10_9,'max')     ;
S_UR3_4 = optimizeCbModel(iJN1462_OCT_UR3_4,'max')      ;

% make Printable  Table with Solutions 

[T_row1] = createRelevantOutput(iJN1462_GLN_UR5_1,S_UR5_1,"Gluconate")	;
[T_row2] = createRelevantOutput(iJN1462_GLC_UR6_3,S_UR6_3,"Glucose")	;
[T_row3] = createRelevantOutput(iJN1462_GLC_UR7_3,S_UR7_3,"Glucose")	;   
[T_row4] = createRelevantOutput(iJN1462_GLC_UR10_9,S_UR10_9,"Glucose")	;
[T_row5] = createRelevantOutput(iJN1462_OCT_UR3_4,S_UR3_4,"Octanoate")	;

%[T_testt1] = createRelevantOutput()    

T = [T_row1;T_row2;T_row3;T_row4;T_row5]                                                    ;

disp(T)

%printFluxVector(iJN1462_OCT_UR3_4,S_UR3_4.v)

%changeCOBRAConstraints()

%% Code Snippets for Later Use

% initialize Cobratoolbox:
%       initCobraToolbox() % false, as we don't want to update
% change Solver:
%       solverName = 'ibm_cplex';
%       solverType = 'LP'; 
%       changeCobraSolver(solverName, solverType);
 
% find ReactionIndex and get reactionEQ lb ub and rxns :
%       [GlucoseURIndex,~] = getIDPositions(iJN1462,'EX_glcn_e','rxns')
%                               printRxnFormula(iJN1462, 'EX_glcn_e')
%       GlucoseUR          = iJN1462.rxns(GlucoseURIndex)   
%       GlucoseUR          = iJN1462.lb(GlucoseURIndex)                     
%       GlucoseUR          = iJN1462.ub(GlucoseURIndex)   

%  find ExtchangeReaction and get reactionEQ lb ub and rxns :
% iJN1462_GLC_UR10_9.rxns(findExcRxns(iJN1462_GLC_UR10_9,0))
 
% EX_glc__D_e	        -6.300	      1000.000 ... is glucose uptake

%objFunctionrxns = checkObjective(iJN1462)                ;
%getIDPositions(iJN1462,'BiomassKT2440_WT3','rxns')
% printRxnFormula(iJN1462,'BiomassKT2440_WT3')
% Objective Function Correlates to the Biomass Composition found through
% analysis
    

%T_EXch = ExchReaSummTab(iJN1462,true)
%disp(T_EXch)
 

%printRxnFormula(iJN1462,PHAC6Search.rxns.id)

% find ExchangeReaction 
% iJN1462.rxnNames(find(findExcRxns(iJN1462)))

% [GlucoseURIndex,~] = getIDPositions(iJN1462_GLC_UR10_9,'EX_glcn__e','rxns') ;
%  GlucoseUR     = model.lb(GlucoseURIndex)                       
 

% S_UR5_1 = solveCobraCPLEX(iJN1462_GLN_UR5_1)    ;
 