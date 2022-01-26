%% Analysing the influence of C/N ratio onto the PHA Production rate
% Task finished, stuff to discuss: 
% -why is the production rate only triggered when using octanoate as the
%   carbon source ?
% 
%

%% BaseCase set Boaundaries and ddemandreaction boundaries

[BC,Oct_BC]   =   deal(iJN1463);

BC     = changeRxnBounds(BC,'EX_glc__D_e'   ,-7.3   ,'l')   ;
BC     = changeRxnBounds(BC,'EX_glc__D_e'   ,-7.3   ,'u')   ;
BC     = changeRxnBounds(BC,'EX_o2_e'       ,-13.5  ,'l')   ; 
BC     = setDemandBoundaries(BC,2)                         ;

Oct_BC   = changeRxnBounds(Oct_BC,'EX_glc__D_e',0,'l')        ;
Oct_BC   = changeRxnBounds(Oct_BC,'EX_glc__D_e',0,'u')     ;
Oct_BC   = changeRxnBounds(Oct_BC,'EX_octa_e',-3.4,'l')       ;
Oct_BC   = changeRxnBounds(Oct_BC,'EX_octa_e',-3.4,'u')       ;
Oct_BC   = changeRxnBounds(Oct_BC,'EX_nh4_e',-3.1,'l')        ; %Nitrogen uptake constraint 
Oct_BC   = changeRxnBounds(Oct_BC,'EX_o2_e',-13.5,'l')        ; %Oxygen   uptake constraint 
Oct_BC     = setDemandBoundaries(Oct_BC,2); 

%%Create, solve and display BaseCase
  %setDemandOutput
S_Gluc_BC   = optimizeCbModel(BC)                           ;
S_OCT_BC   = optimizeCbModel(Oct_BC)                            ;
[T_row1] = createRelevantOutput_loop(BC,S_Gluc_BC,'Glucose_BaseCase')	;
[T_row2] = createRelevantOutput_loop(Oct_BC,S_OCT_BC,'Octanoate_BaseCase')	;

%% 5 Punkte werden abgefahen

% nh4 exchange vector
    exchangeRatesNH4 = linspace(0.001,5,5);
    
% initialize Table 

    T = [T_row1;T_row2];
    
for k=1:numel(exchangeRatesNH4)
    
    % initialize problem Name
    problemVarName  = strcat('Glucose_7.3_NH4_'  ,num2str(exchangeRatesNH4(k))        );
     
    % adjust problem boundaries and solve it      
    problem=changeRxnBounds(BC,'EX_nh4_e',exchangeRatesNH4(k)*(-1),'l');
    solution= optimizeCbModel(problem);
    
    %create table row with summary
    [T_row1] = createRelevantOutput_loop(problem,solution,problemVarName)	;
    
    T = [T;T_row1];
    clear T_row1
end

disp(T)


