function [] = surfNetExchRComp(model, s, sFru) 
 
[L11,L22] = findExcRxns(model);
L2         = or(L11,L22);
fluxMatrix = [s.x, sFru.x];  % put two flux vectors in a matrix
%reactions with different fluxes
L3 = abs(fluxMatrix(:, 1) - fluxMatrix(:, 2)) > 1e-6;

rxnDiff = L3 & L2;
surfNet(model, model.rxns(rxnDiff), [], fluxMatrix, [], 0)
end

 