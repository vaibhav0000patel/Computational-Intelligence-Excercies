% Define the input parameters
M = 64;
N = 64;
nF = 8;
F1 = 5;
F2 = 5;
D = 3;
S = 1;
P = 3;



% Calculate the effective filter size considering dilation
F1_dilated = F1 + (F1 - 1) * (D - 1);
F2_dilated = F2 + (F2 - 1) * (D - 1);

% Calculate the size of the output feature map
Mc = (M + 2 * P - F1_dilated) / S + 1
Nc = (N + 2 * P - F2_dilated) / S + 1

O_M = floor(Mc);
O_N = floor(Nc);

% Calculate the total number of neurons in the output
total_neurons = nF * O_M * O_N;

% Display the result
fprintf('Total number of neurons in the output: %d\n', total_neurons);
