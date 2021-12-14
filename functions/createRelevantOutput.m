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

 
[pos_GLUNC_,~]  =   getIDPositions(model,'EX_glcn_e','rxns')    ;
[pos_K2GLCN,~]  =   getIDPositions(model,'EX_2dhglcn_e','rxns') ;
[pos_o2,~]      =   getIDPositions(model,'EX_o2_e','rxns')      ;

%PHAC6Search = searchModel(model,'PHADPC80','printLevel',0);
[pos_PHAC6,~] = getIDPositions(model,'PHADPC80','rxns');
%PHAC8Search = searchModel(model,'PHADPC60','printLevel',0);
[pos_PHAC8,~] = getIDPositions(model,'PHADPC60','rxns');

dummy = nan ; 

GLUNC       = solution.v(pos_GLUNC_)	; 
K2GLCN      = solution.v(pos_K2GLCN)	;
OUR_V         = solution.v(pos_o2)        ;  
PHA_prod_rate1 = solution.v(pos_PHAC6)+ solution.v(pos_PHAC8);



SimulationRun =                        {s}      ;
CarbonSource            =  carbonSource         ;
UptakeRate              =  UR                   ; 
Gluconate_SecR          =  GLUNC                ;
Keto_Gluconate_SecR     =  K2GLCN               ;
GrowthRate              = solution.f            ;
PHA_prod_rate           =  PHA_prod_rate1       ;
OUR                     =    OUR_V              ;
T = table(CarbonSource,UptakeRate,Gluconate_SecR,Keto_Gluconate_SecR,GrowthRate,PHA_prod_rate,OUR,'RowNames',SimulationRun);


%disp(T)
end

