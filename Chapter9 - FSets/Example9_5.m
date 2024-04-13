clc;clear;
% Example 9.5 (Fuzzy set construction by extension principle)
% Given X = {0.25, 0.50, 0.75, 1.00, 1.25, 1.50, 1.75} 
% a fuzzy set A = small = 1/0.25 + 0.9/0.50 + 0.7/0.75
% a fuzzy set B = small^2 can be constructed by the extension principle through the function y = x^2 as 
% B = small^2 = 1/0.0625 + 0.9/0.2500 + 0.7/0.5625



% Define the original set X and fuzzy set A
X = [0.25, 0.50, 0.75, 1.00, 1.25, 1.50, 1.75];
A_membership = [1, 0.9, 0.7, 0, 0, 0, 0];  % Membership values for set A

% Define the function for transformation
transform = @(x) x^2;

% Applying the function to set X to construct set B
B = arrayfun(transform, X);

% As the values in B might not exactly match any values in X, 
% we need to map the original membership values to the new values.
B_membership = zeros(size(B));

% Mapping membership values from A to new values in B
% It is important to recognize that this step may require interpolation or
% exact matching depending on the application. For simplicity, this example
% uses exact matching.
for i = 1:length(X)
    % Find the index in B where X(i)^2 has occurred
    index = find(B == transform(X(i)));
    if ~isempty(index)
        B_membership(index) = A_membership(i);
    end
end

% Remove elements with zero membership
B(B_membership == 0) = [];
B_membership(B_membership == 0) = [];

% Display the results
disp('Set B (small^2):');
disp('Membership values:');
disp(B_membership);
disp('Values:');
disp(B);

