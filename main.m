%% Initialize 
close all
clear all
format

%% add current and all subfolders to path

folder = fileparts(which(mfilename))        ; 
addpath(genpath(folder))                    ;
% this path must be modified to point to your cobra-fork folder
addpath("/home/ivan/dev/Project/cobratoolbox");

%% Execute this part only ones when starting work

initCobraToolbox(false); % false, as we don't want to update

%change Solver:
     changeCobraSolver ('ibm_cplex', 'LP')          ;
     changeCobraSolver ('ibm_cplex', 'MILP')        ;
     changeCobraSolver ('ibm_cplex', 'QP')          ;
     changeCobraSolver ('ibm_cplex', 'MIQP')        ;

%load Model 
    iJN1463_initial    = readCbModel(which('iJN1463.xml'))           ;
    
%% Set Medium based lower and upper BoundaryConditions

% choose Medium and adjust BC
   % medium 1 = glucose min Medium M9
   % medium 2 = In silico Luria Broth (LB) medium
   % medium 3 = reseting all reactions to +/- 1000
   
    medium = 1;

% copys of the initial model (no medium boundaries set, allways available)
    iJN1463       = iJN1463_initial;

% set medium boundaries 
    iJN1463     = setMediumBoundaries(iJN1463_initial,medium)   ; 
 
 
%% Run the tasks original Model the iJN1463 

% scipt task 1 is the recreation of the Nogales Paper

%run(which('task1.m'))

% scipt task 2 whas to experiment and get the PHA production running

%run(which('task2.m'))

% scipt task 3 mimic the octatonoate base case C/N ratio, and from there
% variy it using glucose as the carbon source and implement oop to analyze
% and display the resulting PHA rates

%% project in development

%run(which('task3.m'))
