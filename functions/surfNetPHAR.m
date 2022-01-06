function surfNetPHAR(model,solution)
%[~, a ] = ititializePHA_metabolism(model);
%SURFNETEXCHR Summary of this function goes here
%   Detailed explanation goes here
L3 = findRxnIDs(model,getPHA_subs());
 
%L3 = findRxnIDs(model,a.reaxn);
 
surfNet(model,model.rxns(L3),true, solution.x, true,false,[],[],[])
end
