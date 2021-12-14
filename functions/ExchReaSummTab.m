function [T] = ExchReaSummTab(model,varargin)
%EXCHTAB Summary of the exchange Reactions, if second input is given
%true default Reactions with default Values are not dissplayed
    
    L1 = findExcRxns(model,0);
    
if varargin{1}
    L1_1 = (model.lb(L1) == 0  &  model.ub(L1) == 999999)    ;
     
 
    L1 =  L1_1;
end

    
    
 
reactions = model.rxns(L1);
lb        = model.lb(L1)  ;
ub        = model.ub(L1)  ;
 

SimulationRun =          reactions               ;
lowerBoundary            =  lb                    ;
upperBoundary            =  ub                   ; 
%Gluconate_SecR          =  0                    ;
%Keto_Gluconate_SecR     =  0                    ;
%GrowthRate              = solution.obj          ;
%PHA_prod_rate           =  PHA_prod_rate1       ;
%T = table(lowerBoundary,UptakeRate,Gluconate_SecR,Keto_Gluconate_SecR,GrowthRate,PHA_prod_rate,'RowNames',SimulationRun);
T = table(lowerBoundary,upperBoundary,'RowNames',SimulationRun);
%disp(T)

end

