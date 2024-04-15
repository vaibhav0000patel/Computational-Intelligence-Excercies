% Example 13.2 (Crossover two parents to generate two children)
% Given two selected parents A (1011010010) and B (0111100001), use the crossover operator with a crossover probability pc of 1.0 to generate two new children.

% Define the parent chromosomes.
parentA = '1011010010';
parentB = '0111100001';

% Define the crossover point (after the 4th bit)
crossoverPoint = 4;

% Perform the crossover to generate the children.
[childA, childB] = crossover(parentA, parentB, crossoverPoint);

% Display the children.
disp(['Child A: ', childA]);
disp(['Child B: ', childB]);


function [childA, childB] = crossover(parentA, parentB, crossoverPoint)
    % This function takes in two binary strings (parentA and parentB) and a crossover point.
    % It returns two new binary strings (childA and childB) created by crossing over the parents at the specified point.

    % Ensure the parents are represented as character arrays if they are not already
    parentA = char(parentA);
    parentB = char(parentB);

    % Perform crossover operation
    childA = [parentA(1:crossoverPoint), parentB(crossoverPoint+1:end)];
    childB = [parentB(1:crossoverPoint), parentA(crossoverPoint+1:end)];
end