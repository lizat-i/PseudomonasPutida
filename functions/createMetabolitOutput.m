function [T] = createMetabolitOutput(model,solution)
s = inputname(1);

reactionNames = model.metNames(365:371);
 

%PHA_prod_rate1 = solution.v(pos_PHAC6)+ solution.v(pos_PHAC8);



SimulationRun =                        {reactionNames{:}}      ;

y_dualMet               =  solution.y(365:371)                ;
w_redCosr               =  solution.w(365:371)                ;
s_slack                 =  solution.s(365:371)                ;
 

T = table(y_dualMet,w_redCosr,s_slack,'RowNames',SimulationRun);


%disp(T)
end

