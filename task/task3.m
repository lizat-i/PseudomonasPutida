%% Try to make a loop where the solutions are stored and labaeled automaticly and then displayed

[BC]   =   deal(iJN1463);

%% BaseCase set Boaundaries and ddemandreaction boundaries

BC     = changeRxnBounds(BC,'EX_glc__D_e',-7.3,'l')   ;
BC     = changeRxnBounds(BC,'EX_glc__D_e',-7.3,'u')   ;
BC     = setDemandBoundaries(BC,3)                    ;

%%Create, solve and display BaseCase
  %setDemandOutput
S_Gluc_BC   = optimizeCbModel(BC)                           ;
[T_row1] = createRelevantOutput(BC,S_Gluc_BC,"Glucose")	;

%% 5 Punkte werden abgefahen

% nh4 exchange vector
    exchangeRatesNH4 = linspace(0.08,0.9,5);
    
% initialize Table 

    T = T_row1;
    
for k=1:numel(exchangeRatesNH4)
    
    % initialize problem Name
    
    problemVarName  = strcat('Problem_NH4_'  ,num2str(exchangeRatesNH4(k))        );
    solutionVarName = strcat('Solution_NH4_' ,num2str(exchangeRatesNH4(k))        );
    
    % adjust problem boundaries and solve it   
    
    eval(sprintf('%s = %g',problemVarName,changeRxnBounds(BC,'EX_nh4_e',exchangeRatesNH4(k)*(-1),'l')));
    eval(sprintf('%s = %g',solutionVarName,optimizeCbModel(interm)));
    
    %create table row with summary
    [T_row1] = createRelevantOutput(problemVarName,solutionVarName)	;
    T = [T;T_row1];
    
end




