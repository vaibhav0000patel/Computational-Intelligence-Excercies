clc;clear;
% Example 9.8 (Two-dimensional to one-dimensional universal mapping using linear function by extension principle)

% Suppose f is a function mapping ordered pairs from 
% X1 = {1, 3, 5} and X2 = {2, 4} to Y = {3, 5, 7, 9} and 
% y = f(x1,x2) = x1 + x2.
% Let A1 and A2 be fuzzy sets defined on X1 and X2, respectively, 
% such that 
% A1 = 0.1/1 + 0.3/3 +0.5/5 and 
% A2 = 0.2/2 + 0.4/4

% Define the fuzzy sets A1 and A2
A1 = [0.1, 0.3, 0.5];
X1 = [1, 3, 5];

A2 = [0.2, 0.4];
X2 = [2, 4];

% Define the function f as per the given example
f = @(x1, x2) x1 + x2;

% Initialize B as an empty set
B = [];
minuA1uA2 = [];
uB = [];

% Apply the extension principle to derive B
for i = 1:length(A1)
    for j = 1:length(A2)
        y = f(X1(i), X2(j)); % Compute the function output
        mu = min(A1(i), A2(j)); % Compute the membership value
        minuA1uA2(end+1) = mu;
        B = [B; [y mu]]; % Append the result to B
    end
end

minuA1uA2

% Since multiple pairs can map to the same y, we need to combine the membership values
Y = unique(B(:,1));
B_fuzzy = zeros(length(Y), 1);

for i = 1:length(Y)
    B_fuzzy(i) = max(B(B(:,1) == Y(i), 2)); % Take the maximum membership value for each unique y
end

% Display the result
B_result = [B_fuzzy,Y];
B_str = string(B_fuzzy) + "/" + string(Y)
