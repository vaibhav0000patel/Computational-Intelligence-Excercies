% Define ymax
ymax = 10;

% For Q2a
uB1 = 0.3; uB2 = 0.5; uB3 = 0.3; uB4 = 0.5;




w1 = uB1; w2 = uB2; w3 = uB3; w4 = uB4;

% Calculate outputs for each rule in Q2a
y1 = min(ymax, max(3 * uB1, 0));
y2 = min(ymax, max(3 * (1 - uB2) + 2, 0));
y3 = min(ymax, max(2 * uB3 + 5, 0));
y4 = min(ymax, max(2 * (1 - uB4) + 8, 0));

% Sum of the four outputs
sum_outputs = y1 + y2 + y3 + y4;






% For Q2b
uB1 = 0.2; uB2 = 0.5; uB3 = 0.2; uB4 = 0.7;





w1 = uB1; w2 = uB2; w3 = uB3; w4 = uB4;

% Recalculate the outputs based on new firing strengths
y1_new = min(ymax, max(3 * uB1, 0));
y2_new = min(ymax, max(3 * (1 - uB2) + 2, 0));
y3_new = min(ymax, max(2 * uB3 + 5, 0));
y4_new = min(ymax, max(2 * (1 - uB4) + 8, 0));

% Calculate the defuzzified output using weighted average
defuzzified_output = (w1 * y1_new + w2 * y2_new + w3 * y3_new + w4 * y4_new) / (w1 + w2 + w3 + w4);

% Display results
fprintf('Sum of outputs for Q2a: %.4f\n', sum_outputs);
fprintf('Defuzzified output for Q2b: %.4f\n', defuzzified_output);
