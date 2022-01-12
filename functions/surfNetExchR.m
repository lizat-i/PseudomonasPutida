function surfNetExchR(model,solution)
%SURFNETEXCHR Summary of this function goes here
%   Detailed explanation goes here
[L11,L22] = findExcRxns(model);
L2         = or(L11,L22);
L1 = abs(solution.x)~=0.0000;

L3  = L1 & L2;
%L3  = abs(solution.x)>0.001 & findExcRxns(model);

surfNet(model,model.rxns(L3),false, solution.x, false,false,[],[],[])
end

