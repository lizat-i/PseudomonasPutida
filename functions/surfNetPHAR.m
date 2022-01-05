function surfNetPHAR(model,solution)
%SURFNETEXCHR Summary of this function goes here
%   Detailed explanation goes here
 
L3 = findRxnIDs(model,getPHA_subs());
 

surfNet(model,model.rxns(L3),true, solution.x, true,false,[],[],[])
end

