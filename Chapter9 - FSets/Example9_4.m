clc;clear;

%'Example 9.4 (Linguistic meaning of fuzzy set)
% Given the term set {A,B,C} of the linguistic variable “true” in a
% discrete universe of discourse X = {0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0} such that
% A= “true” = 0.7/0.8 + 1.0/0.9 + 1.0/1.0,
% B =“more or less true” = 0.5/0.6 + 0.7/0.7 + 1.0/0.8 +1.0/0.9+1.0/1.0,
% C = “almost true” = 0.9/0.7 + 1.0/0.9 + 0.6/1.0.
% Determine the approximated linguistic meaning of the 
% fuzzy set D given by D = 0.6/0.8 + 1.0/0.9 + 1.0/1.0.'


% Define the universe of discourse
X = [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7 0.8 0.9 1.0];

% Define the fuzzy sets
A = [0 0 0.7 1.0 1.0];  % true
B = [0.5 0.7 1.0 1.0 1.0];  % more or less true
C = [0 0.9 0 1.0 0.6];  % almost true
D = [0 0 0.6 1.0 1.0];  % Given fuzzy set

% Function to calculate Jaccard index
function jaccardIndex = jaccard(fuzzySet1, fuzzySet2)
    intersection = min(fuzzySet1, fuzzySet2);
    unionSet = max(fuzzySet1, fuzzySet2);
    jaccardIndex = sum(intersection) / sum(unionSet);
end

% Calculate the similarity of D with A, B, and C
similarity_A = jaccard(D, A);
similarity_B = jaccard(D, B);
similarity_C = jaccard(D, C);

% Display the similarities
fprintf('Similarity of D with A: %f\n', similarity_A);
fprintf('Similarity of D with B: %f\n', similarity_B);
fprintf('Similarity of D with C: %f\n', similarity_C);

% Determine the closest linguistic meaning
[~, idx] = max([similarity_A, similarity_B, similarity_C]);
linguisticMeanings = {'true', 'more or less true', 'almost true'};
fprintf('D is most similar to: %s\n', linguisticMeanings{idx});
