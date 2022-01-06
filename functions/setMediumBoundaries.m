function model = setMediumBoundaries(model,switchInput)



switch switchInput
    
        %medium 1 gluc-min Medium
        case 1
        % Glucose uptake    
        model = changeRxnBounds(model,'EX_glc__D_e',-6.3,'l')     ;
        model = changeRxnBounds(model,'EX_glc__D_e',1000,'u')     ;
        % CO2 exchange
        model=changeRxnBounds(model,'EX_co2_e',-100,'l');
        model=changeRxnBounds(model,'EX_co2_e',1000,'u');      
        % H20 exchange
        model=changeRxnBounds(model,'EX_h2o_e',-100,'l');
        model=changeRxnBounds(model,'EX_h2o_e',1000,'u');       
        % Proton exchange
        model=changeRxnBounds(model,'EX_h_e',-100,'l');
        model=changeRxnBounds(model,'EX_h_e',1000,'u');    
        % oxygen exchange
        model=changeRxnBounds(model,'EX_o2_e',-30,'l');
        model=changeRxnBounds(model,'EX_o2_e',1000,'u');  
        % calcium exchange
        model=changeRxnBounds(model,'EX_ca2_e',-10,'l');
        model=changeRxnBounds(model,'EX_ca2_e',1000,'u');
        % chlorid exchange
        model=changeRxnBounds(model,'EX_cl_e',-10,'l');
        model=changeRxnBounds(model,'EX_cl_e',1000,'u');  
        % cooper exchange
        model=changeRxnBounds(model,'EX_cu2_e',-10,'l');
        model=changeRxnBounds(model,'EX_cu2_e',1000,'u');  
        % iron exchange
        model=changeRxnBounds(model,'EX_fe2_e',-10,'l');
        model=changeRxnBounds(model,'EX_fe2_e',1000,'u');  
        % bicarbonate exchange
        model=changeRxnBounds(model,'EX_hco3_e',-10,'l');
        model=changeRxnBounds(model,'EX_hco3_e',1000,'u');
    	% kalium exchange
        model=changeRxnBounds(model,'EX_k_e',-10,'l');
        model=changeRxnBounds(model,'EX_k_e',1000,'u');
        % magnesium exchange
        model=changeRxnBounds(model,'EX_mg2_e',-10,'l');
        model=changeRxnBounds(model,'EX_mg2_e',1000,'u');
        % mangan exchange
        model=changeRxnBounds(model,'EX_mn2_e',-10,'l');
        model=changeRxnBounds(model,'EX_mn2_e',1000,'u');
        % molybden exchange
        model=changeRxnBounds(model,'EX_mobd_e',-10,'l');
        model=changeRxnBounds(model,'EX_mobd_e',1000,'u');
        % sodium exchange
        model=changeRxnBounds(model,'EX_na1_e',-10,'l');
        model=changeRxnBounds(model,'EX_na1_e',1000,'u');        
        % ammonia exchange
        model=changeRxnBounds(model,'EX_nh4_e',-10,'l');
        model=changeRxnBounds(model,'EX_nh4_e',1000,'u');
        % nickel exchange
        model=changeRxnBounds(model,'EX_ni2_e',-10,'l');
        model=changeRxnBounds(model,'EX_ni2_e',1000,'u');
        % phosphate exchange
        model=changeRxnBounds(model,'EX_pi_e',-10,'l');
        model=changeRxnBounds(model,'EX_pi_e',1000,'u');
        % selenate exchange
        model=changeRxnBounds(model,'EX_sel_e',-10,'l');
        model=changeRxnBounds(model,'EX_sel_e',1000,'u');
        % sulfate exchange
        model=changeRxnBounds(model,'EX_so4_e',-10,'l');
        model=changeRxnBounds(model,'EX_so4_e',1000,'u');
        % tungsten exchange
        model=changeRxnBounds(model,'EX_tungs_e',-10,'l');
        model=changeRxnBounds(model,'EX_tungs_e',1000,'u');
        % Zn2 exchange
        model=changeRxnBounds(model,'EX_zn2_e_',-10,'l');
        model=changeRxnBounds(model,'EX_zn2_e_',1000,'u');
 
            case 2
        
        % amino Acids
        model=changeRxnBounds(model,'EX_ala__L_e',-5,'l');
        model=changeRxnBounds(model,'EX_asp__L_e',-5,'l');
        model=changeRxnBounds(model,'EX_glu__L_e',-5,'l');
        model=changeRxnBounds(model,'EX_his__L_e',-5,'l');
        model=changeRxnBounds(model,'EX_leu__L_e',-5,'l');
        model=changeRxnBounds(model,'EX_met__L_e',-5,'l');
        model=changeRxnBounds(model,'EX_pro__L_e',-5,'l');
        model=changeRxnBounds(model,'EX_thr__L_e',-5,'l');
        model=changeRxnBounds(model,'EX_tyr__L_e',-5,'l');
        model=changeRxnBounds(model,'EX_arg__L_e',-5,'l');
        model=changeRxnBounds(model,'EX_cys__L_e',-5,'l');
        model=changeRxnBounds(model,'EX_gly_e'   ,-5,'l');
        model=changeRxnBounds(model,'EX_ile__L_e',-5,'l');
        model=changeRxnBounds(model,'EX_lys__L_e',-5,'l');
        model=changeRxnBounds(model,'EX_phe__L_e',-5,'l');
        model=changeRxnBounds(model,'EX_ser__L_e',-5,'l');
        model=changeRxnBounds(model,'EX_trp__L_e',-5,'l');
        model=changeRxnBounds(model,'EX_val__L_e',-5,'l');
        % Vitamins
        
        model=changeRxnBounds(model,'EX_cbl1_e',-0.1,'l');
        model=changeRxnBounds(model,'EX_btn_e',-0.1,'l');
        model=changeRxnBounds(model,'EX_nac_e',-0.1,'l');
        model=changeRxnBounds(model,'EX_pnto__R_e',-0.1,'l');
        model=changeRxnBounds(model,'EX_chor_e',-0.1,'l');
        model=changeRxnBounds(model,'EX_26dap__M_e',-0.1,'l');
        model=changeRxnBounds(model,'EX_sheme_e',-0.1,'l');
        
        % other metabolites 1
        model=changeRxnBounds(model,'EX_na1_e',-100,'l');
        model=changeRxnBounds(model,'EX_cl_e',-100,'l');
        model=changeRxnBounds(model,'EX_so4_e',-100,'l');
        model=changeRxnBounds(model,'EX_k_e',-100,'l');
        model=changeRxnBounds(model,'EX_pi_e',-100,'l');
        model=changeRxnBounds(model,'EX_ca2_e',-100,'l');
        model=changeRxnBounds(model,'EX_mg2_e',-100,'l');
        model=changeRxnBounds(model,'EX_sel_e',-100,'l');
        model=changeRxnBounds(model,'EX_zn2_e_',-100,'l');
        model=changeRxnBounds(model,'EX_aso4_e',-100,'l');
        model=changeRxnBounds(model,'EX_cd2_e',-100,'l');
        model=changeRxnBounds(model,'EX_hg2_e',-100,'l');
        model=changeRxnBounds(model,'EX_pb2_e',-100,'l');
        
        % other metabolites 2
        model=changeRxnBounds(model,'EX_ni2_e',-100,'l');
        model=changeRxnBounds(model,'EX_cu2_e',-100,'l');
        model=changeRxnBounds(model,'EX_fe2_e',-100,'l');
        model=changeRxnBounds(model,'EX_fe3_e',-100,'l');
        model=changeRxnBounds(model,'EX_mn2_e',-100,'l');
        model=changeRxnBounds(model,'EX_mobd_e',-100,'l');
        model=changeRxnBounds(model,'EX_cobalt2_e',-100,'l');
        
        % Nukleotides/nucleosides 
 
        model=changeRxnBounds(model,'EX_ins_e',-5,'l');
        model=changeRxnBounds(model,'EX_hxan_e',-5,'l');
        model=changeRxnBounds(model,'EX_ura_e',-5,'l');
        model=changeRxnBounds(model,'EX_uri_e',-5,'l');
        model=changeRxnBounds(model,'EX_adn_e',-5,'l');
        
        % additional constraints
        model=changeRxnBounds(model,'EX_o2_e',-21.5,'l');
        model=changeRxnBounds(model,'EX_nh4_e',0,'l');
        
            case 3
        % Reset all exchange Rections to be reversible Reactions
            EXCHANGE_Reactions = nan;
            run functions/exchangeRateCell.m
            for i = 1 : length(EXCHANGE_Reactions)           
                model = changeRxnBounds(model,EXCHANGE_Reactions{i},-1000,'l');
                model = changeRxnBounds(model,EXCHANGE_Reactions{i},1000,'u');
            end   

end
