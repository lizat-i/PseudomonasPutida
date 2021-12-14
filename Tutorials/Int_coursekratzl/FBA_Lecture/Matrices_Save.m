% Matrices for case-study 3 FBA %

N1 = readmatrix('StochMatrices','Sheet','N1','Range','C4:N16').';

save('N1','N1')

N2 = sparse(readmatrix('StochMatrices','Sheet','N2','Range','C4:Y24').');

save('N2','N2')

N3 = sparse(readmatrix('StochMatrices','Sheet','N3','Range','C4:AA27').');

save('N3','N3')

N4 = sparse(readmatrix('StochMatrices','Sheet','N4','Range','C4:AE33').');

save('N4','N4')

N5 = sparse(readmatrix('StochMatrices','Sheet','N5','Range','C4:AH37').');

save('N5','N5')

N6 = sparse(readmatrix('StochMatrices','Sheet','N6','Range','C4:AG38').');

save('N6','N6')

save('Matrices','N3','N4','N6');