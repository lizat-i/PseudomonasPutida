function [T] = createRelevantOutput_loop(model,solution,name)
s = name; 
%%
[pos_phosphate,~]   =   getIDPositions(model,'EX_pi_e','rxns')      ;
[pos_ammonium,~]    =   getIDPositions(model,'EX_nh4_e','rxns')     ;
[pos_Glucose,~]     =   getIDPositions(model,'EX_glc__D_e','rxns')	;
[pos_octanoate,~]   =   getIDPositions(model,'EX_octa_e','rxns')	;
[pos_GLUNC_,~]      =   getIDPositions(model,'EX_glcn_e','rxns')	;
[pos_K2GLCN,~]      =   getIDPositions(model,'EX_2dhglcn_e','rxns')	;
[pos_o2,~]          =   getIDPositions(model,'EX_o2_e','rxns')      ;
[pos_co2,~]         =   getIDPositions(model,'EX_co2_e','rxns')     ;
[pos_skPHA,~]       =   getIDPositions(model,'SK_PHAg_c','rxns')	;

%%  producing REactions 
%    

[pos_a6,~] =    getIDPositions(model,'PHAP2C60','rxns')      ;
[pos_a8,~] =    getIDPositions(model,'PHAP2C80','rxns')      ;
[pos_a10,~] =   getIDPositions(model,'PHAP2C100','rxns')     ;
[pos_a12,~] =   getIDPositions(model,'PHAP2C120','rxns')     ;

[pos_c6,~] =    getIDPositions(model,'PHAPCP60','rxns')      ;
[pos_c8,~] =    getIDPositions(model,'PHAPCP80','rxns')      ;
[pos_c10,~] =   getIDPositions(model,'PHAPCP100','rxns')     ;
%%  consuming REactions 
%       aliphatic PHA's
[pos_2a6,~] =    getIDPositions(model,'PHADPC60','rxns')      ;
[pos_2a8,~] =    getIDPositions(model,'PHADPC80','rxns')      ;
[pos_2a10,~] =   getIDPositions(model,'PHADPC100','rxns')     ;
[pos_2a12,~] =   getIDPositions(model,'PHADPC120','rxns')     ; 

[pos_2c6,~] =    getIDPositions(model,'PHADPCP60','rxns')      ;
[pos_2c8,~] =    getIDPositions(model,'PHADPCP80','rxns')      ;
[pos_2c10,~] =   getIDPositions(model,'PHADPCP100','rxns')     ;

%%   
sinkPHA_     =   solution.v(pos_skPHA)	; 

GLUC        =   solution.v(pos_Glucose)	; 
NH4_1       =   solution.v(pos_ammonium)	; 
OUR_V       =   solution.v(pos_o2)      ;
CO2_1       =   solution.v(pos_co2)	; 

a6_ = solution.v(pos_a6);
a8_ = solution.v(pos_a8);
a10_= solution.v(pos_a10);
a12_= solution.v(pos_a12);

c8_ = solution.v(pos_c8);
c6_ = solution.v(pos_c6);
c10_= solution.v(pos_c10);

ad6_ = solution.v(pos_2a6);
ad8_ = solution.v(pos_2a8);
ad10_= solution.v(pos_2a10);
ad12_= solution.v(pos_2a12);

cd8_ = solution.v(pos_2c6);
cd6_ = solution.v(pos_2c8);
cd10_= solution.v(pos_2c10);

 
a6_8_10_12_pro_  = abs(a6_)+abs(a8_)+abs(a10_)+abs(a12_) ;
c6_8_10_pro_     = abs(c6_)+abs(c8_)+abs(c10_)           ;

a6_8_10_12_dem_  = abs(ad6_)+abs(ad8_)+abs(ad10_)+abs(ad12_) ;
c6_8_10_dem_     = abs(cd6_)+abs(cd8_)+abs(cd10_)           ;

%PHA_prod_rate1 = solution.v(pos_PHAC6)+ solution.v(pos_PHAC8);



SimulationRun =                        {s}      ;

Gluc                    =  GLUC                 ;
NH4                     =   NH4_1               ; 
OUR                     =    OUR_V              ;
CO2                     =     CO2_1             ;
GrowthRate              = solution.f            ;

a6_8_12_pro             =  a6_8_10_12_pro_      ;
c6_8_10_pro             =  c6_8_10_pro_         ;  

a6_8_12_dem             =  a6_8_10_12_dem_      ;
c6_8_10_dem             =  c6_8_10_dem_         ; 


sinkPHA                 = sinkPHA_               ;


a8 = a8_    ;
a6 = a6_    ;
a10 = a10_  ;
a12 = a12_  ;
c8  = c8_ ;
c6 =  c8_ ; 
c10= c10_ ;

ad8 = ad8_;
ad6 = ad6_;
ad10 =ad6_;
ad12 = ad12_;
cd8 = cd8_;
cd6 =   cd6_ ; 
cd10 = cd10_;

%T = table(Gluc,NH4,OUR, CO2,GrowthRate,a6_8_12_pro,c6_8_10_pro,a6_8_12_dem,c6_8_10_dem,sinkPHA,'RowNames',SimulationRun);
T = table(Gluc,NH4,OUR, CO2,GrowthRate, a6,a8 ,a10,a12,c6,c8,c10,ad6,ad8,ad10,ad12,cd6,cd8,cd10,sinkPHA,'RowNames',SimulationRun);
end

