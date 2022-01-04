function [T] = createRelevantOutput(model,solution,carbonSource)
s = inputname(1); 
switch lower(carbonSource)
    case "glucose"
        [ URIndex,~] = getIDPositions(model,'EX_glc__D_e','rxns') ;
        UR     = model.lb(URIndex);                        ;
        
    case "gluconate"
        [ URIndex,~] = getIDPositions(model,'EX_glcn_e','rxns') ;
        UR     = model.lb(URIndex);                       
    case "octanoate"
        [ URIndex,~] = getIDPositions(model,'EX_octa_e','rxns') ;
        UR     = model.lb(URIndex) ;                      
        
end

[pos_phosphate,~]  =   getIDPositions(model,'EX_pi_e','rxns')         ;
[pos_ammonium,~]  =   getIDPositions(model,'EX_nh4_e','rxns')         ;
[pos_Glucose,~]  =   getIDPositions(model,'EX_glc__D_e','rxns')         ;
[pos_octanoate,~]=   getIDPositions(model,'EX_octa_e','rxns')           ;
[pos_GLUNC_,~]  =   getIDPositions(model,'EX_glcn_e','rxns')            ;
[pos_K2GLCN,~]  =   getIDPositions(model,'EX_2dhglcn_e','rxns')         ;
[pos_o2,~]      =   getIDPositions(model,'EX_o2_e','rxns')              ;

%producing REactions 
[pos_PHAC1,~] = getIDPositions(model,'PHADPC60','rxns')     ;
[pos_PHAC2,~] = getIDPositions(model,'PHADPC80','rxns')     ;
[pos_PHAC3,~] = getIDPositions(model,'PHADPCP60','rxns')    ;
[pos_PHAC4,~] = getIDPositions(model,'PHADPCP80','rxns')    ;
[pos_PHAC5,~] = getIDPositions(model,'PHADPCT60','rxns')    ;
%consuming REactions 
[pos_PHAC6,~] = getIDPositions(model,'PHAP2C60','rxns')     ;
[pos_PHAC7,~] = getIDPositions(model,'PHAP2C80','rxns')     ;
[pos_PHAC8,~] = getIDPositions(model,'PHAPCP60','rxns')     ;
[pos_PHAC9,~] = getIDPositions(model,'PHAPCP80','rxns')     ;
[pos_PHAC10,~]= getIDPositions(model,'PHAPCT60','rxns')     ;
 
PHA_prod_rate1 = abs(solution.v(pos_PHAC1))+abs(solution.v(pos_PHAC2))+abs(solution.v(pos_PHAC3))+abs(solution.v(pos_PHAC4))+abs(solution.v(pos_PHAC5));
PHA_cons_rate1 = abs(solution.v(pos_PHAC6))+abs(solution.v(pos_PHAC7))+abs(solution.v(pos_PHAC8))+abs(solution.v(pos_PHAC9))+abs(solution.v(pos_PHAC10));

PO4_1       =   solution.v(pos_phosphate)	; 
NH4_1       =   solution.v(pos_ammonium)	; 
GLUC        =   solution.v(pos_Glucose)	; 
OCTA        =   solution.v(pos_octanoate)	; 
GLUNC       =   solution.v(pos_GLUNC_)	; 
K2GLCN      =   solution.v(pos_K2GLCN)	;
OUR_V       =   solution.v(pos_o2)      ;

%PHA_prod_rate1 = solution.v(pos_PHAC6)+ solution.v(pos_PHAC8);



SimulationRun =                        {s}      ;
CarbonSource            =  carbonSource         ;

Glucose_R               =  GLUC                ;
Octanoate_R             =  OCTA                ;
Gluconate_R             =  GLUNC                ;
Keto_Gluconate_R        =  K2GLCN               ;
GrowthRate              = solution.f            ;
PHA                     =  PHA_prod_rate1  + PHA_cons_rate1     ;
NH4                     =   NH4_1                ;
PO4                     =   PO4_1               ;
OUR                     =    OUR_V              ;

T = table(CarbonSource,Glucose_R,Octanoate_R,Gluconate_R,Keto_Gluconate_R,GrowthRate,PHA,NH4,PO4,OUR,'RowNames',SimulationRun);


%disp(T)
end

