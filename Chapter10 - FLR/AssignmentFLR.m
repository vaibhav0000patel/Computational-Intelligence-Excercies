clc;clear;

% Question 1

% Rule 1: Trapezoidal MF parameters
A1 = [0,2,4,6];
% Rule 2: Triangular MF parameters
A2 = [4,6,8];
% Rule 3: Trapezoidal MF parameters (assuming the "+2" is the increment for d3)
A3 = [6,8,10.9,10.9 + 2];




% Discrete range for integration
Y = -1000:1:1000;

[Centroid1,Area1] = calculate(Y,A1)
[Centroid2,Area2] = calculate(Y,A2)
[Centroid3,Area3] = calculate(Y,A3)

% Sum of centroids
SumCentroids = Centroid1 + Centroid2 + Centroid3;

fprintf('Sum of centroids: %.4f\n', SumCentroids);






% Question 2

% Output weights for each rule
w1 = 0.7; w2 = 0.1; w3 = 0.9;

% Calculate centroids for each rule's membership function
A3New = [6, 8, 10, 12];





[Centroid3,Area3_new] = calculate(Y,A3New)

% Calculate defuzzified output using the weighted average of centroids
DefuzzifiedOutput = (w1 * Centroid1 * Area1 + w2 * Centroid2 *Area2 + w3 * Centroid3 * Area3_new)/(w1*Area1 + w2*Area2 + w3*Area3_new);

fprintf('Defuzzified output: %.4f\n', DefuzzifiedOutput);









% Rule 3: Calculate area and centroid
function [Centroid,Area] = calculate(Y,A)
    if (length(A)==4)
        mu = TrapMF(Y, A(1), A(2), A(3), A(4));
        Area = trapz(Y, mu);
        Centroid = TrapCentroid(A(1), A(2), A(3), A(4));
    elseif (length(A)==3)
        mu = TriMF(Y, A(1), A(2), A(3));
        Area = trapz(Y, mu);
        Centroid = TriCentroid(A(1), A(2), A(3));
    end
end

% Define the function for Trapezoidal Membership Function
function mu = TrapCentroid(a, b, c, d)
    mu = (a+b+c+d)/4;
end

% Define the function for Triangular Membership Function
function mu = TriCentroid(a, b, c)
    mu = (a+b+c)/3;
end

% Define the function for Trapezoidal Membership Function
function mu = TrapMF(y, a, b, c, d)
    mu = max(min(min((y-a)/(b-a), (d-y)/(d-c)), 1), 0);
end

% Define the function for Triangular Membership Function
function mu = TriMF(y, a, b, c)
    mu = max(min((y-a)/(b-a), (c-y)/(c-b)), 0);
end
