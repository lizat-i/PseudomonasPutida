function [T] = Model_SummTab(model,solution,varargin)
%EXCHTAB Summary of the exchange Reactions, if second input is given
%true default Reactions with default Values are not dissplayed
    
 
 
reactions = model.rxns(:);
result    = solution.v(:)  ;
 

SimulationRun =          reactions               ;
Rate                     =  result               ;

T = table(Rate,'RowNames',SimulationRun);
end

