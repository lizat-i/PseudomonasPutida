%% Task2
%   Experiment find out how to set the demand reactions properly


%% Create Experiment specific BoundaryConditions
[Oct_BaseCase,Gluc_limited,Gluc_BaseCase,Oct_limited,iJN1462_OCT_UR3_4,iJN1462_Glu_URexp]  =   deal(iJN1463);

%BaseCase Octanoat Glucose

Gluc_BaseCase         =   changeRxnBounds(Gluc_BaseCase,'EX_glc__D_e',-6.3,'l')     ;
Gluc_BaseCase         =   changeRxnBounds(Gluc_BaseCase,'EX_glc__D_e',-6.3,'u')     ;

     
  
Oct_BaseCase      = changeRxnBounds(Oct_BaseCase,'EX_glc__D_e',0,'l')       ;
Oct_BaseCase      = changeRxnBounds(Oct_BaseCase,'EX_glc__D_e',0,'u')       ;
Oct_BaseCase      = changeRxnBounds(Oct_BaseCase,'EX_octa_e',-3.4,'l')      ;
Oct_BaseCase      = changeRxnBounds(Oct_BaseCase,'EX_octa_e',-3.4,'u')      ;



%% limiting conditions
Gluc_limited   = changeRxnBounds(Gluc_limited,'EX_glc__D_e',-7.3,'l')       ;
Gluc_limited   = changeRxnBounds(Gluc_limited,'EX_glc__D_e',-7.3,'u')       ;
Gluc_limited   = changeRxnBounds(Gluc_limited,'EX_nh4_e',-1.5,'l')          ;
Gluc_limited   = changeRxnBounds(Gluc_limited,'EX_o2_e',-6.1,'l')           ;
 


Oct_limited  = changeRxnBounds(Oct_limited,'EX_glc__D_e',0,'l')       ;
Oct_limited  = changeRxnBounds(Oct_limited,'EX_glc__D_e',0,'u')       ;
Oct_limited  = changeRxnBounds(Oct_limited,'EX_octa_e',-3.4,'l')      ;
Oct_limited  = changeRxnBounds(Oct_limited,'EX_octa_e',-3.4,'u')      ;
Oct_limited  = changeRxnBounds(Oct_limited,'EX_nh4_e',-3.1,'l')       ;  
Oct_limited  = changeRxnBounds(Oct_limited,'EX_nh4_e',-3.1,'u')       ;  
Oct_limited  = changeRxnBounds(Oct_limited,'EX_o2_e',-13.5,'l')       ;  
Oct_limited  = changeRxnBounds(Oct_limited,'EX_o2_e',-13.5,'u')       ;  


%% Set DemandConstraint 

Gluc_BaseCase           = setDemandBoundaries(Gluc_BaseCase     ,1)     ;
Gluc_limited            = setDemandBoundaries(Gluc_limited      ,1)     ;
Oct_BaseCase            = setDemandBoundaries(Oct_BaseCase      ,5)     ; 
Oct_limited             = setDemandBoundaries(Oct_limited       ,5)     ; 

%% Solve Problem

S_Gluc_BC           = optimizeCbModel(Gluc_BaseCase)        ;
S_Oct_BC            = optimizeCbModel(Oct_BaseCase)         ;
S_Gluc_const        = optimizeCbModel(Gluc_limited)         ; 
S_Oct_const         = optimizeCbModel(Oct_limited)          ;
S_UR3_4             = optimizeCbModel(iJN1462_OCT_UR3_4)    ;
S_URexp             = optimizeCbModel(iJN1462_Glu_URexp)    ;
 
%% make costum printable table with Solutions 

[T_row1]    = createRelevantOutputDeviation(Gluc_BaseCase,S_Gluc_BC,"Glucose")	;
[T_row2]    = createRelevantOutputDeviation(Gluc_limited,S_Gluc_const,"Glucose")	;   
[T_row3]    = createRelevantOutputDeviation(Oct_BaseCase,S_Oct_BC,"Octanoate")	;
[T_row4]    = createRelevantOutputDeviation(Oct_limited,S_Oct_const,"Octanoate")	;

 
T = [T_row1;T_row2;T_row3;T_row4];

%;T_row5 ;T_rowexp];
 
 

%% Code for experimentation


%[T_row5]    = createRelevantOutputDeviation(iJN1462_OCT_UR3_4,S_UR3_4,"Octanoate")	;
%[T_rowexp]  = createRelevantOutputDeviation(iJN1462_Glu_URexp,S_URexp,"Octanoate");

%C Sources = glucanate

% iJN1462_OCT_UR3_4   = changeRxnBounds(iJN1462_OCT_UR3_4,'EX_glc__D_e',0,'l')        ;
% iJN1462_OCT_UR3_4   = changeRxnBounds(iJN1462_OCT_UR3_4,'EX_glc__D_e',0,'u')     ;
% iJN1462_OCT_UR3_4   = changeRxnBounds(iJN1462_OCT_UR3_4,'EX_octa_e',-3.4,'l')       ;
% iJN1462_OCT_UR3_4   = changeRxnBounds(iJN1462_OCT_UR3_4,'EX_octa_e',-3.4,'u')       ;
% iJN1462_OCT_UR3_4   = changeRxnBounds(iJN1462_OCT_UR3_4,'EX_nh4_e',-3.1,'l')        ; %Nitrogen uptake constraint
% iJN1462_OCT_UR3_4   = changeRxnBounds(iJN1462_OCT_UR3_4,'EX_nh4_e',-3.1,'u')        ; %Nitrogen uptake constraint 
% iJN1462_OCT_UR3_4   = changeRxnBounds(iJN1462_OCT_UR3_4,'EX_o2_e',-13.5,'l')        ; %Oxygen   uptake constraint 
% iJN1462_OCT_UR3_4   = changeRxnBounds(iJN1462_OCT_UR3_4,'EX_o2_e',-13.5,'u')        ; %Oxygen   uptake constraint 
% iJN1462_OCT_UR3_4   = setDemandBoundaries(iJN1462_OCT_UR3_4,2)                        ; %setDemandOutput
% 
% iJN1462_Glu_URexp   = changeRxnBounds(iJN1462_Glu_URexp,'EX_glc__D_e',-7.3,'l')         ;
% iJN1462_Glu_URexp   = changeRxnBounds(iJN1462_Glu_URexp,'EX_glc__D_e',-7.3,'u')         ;
% iJN1462_Glu_URexp   = changeRxnBounds(iJN1462_Glu_URexp,'EX_nh4_e',-3.1,'l')            ; 
% iJN1462_Glu_URexp   = changeRxnBounds(iJN1462_Glu_URexp,'EX_nh4_e',-3.1,'u')            ; 
% iJN1462_Glu_URexp   = changeRxnBounds(iJN1462_Glu_URexp,'PHAP2C100',5,'l')              ;
% iJN1462_Glu_URexp   = changeRxnBounds(iJN1462_Glu_URexp,'PHAP2C100',5,'u')              ;
% iJN1462_Glu_URexp   = changeRxnBounds(iJN1462_Glu_URexp,'EX_nh4_e',-3.1,'l')        ; %Nitrogen uptake constraint 
% iJN1462_Glu_URexp   = changeRxnBounds(iJN1462_Glu_URexp,'EX_nh4_e',-3.1,'u')        ; %Nitrogen uptake constraint 
% iJN1462_Glu_URexp   = changeRxnBounds(iJN1462_Glu_URexp,'EX_o2_e',-13.5,'l')        ; %Oxygen   uptake constraint
% iJN1462_Glu_URexp   = changeRxnBounds(iJN1462_Glu_URexp,'EX_o2_e',-13.5,'u')        ; %Oxygen   uptake constraint
 
% iJN1462_Glu_URexp   = changeRxnBounds(iJN1462_Glu_URexp,'EX_o2_e',-13.5,'l')        ; %Oxygen   uptake constraint
% iJN1462_Glu_URexp   = changeRxnBounds(iJN1462_Glu_URexp,'EX_o2_e',-13.5,'u')        ; %Oxygen   uptake constraint 

% Demand reaction constraint
%iJN1462_Glu_URexp = setDemandBoundaries(iJN1462_Glu_URexp,2)                        ; %setDemandOutput


%% Difference between two Solutions

 
%surfNet(Gluc_const,'RECOAH13',true, S_Gluc_const.x, false,true,[],[],[])


%surfNetExchRComp(Gluc_BC, S_Gluc_BC, S_Gluc_const) 

