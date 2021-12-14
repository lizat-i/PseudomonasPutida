clear all
%% Task 1

% 1.1
load('N1') % Simplified glycolysis from Matrices m file

% 1.2

r = ones(13,1);
r(7:13,1)=2;

% Doubled flux after GAP because the C6-Compound fructose 1,6 phosphate is
% converted to two molecules of the C3-compound GAP in reaction 5 and 6

ss = N1*r;

% ss is a vector with solemnly zeros, so the steady state is fulfilled

% 1.3

rN1 = rank(N1);
nN1 = null(N1);

% Rank is 12, this means that we have a degree of freedom of 12 in the
% system. The null space is the vector that fulfills the ss condition -->
% N*null(N1)=0 . In our case, the null vector is a multiplication of the
% vector r.

%% Task 2

load('N2') % Complete glycolysis + redox/ATP + maintenance/growth

f = zeros(width(N2),1); % # entries = # fluxes
f(14) = -1; % Maximization of growth rate (ATP consumption)

b = zeros(height(N2),1); % # entries = # compounds (SS should be fulfilled)

lb = zeros(width(N2),1); % Boundary for fluxes, so # entries = # compounds
lb(17) = -100; % CO2 can be taken up or produced

ub = ones(width(N2),1).*100; % Upper boundaries at 100
ub(1) = 1; % Glucose uptake fixed at 1
ub(16) = 0; % Hydrogen is not considered yet

r_opt = linprog(f,[],[],N2,b,lb,ub); 
r_mu = r_opt(14); % 32 ATP per molecule of glucose

% 2.4

f = zeros(width(N2),1); 
f(1) = 1; % Minimization of glucose uptake

b = zeros(height(N2),1);

lb = zeros(width(N2),1); 
lb(17) = -100; % CO2 can be taken up or produced
lb(14) = 50; % Aim is 50 ATPs production

ub = ones(width(N2),1).*100; % Upper boundaries at 100
ub(16) = 0; % Hydrogen is not considered yet

r_opt = linprog(f,[],[],N2,b,lb,ub); 
r_gluc = r_opt(1)


%% Task 3

% 3.1
load('N3') % N2 + PHB synthesis

f = zeros(width(N3),1); 
f(24) = -1; % Optimization of PHB production

b = zeros(height(N3),1);

lb = zeros(width(N3),1);
lb(17) = -100; % CO2 can be taken up or produced

ub = ones(width(N3),1).*100; % Upper boundaries at 100
ub(1) = 1; % Glucose uptake fixed at 1
ub(16) = 0; % Hydrogen is not considered yet

r_opt = linprog(f,[],[],N3,b,lb,ub);

r_PHB = r_opt(24); % 1 mol of PHB per mole glucose



% 3.2

% Maximization of r_PHB and minimization of r_mu
f = zeros(width(N3),1); 
f(24) = -1; % Maximization of PHB production, 1st priority
f(14) = 0.01; % Minimization of growth, 2nd smaller priority

r_opt = linprog(f,[],[],N3,b,lb,ub);
disp('3.2.1')   
r_PHB = r_opt(24)
r_mu = r_opt(14)

% Maximization with different priorities
f = zeros(width(N3),1); 
f(24) = -1; % Maximization of PHB production, 1st priority
f(14) = -0.01; % Maximization of growth, 2nd smaller priority
r_mu = r_opt(14);

r_opt = linprog(f,[],[],N3,b,lb,ub);

disp('3.2.1')   
r_PHB = r_opt(24)
r_mu = r_opt(14)

% Dependent on priority of r_mu, there is either no PHB production and only
% growth or PHB production and reduced growth

% 3.3 
f = zeros(width(N3),1); 
f(24) = -1; % Maximization of PHB production, 1st priority

options = optimoptions('linprog','Display','none');
% Surpresse output message 'Optimal solution found' in linprog

% Pareto front with priority varying
a = [];
fff = [];
for i=-1:0.05:1
    f(14)=i;
    r_opt = linprog(f,[],[],N3,b,lb,ub,options);
    a   =  [a,r_opt(14)];
    fff = [fff,r_opt(24)];
end

xlabel('r_{mu}');
ylabel('r_{PHB}');

    figure(1)
    plot(a,fff )
 


f(24) = -1; % PHB Maximization 1 st priority
f(14) = -0.01; %  Growth is 2nd smaller priority

% Pareto front with varying glucose uptake
for i=0:0.05:2
    ub(1)=i;
    r_opt = linprog(f,[],[],N3,b,lb,ub,options);
    figure(2)
    plot(r_opt(14),r_opt(24),'ro')
    hold on   
end
 
xlabel('r_{mu}');
ylabel('r_{PHB}');

% Trade-off between biomass formation and PHB production, only 3 states
% observed:
% A) No PHB production, no growth
% B) No PHB production, maximum growth
% C) PHB production, reduced growth

% 3.4

ub(1)=1; %Set glucose uptake again

for i=-1:0.05:1
    f(14)=i;
    r_opt = linprog(f,[],[],N3,b,lb,ub,options);
    figure(3)
    plot(i,r_opt(14),'ro')
    plot(i,r_opt(24),'bo')
    legend('r_{PHB}','r_{mu}')
    hold on
end

xlabel('priority mu');
ylabel('r');

% whenever mu is not prioritized (minimized) between roughly 0 and 0.2, 
% there will be no PHB production

%% Task 4

load('N4'); % N3 + PHP synthesis (Glycerine-Metabolism)

% 4.1
f = zeros(width(N4),1); 
f(30) = -1; % Optimization of PHP production

b = zeros(height(N4),1);

lb = zeros(width(N4),1);
lb(17) = -100; % CO2 can be taken up or produced

ub = ones(width(N4),1).*100; % Upper boundaries at 100
ub(1) = 0; % Glucose is not considered
ub(16) = 0; % Hydrogen is not considered yet
ub(25) = 1; % Glycerine is only substrate

r_opt = linprog(f,[],[],N4,b,lb,ub);

r_PHP = r_opt(30); % 1 mol of PHP / 1 mol of Glycerine

% 4.2
f = zeros(width(N4),1); 
f(24) = -1; % Optimization of PHB production

b = zeros(height(N4),1);

lb = zeros(width(N4),1);
lb(17) = -100; % CO2 can be taken up or produced

ub = ones(width(N4),1).*100; % Upper boundaries at 100
ub(1) = 0; % Glucose is not considered
ub(16) = 0; % Hydrogen is not considered yet
ub(25) = 1; % Glycerine is only substrate

r_opt = linprog(f,[],[],N4,b,lb,ub);

r_PHB = r_opt(24); % 1/2 mol PHB per mol glycerine

% Mass-yield:

w_PHB = r_PHB*86/92;
w_PHP = r_PHP*72/92; % PH Proprionate (one C atom different than PH Butyrate)
% ->  the mass yield of PHP on glycerine is higher than that of PHB



%% Task 5

% Test whether PHP can now be produced from glucose

load('N5'); % Matrix N4 + carbon fixation pathway 3-Hydroxy-Propionyl-CoA

f = zeros(width(N5),1);
f(1) = 1; % Optimization for glucose consumption

b = zeros(height(N5),1);

lb = zeros(width(N5),1);
lb(17)=-100; % CO2 can be taken up or produced
lb(24)=1; % Fix PHP to 1 for co-polymer
lb(30)=1; % Fix PHB to 1 for co-polymer

ub = ones(width(N5),1).*100; % Upper boundaries at 100
ub(16) = 0; % Hydrogen is not considered yet
ub(25) = 0; % Glycerine is not considered


r_opt = linprog(f,[],[],N5,b,lb,ub);

r_gluc = r_opt(1);
r_PHP = r_opt(30);
r_PHB = r_opt(24);

%% Task 6

% v6.1
load('N6'); % Matrix N4 + Calvin-Cycle

f = zeros(width(N6),1);
f(24) = -1; %PHB optimization

b = zeros(height(N6),1);

lb = zeros(width(N6),1);

ub = ones(width(N6),1).*100; % Upper boundaries at 100
ub(1) = 1; % Glucose is only substrate
ub(25) = 0; % Glycerine is not considered
ub(17) = 0; % No input of CO2 (only CO2 from heterotrophic condition)

r_opt = linprog(f,[],[],N6,b,lb,ub);

r_PHB = r_opt(24); %1.5 PHB
r_H = r_opt(16); %4.1 H2 necessary
%%
% 6.2 _ PHB var
load('N6');

f = zeros(width(N6),1);
f(24) = -1; % PHB optimization

b = zeros(height(N6),1);

lb = zeros(width(N6),1);

ub = ones(width(N6),1).*100; % Upper boundaries at 100
ub(25) = 0; % Glycerine is not considered
ub(17) = 0; % No input of CO2 (only CO2 from heterotrophic condition)

% Fix PHB to a certain value whilst minimizing the necessary glucose, and
% simulataneously report the input of H2

ub_var=0:0.5:10;

options = optimoptions('linprog','Display','none');

for i=1:length(ub_var)
    ub(24)= ub_var(i);
    lb(24)= ub_var(i);
    r_opt = linprog(f,[],[],N6,b,lb,ub,options);
    r_H(i)= r_opt(16);
    r_gluc(i)= r_opt(1);
end
 
HtoG = r_H./r_gluc;
PtoG = ub_var./r_gluc;

figure()
plot(HtoG,PtoG,'ro')
xlabel('H2/GlucoseUptake')
ylabel('PHB/Glucose')

%%
% 6.2_ H var

load('N6');

f = zeros(width(N6),1);
f(24) = -1; % PHB optimization

b = zeros(height(N6),1);

lb = zeros(width(N6),1);

ub = ones(width(N6),1).*100; % Upper boundaries at 100
ub(25) = 0; % Glycerine is not considered
ub(17) = 0; % No input of CO2 (only CO2 from heterotrophic condition)

H_var=0:0.5:10;

options = optimoptions('linprog','Display','none');

for i=1:length(H_var)
%     lb(16)= H_var(i);
    ub(16)= H_var(i);
    r_opt = linprog(f,[],[],N6,b,lb,ub,options);
    r_PHB(i)= r_opt(24);
    r_gluc(i)= r_opt(1);
end
 
HtoG = H_var./r_gluc;
PtoG = r_PHB./r_gluc;

figure()
plot(HtoG,PtoG,'r-')
xlabel('H2/GlucoseUptake')
ylabel('PHB/Glucose')
%% 
% Task 6.3
load('N6');

f = zeros(width(N6),1);
f(24)=-1;

b = zeros(height(N6),1);

lb = zeros(width(N6),1);

ub = ones(width(N6),1).*100; % Upper boundaries at 100
ub(1)= 0; % No glucose in cultivation
ub(25) = 0; % Glycerine is not considered
ub(7)=0; % Reaction will not take place when no glucose is there
ub(8)=0; % Reaction will not take place when no glucose is there

mu_var=0:1:40;
r_O=zeros(length(mu_var),1);
r_H=zeros(length(mu_var),1);
r_C=zeros(length(mu_var),1);

options = optimoptions('linprog','Display','none');

for i = 1:length(mu_var)
    lb(14) = mu_var(i);
    ub(14) = mu_var(i);
    r_opt = linprog(f,[],[],N6,b,lb,ub,options);
    r_O(i,1)= r_opt(15);
    r_H(i,1)= r_opt(16);
    r_C(i,1)= r_opt(17);
end

figure()
plot(mu_var,r_O,'b-',mu_var,r_H,'g-',mu_var,r_C,'r-')
xlabel('r_{mu}')
ylabel('r_{gas}')
legend('O_2','H_2','CO_2')

%% check for NAD+

[row,col,v]=find(N6(18,:));
r_sum = [r_opt(col(1)) r_opt(col(2)) r_opt(col(3)) r_opt(col(4)) r_opt(col(5)) r_opt(col(6)) r_opt(col(7)) ];

m = v.*r_sum;

b = sum(m);

%% check for NADH

[row,col,v]=find(N6(19,:));
r_sum = [r_opt(col(1)) r_opt(col(2)) r_opt(col(3)) r_opt(col(4)) r_opt(col(5)) r_opt(col(6)) r_opt(col(7)) ];

m = v.*r_sum;

b = sum(m);

