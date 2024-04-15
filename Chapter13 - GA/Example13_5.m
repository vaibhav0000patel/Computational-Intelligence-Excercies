clc;clear;
% Example 13.5 (Numbers of schemas and mutation immunities of binary and hex codes)
% Consider one-mega-bit memory as a search space, compare a binary coded genetic algorithm to a hex-coded genetic algorithm by calculating the followings:
% (a) Upper and lower bounds on the number of different schemas in a population of size P = 50.
% (b) Calculate the probability of surviving mutation for each schema using both coding methods if the probability of mutation pm is 0.1 at a single bit position for binary coding and at a single digit position for hex coding. State your conclusion from the obtained results.


% Parameters
P = 50; % Population size
pm = 0.1; % Mutation probability
L_binary = 20; % Length of the binary string
L_hex = 5; % Length of the hex string

% Part (a) - Calculate the bounds on the number of different schemas
% Upper bound for binary-coded genetic algorithm
binary_upper_bound = sum(2^L_binary - (0:(P-1)));

% Lower bound for binary-coded genetic algorithm
binary_lower_bound = 2^L_binary; % For P identical schemas

% Upper bound for hex-coded genetic algorithm
hex_upper_bound = sum(16^L_hex - (0:(P-1)));

% Lower bound for hex-coded genetic algorithm
hex_lower_bound = 16^L_hex; % For P identical schemas

fprintf('Binary-coded GA Upper Bound: %d\n', binary_upper_bound);
fprintf('Binary-coded GA Lower Bound: %d\n', binary_lower_bound);
fprintf('Hex-coded GA Upper Bound: %d\n', hex_upper_bound);
fprintf('Hex-coded GA Lower Bound: %d\n', hex_lower_bound);

% Part (b) - Calculate the probability of surviving mutation
% For binary coding
binary_survival_probability = (1 - pm)^L_binary;

% For hex coding
hex_survival_probability = (1 - pm)^L_hex;

fprintf('Binary-coded GA Schema Survival Probability: %.4f\n', binary_survival_probability);
fprintf('Hex-coded GA Schema Survival Probability: %.4f\n', hex_survival_probability);
