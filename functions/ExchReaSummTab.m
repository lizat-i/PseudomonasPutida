function [T] = ExchReaSummTab(model)
%EXCHTAB Summary of the exchange Reactions, if second input is given
%true default Reactions with default Values are not dissplayed
    
L1 = findExcRxns(model);  
 
reactions = model.rxns(:);
lb        = model.lb(:)  ;
ub        = model.ub(:)  ;
 

SimulationRun =          reactions               ;
lowerBoundary            =  lb                   ;
upperBoundary            =  ub                   ; 
%Gluconate_SecR          =  0                    ;
%Keto_Gluconate_SecR     =  0                    ;
%GrowthRate              = solution.obj          ;
%PHA_prod_rate           =  PHA_prod_rate1       ;
%T = table(lowerBoundary,UptakeRate,Gluconate_SecR,Keto_Gluconate_SecR,GrowthRate,PHA_prod_rate,'RowNames',SimulationRun);
T = table(lowerBoundary,upperBoundary,'RowNames',SimulationRun);
 
end

