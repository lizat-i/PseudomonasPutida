function [T] = createRelevantOutput(model,solution,carbonSource)
s = inputname(1); 
%%
switch lower(carbonSource)
    case "glucose"
        [ URIndex,~] = getIDPositions(model,'EX_glc__D_e','rxns') ;
        UR     = model.lb(URIndex);                                 
        
    case "gluconate"
        [ URIndex,~] = getIDPositions(model,'EX_glcn_e','rxns') ;
        UR     = model.lb(URIndex);                       
    case "octanoate"
        [ URIndex,~] = getIDPositions(model,'EX_octa_e','rxns') ;
        UR     = model.lb(URIndex) ;                      
        
end
%%
[pos_phosphate,~]  =   getIDPositions(model,'EX_pi_e','rxns')         ;
[pos_ammonium,~]  =   getIDPositions(model,'EX_nh4_e','rxns')         ;
[pos_Glucose,~]  =   getIDPositions(model,'EX_glc__D_e','rxns')         ;
[pos_octanoate,~]=   getIDPositions(model,'EX_octa_e','rxns')           ;
[pos_GLUNC_,~]  =   getIDPositions(model,'EX_glcn_e','rxns')            ;
[pos_K2GLCN,~]  =   getIDPositions(model,'EX_2dhglcn_e','rxns')         ;
[pos_o2,~]      =   getIDPositions(model,'EX_o2_e','rxns')              ;
[pos_co2,~]      =   getIDPositions(model,'EX_co2_e','rxns')             ;
[pos_skPHA,~]      =   getIDPositions(model,'SK_PHAg_c','rxns')             ;

%producing REactions 
%aliphatic PHA's
[pos_PHAC1,~] = getIDPositions(model,'PHADPC60','rxns')     ;
[pos_PHAC2,~] = getIDPositions(model,'PHADPC80','rxns')     ;
[pos_PHAC3,~] = getIDPositions(model,'DM_C60aPHA_c','rxns')    ;
[pos_PHAC4,~] = getIDPositions(model,'DM_C80aPHA_c','rxns')    ;%%here comes 
[pos_PHAC5,~] = getIDPositions(model,'PHAP2C60','rxns')    ;
[pos_PHAC6,~] = getIDPositions(model,'PHAP2C80','rxns')    ; %% here
%cyclic PHA's
[pos_PHAC7,~] = getIDPositions(model,'PHAP2C100','rxns')     ;
[pos_PHAC8,~] = getIDPositions(model,'PHAP2C120','rxns')     ;
 %acetyl thio PHA's
[pos_PHAC9,~] = getIDPositions(model,'PHAPCT60','rxns')    ;

%overall_PHA_rates = abs(solution.v(pos_PHAC1))+abs(solution.v(pos_PHAC2))+abs(solution.v(pos_PHAC3))+abs(solution.v(pos_PHAC4))+abs(solution.v(pos_PHAC5)) + ...
                 abs(solution.v(pos_PHAC6))+abs(solution.v(pos_PHAC7))+abs(solution.v(pos_PHAC8))+abs(solution.v(pos_PHAC9)) ;
             
PHA_aliphatic_8_6 =  abs(solution.v(pos_PHAC5))+abs(solution.v(pos_PHAC6))+abs(solution.v(pos_PHAC7))+abs(solution.v(pos_PHAC8));
%sinkPHA         = abs(solution.v(pos_PHAC5));
%% hydroxy-carbonsaeure coA intermediat

[pos_R_H81,~] = getIDPositions(model,'ACSPHAC80','rxns')     ;
[pos_R_H82,~] = getIDPositions(model,'PHADPC80','rxns')     ;
[pos_R_H83,~] = getIDPositions(model,'RHA80tpp','rxns')    ;
[pos_R_H84,~]= getIDPositions(model,'RHACOAE80','rxns')     ;

[pos_PHA10,~]= getIDPositions(model,'PHAP2C100','rxns')     ;


R_hocta_rate_1 = abs(solution.v(pos_R_H81))+abs(solution.v(pos_PHAC2))+abs(solution.v(pos_R_H82))+abs(solution.v(pos_R_H83))+abs(solution.v(pos_R_H84));

 
 
sinkPHA     =   solution.v(pos_skPHA)	; 
CO2_1       =   solution.v(pos_co2)	; 
PO4_1       =   solution.v(pos_phosphate)	; 
NH4_1       =   solution.v(pos_ammonium)	; 
GLUC        =   solution.v(pos_Glucose)	; 
OCTA        =   solution.v(pos_octanoate)	; 
GLUNC       =   solution.v(pos_GLUNC_)	; 
K2GLCN      =   solution.v(pos_K2GLCN)	;
OUR_V       =   solution.v(pos_o2)      ;
pHA10_       =   solution.v(pos_PHA10)      ;

%PHA_prod_rate1 = solution.v(pos_PHAC6)+ solution.v(pos_PHAC8);



SimulationRun =                        {s}      ;
CarbonSource            =  carbonSource         ;

Glucose_R               =  GLUC                ;
Octanoate_R             =  OCTA                ;
Gluconate_R             =  GLUNC                ;
Keto_Gluconate_R        =  K2GLCN               ;
CO2_Secr                =     CO2_1             ;
GrowthRate              = solution.f            ;
PHA                     =  PHA_aliphatic_8_6       ;
SK_OHA                  =   sinkPHA             ;
NH4                     =   NH4_1                ;
PO4                     =   PO4_1               ;
OUR                     =    OUR_V              ;
R_hocta                 =   R_hocta_rate_1        ;
pHA10                   =   pHA10_      ;                  
T = table(CarbonSource,Glucose_R,Octanoate_R,GrowthRate,PHA,SK_OHA,NH4,PO4,OUR,pHA10,CO2_Secr,'RowNames',SimulationRun);
end

