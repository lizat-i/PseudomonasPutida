%% Big Solver Comparison sheet


%% Comarison of different Silvers for reproduction
changeCobraSolver ('ibm_cplex', 'LP')          ;
changeCobraSolver ('ibm_cplex', 'MILP')        ;
run task/task1.m                               ;
T_ibm_cplex = T                                ;

changeCobraSolver ('gurobi', 'LP')          ;
changeCobraSolver ('gurobi', 'MILP')        ;
run task/task1.m
T_gurobi = T;

changeCobraSolver ('glpk', 'LP')            ;
changeCobraSolver ('glpk', 'MILP')          ;
run task/task1.m
T_glpk = T;

T_ibm_cplex
T_gurobi
T_glpk




%% Solver Comparison is the FVA FBA gap the same for all solvers

changeCobraSolver ('ibm_cplex', 'LP')          ;
changeCobraSolver ('ibm_cplex', 'MILP')        ;
run task/task2.m                               ;
T_ibm_cplex = T                                ;

changeCobraSolver ('gurobi', 'LP')          ;
changeCobraSolver ('gurobi', 'MILP')        ;
run task/task2.m
T_gurobi = T;

changeCobraSolver ('glpk', 'LP')            ;
changeCobraSolver ('glpk', 'MILP')          ;
run task/task2.m
T_glpk = T;


T_ibm_cplex
T_gurobi
T_glpk
 

%% Solver Comparison is the FVA FBA gap the same for all solvers

changeCobraSolver ('ibm_cplex', 'LP')          ;
changeCobraSolver ('ibm_cplex', 'MILP')        ;
run task/task3.m                               ;
T_ibm_cplex = T                                ;

changeCobraSolver ('gurobi', 'LP')          ;
changeCobraSolver ('gurobi', 'MILP')        ;
run task/task3.m
T_gurobi = T;

changeCobraSolver ('glpk', 'LP')            ;
changeCobraSolver ('glpk', 'MILP')          ;
run task/task3.m
T_glpk = T;


T_ibm_cplex
T_gurobi
T_glpk
 