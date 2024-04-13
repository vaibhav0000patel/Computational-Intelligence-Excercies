clc;clear;
% Example 10.1 (Compute the binary fuzzy relation matrix)
% Let R(X,Y) = “x is close to y” and X = Y = R+, the membership
% function of the fuzzy relation R(X,Y) is defined as
% µR(x, y) = e^(−|y−x|)
% Given X = {1, 2, 3, 4} and Y = {1, 2, 3, 4, 5, 6}, compute the binary
% fuzzy relation matrix R = R(X,Y) = {[(x, y), µR(x, y)] | (x, y) ∈ X x Y}.


% Define the sets X and Y
X = [1, 2, 3, 4];
Y = [1, 2, 3, 4, 5, 6];

% Initialize the fuzzy relation matrix R
R = zeros(length(X), length(Y));

% Calculate the fuzzy relation matrix R
for i = 1:length(X)
    for j = 1:length(Y)
        R(i,j) = exp(-abs(Y(j) - X(i)));
    end
end

% Display the fuzzy relation matrix R
disp('The binary fuzzy relation matrix R is:');
disp(R);

