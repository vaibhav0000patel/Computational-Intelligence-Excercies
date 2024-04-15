% Example 13.7 (Linear scaling of fitness values Matlab
% Write a Matlab program to apply linear scaling to transform a given set of 10 raw fitness values f = [3, 7, 9, 12, 16, 18, 21, 24, 88, 95] to 10 linearly scaled fitness values 𝑓' with the parameter 𝐶mult to be selected as 2, to illustrate the advantages of linear scaling that include:
% f' = af + b
% (a) Each population member with average fitness contributes one expected
% offspring in the next generation by f'avg = favg
% (b) The number of offspring given to the population member with a maximum raw fitness is controlled by f'max = Cmult x favg.
% (c) The minimum fitness function is non-negative by f'min >= 0


% Raw fitness values
f = [3, 7, 9, 12, 16, 18, 21, 24, 88, 95];

% Calculate average raw fitness
favg = mean(f);

% Cmult parameter
Cmult = 2;

% Desired maximum scaled fitness
fmax_prime = Cmult * favg;

% Calculation of a and b using the formula:
% fmax_prime = a * max(f) + b
% favg = a * favg + b
% We solve these equations to find a and b

% Matrix for coefficients of a and b
A = [max(f), 1; favg, 1];
% Matrix for outcomes fmax_prime and favg
B = [fmax_prime; favg];

% Solve for a and b
coefficients = A \ B;
a = coefficients(1);
b = coefficients(2);

% Apply linear scaling to the fitness values
f_prime = a * f + b;

% Print scaled fitness values
disp('Scaled fitness values:');
disp(f_prime);
