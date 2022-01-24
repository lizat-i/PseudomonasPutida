%% Get PHA subsystem Reactionnames

 %% check exchange reaction wih solutions
 

%[minFlux,maxFluc]=fluxVariability(model, optPercentage, osenseStr, rxnNameList, printLevel, allowLoops, method, cpxControl, advind)
%[minFlux,maxFlux,Vmin,Vmax]=fluxVariability(iJN1462_OCT_URexp, 100, 'max', {'PHAP2C60';'PHAP2C80'}, 1, false, [], [], []);

 

%% check PHA Metabolism reactions wih solutions
%surfNetPHAR(iJN1462_OCT_UR3_4,S_UR3_4)

%% geometric FBA a uniqe optimalFBA

%fluxVecotr = geometricFBA(iJN1462_initial)
 
%%


%fluxEnrichmentResult = FEA(model, rxnSet, group)

%% Try FVA
[selExc, selUpt]    =   findExcRxns(iJN1462_initial)        ;
uptakes             =    model.rxns(selUpt)                 ;

% create submodel with uptake reactions

subuptakeModel      =   extractSubNetwork(model, uptakes)   ;



%% Check Values of ExhangeReactions and use Boundaries
surfNetExchR(iJN1462_OCT_UR3_4,S_UR3_4)
surfNetPHAR(iJN1462_OCT_UR3_4,S_UR3_4)

%surfNet(model, object, metNameFlag, flux, nonzeroFluxFlag, showMets, printFields, charPerLine, similarity)
 
%% Code Snippets for Later Use
% Print C60 : C80 aliphatic phynylic acetylthio PHA's
%T = createMetabolitOutput(iJN1462_OCT_UR3_4,S_UR3_4);
%disp(T)
%% IMPORTANT BEFEHLE!!%%

%   surfNet(model, 'pyr[c]', [], solution.x)
%   fluxMatrix = [s.x, sFru.x];  % put two flux vectors in a matrix
%   reactions with different fluxes
%   rxnDiff = abs(fluxMatrix(:, 1) - fluxMatrix(:, 2)) > 1e-6;  
%   surfNet(iJO1366, iJO1366.rxns(rxnDiff), [], fluxMatrix, [], 0)
 
%  printUptakeBound(iJN1462_OCT_UR3_4);
%  printUptakeBound(iJN1462);
%  printUptakeBound(iJN1462_OCT_UR3_4);
%  printConstraints(model)  all Reactions
%  printUptakeBound(model)  aufnahmeRaten der anzeigen
%  surfNet(iJN1462_initial) nice Zusammenfassung !
%  printFluxVector(iJN1462_OCT_UR3_4,S_UR3_4.v)


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

%changeObjective(iJN1462,'BiomassKT2440_Core2');
 
