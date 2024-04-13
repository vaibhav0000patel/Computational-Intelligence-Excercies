clc;clear;

% Define the fuzzy sets A1 and A2
A1 = [0.3, 0.4, 0.9];
A2 = [0.3, 0.4, 0.9, 0.3];

% Define the universes of discourse for X1, X2, and Y
X1 = [1, 2, 3];
X2 = [3, 4, 5, 6];
Y = [4 5 6 7 8 9];


% Initialize the fuzzy set B with zeros
B = zeros(1, length(Y));

YSum = [];
minimum_mu = [];

% Apply the extension principle
for i = 1:length(X1)
    for j = 1:length(X2)
        y = X1(i) + X2(j);  % Compute the function f(x1, x2) = x1 + x2
        YSum(end+1) = y;
        membership_degree = min(A1(i), A2(j));  % Find the minimum membership degree
        minimum_mu(end+1) = membership_degree;
        index = find(Y == y);  % Find the index of y in Y
        if ~isempty(index)
            B(index) = max(B(index), membership_degree);  % Update the membership degree of y in B
        end
    end
end



% Display the fuzzy set B
disp('Fuzzy set B=f(A1,A2):');
summ = 0;
for i = 1:length(Y)
    fprintf('%g/%d ', B(i), Y(i));
    summ = summ + B(i);
end
fprintf('\n');

disp("Y");
disp(YSum);

disp("Minimum Mu");
disp(minimum_mu);

disp("uBy");
disp(B);

disp(summ);
