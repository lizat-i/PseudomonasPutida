function [model,a] = ititializePHA_metabolism(model)
a = readtable('files/iJN1462/iJN1411_reactions.csv');
 
for i = 1 : length(a.RxnName)
        model = changeRxnBounds(model,a.RxnName{i},a.LB(i),'l')     ;
        model = changeRxnBounds(model,a.RxnName{i},a.UB(i),'u')     ;
end

end
