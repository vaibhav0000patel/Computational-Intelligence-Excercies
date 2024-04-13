clc;clear;
% Example 9.6 (Fuzzy set mapping using quadratic function by extension principle)
% Let a fuzzy set A with a discrete universe of discourse X = {-3, -2, -1, 0, 1, 2, 3} 
% be defined as 
% A=0.5/-3 + 0.7/-2 + 0.9/-1 + 1.0/0 + 0.8/1 + 0.4/2 + 0.2/3 and 
% y = f(x) = x^2 - 5.
% Apply the extension principle to find the fuzzy set B which is obtained from the image of the fuzzy set A under the mapping y = f(x).
% Draw a sagittal diagram to show the mapping.


% Define the universe of discourse X and membership values of fuzzy set A
X = -3:3;
mu_A = [0.5, 0.7, 0.9, 1.0, 0.8, 0.4, 0.2];

% Define the function f(x) = x^2 - 5
f = @(x) x.^2 - 5;

% Calculate the images of elements in X under the function f
Y = f(X);

% Initialize the fuzzy set B with zeros at first, with unique values of Y
unique_Y = unique(Y);
mu_B = zeros(size(unique_Y));

% Apply the extension principle: for each unique y, find the maximum membership
for i = 1:length(unique_Y)
    y = unique_Y(i);
    indices = find(Y == y);
    mu_B(i) = max(mu_A(indices));
end

% Optionally, display the new fuzzy set B
disp('Fuzzy Set B:');
for i = 1:length(unique_Y)
    fprintf('%.1f/%d + ', mu_B(i), unique_Y(i));
end
fprintf('\b\b \n');  % Clean up the last plus sign
