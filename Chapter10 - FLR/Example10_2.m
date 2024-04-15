clc; clear;
% Example 10.2 (Choice between programs using fuzzy relation matrices)

% Two high-school students, Student 1 and Student 2, who have different
% interests for subjects Languages, Mathematics, and Sciences are
% required to choose one of the following two degree programs, Business
% or Engineering. Let

% X = {x1, x2} = {Student 1, Student 2},
% Y = {y1, y2, y3} = {Languages, Mathematics, Sciences},
% Z = {z1, z2} = {Business, Engineering},

% the “students to subjects” are represented by the fuzzy relation R, (X,Y),
% and the “subjects to programs” are represented by the fuzzy relation
% R2(Y,Z).

% Assume that R,(X,Y) and R2(Y,Z) can be expressed as the
% following fuzzy relation matrices

% Define the matrices R1 and R2

R1 = [0.9 0.7 0.5; 0.6 0.8 0.9];
R2 = [1.0 0.6; 0.6 0.8; 0.3 1.0];

% Initialize the result matrix for max-min composition
R1_R2_max_min = zeros(2,2);

% Perform max-min composition
for i = 1:size(R1, 1)
    for j = 1:size(R2, 2)
        min_values = min(R1(i, :)', R2(:, j));
        R1_R2_max_min(i, j) = max(min_values);
    end
end

disp('Max-min Composition R1°R2:');
disp(R1_R2_max_min);


% Initialize the result matrix for max-product composition
R1_R2_max_product = zeros(2,2);

% Perform max-product composition
for i = 1:size(R1, 1)
    for j = 1:size(R2, 2)
        product_values = R1(i, :)' .* R2(:, j);
        R1_R2_max_product(i, j) = max(product_values);
    end
end

disp('Max-product Composition R1°R2:');
disp(R1_R2_max_product);


% Initialize the result matrix for max-average composition
R1_R2_max_average = zeros(2,2);

% Perform max-average composition
for i = 1:size(R1, 1)
    for j = 1:size(R2, 2)
        average_values = (R1(i, :)' + R2(:, j)) / 2;
        R1_R2_max_average(i, j) = max(average_values);
    end
end

disp('Max-average Composition R1°R2:');
disp(R1_R2_max_average);
