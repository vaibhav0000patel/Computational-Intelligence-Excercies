clc; clear;
% Example 10.3 (Linguistic variables and interpretations)
% Let the discrete universe of discourse of X, Y = {1, 2, 3, 4, 5} and the term set {A, B, C} of the linguistic variable “large”. Given the facts that
% A = “large” = 0.1/1 + 0.2/2 + 0.6/3 + 0.8/4 + 0.9/5
% and a fuzzy relation
% R(X, Y) = X and Y are “more or less the same” as
% R(X, Y) = 1/(1,1) + 1/(2,2) + 1/(3,3) + 1/(4,4) + 1/(5,5) + 0.7/(1,2) + 0.7/(2,3) + 0.7/(3,4) + 0.7/(4,5) + 0.7/(2,1) + 0.7/(3,2) + 0.7/(4,3) + 0.7/(5,4) such that
% R(X, Y) =  | 1   0.7   0.0   0.0   0.0 |
%            | 0.7   1   0.7   0.0   0.0 |
%            | 0.0   0.7   1   0.7   0.0 |
%            | 0.0   0.0   0.7   1   0.7 |
%            | 0.0   0.0   0.0   0.7  1  |
% (a) Derive the fuzzy set B = “very large” and the fuzzy set C = “more or less large”.
% (b) Derive the conclusion A ⊙ R using
% (i) Max-min composition rule of inference;
% (ii) Max-product composition rule of inference;
% (ii) Interpret the linguistic meaning of each derived conclusion.

% Definition of the fuzzy set A
A = [0.1, 0.2, 0.6, 0.8, 0.9];

% Definition of the fuzzy relation R
R = [
    1   0.7  0   0   0;
    0.7 1   0.7 0   0;
    0   0.7 1   0.7 0;
    0   0   0.7 1   0.7;
    0   0   0   0.7 1
];

% Derivation of fuzzy set B ("very large")
B = A.^2;

% Derivation of fuzzy set C ("more or less large")
C = sqrt(A);

% Max-min composition A ⊙ R
n = length(A);
A_composed_max_min = zeros(1, n);
for y = 1:n
    for x = 1:n
        A_composed_max_min(y) = max(A_composed_max_min(y), min(A(x), R(x, y)));
    end
end

% Max-product composition A ⊙ R
A_composed_max_product = zeros(1, n);
for y = 1:n
    for x = 1:n
        A_composed_max_product(y) = max(A_composed_max_product(y), A(x) * R(x, y));
    end
end

% Display results
fprintf('Fuzzy set B ("very large"): %s\n', mat2str(B));
fprintf('Fuzzy set C ("more or less large"): %s\n', mat2str(C));
fprintf('A composed with R using max-min: %s\n', mat2str(A_composed_max_min));
fprintf('A composed with R using max-product: %s\n', mat2str(A_composed_max_product));
