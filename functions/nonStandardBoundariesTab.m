function [T] = nonStandardBoundariesTab(model)
%EXCHTAB Summary of the exchange Reactions, if second input is given
%true default Reactions with default Values are not dissplayed
    
[L1,L2]         = findExcRxns(model);
L_exchange      =   L1 & L2 ;
L_up            = (abs(model.ub) ~= 999999) & (abs(model.ub) ~= 1000)                           ; 
L_lb            = (abs(model.lb) ~= 0) & (abs(model.lb) ~= 1000) & (abs(model.lb) ~= 999999)...
                    & (abs(model.lb) ~= 999999)    ;

L3 = L_up | L_lb ; 

reactions = model.rxns(L3);
lb        = model.lb(L3)  ;
ub        = model.ub(L3)  ;
 

SimulationRun =          reactions               ;
lowerBoundary            =  lb                   ;
upperBoundary            =  ub                   ; 
 
T = table(lowerBoundary,upperBoundary,'RowNames',SimulationRun);
disp(T)
end

