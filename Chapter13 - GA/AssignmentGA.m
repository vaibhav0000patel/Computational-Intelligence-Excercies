clc;clear;
% Question 1

% Initial population vector
pop = [1.00, 2.00, 3.85, 7.25-3.85, 5.50, 6.50];

% Roulette Wheel copies for the next generation
copies = [1, 1, 2, 1, 1, 0]; 

% Define the quadratic equation e(x) = x^2 - 7*x + 12.25
e = @(x) x.^2 - 7*x + 12.25;

% Define the fitness function f(x) = 1 / (e(x) + 0.001)
f = @(x) 1 ./ (e(x) + 0.001);






% Calculate the fitness values for the initial population
fitness_values = f(pop);

% New population after reproduction
new_pop = [];
for i = 1:length(copies)
    for j = 1:copies(i)
        new_pop(end+1) = pop(i);
    end
end

% Calculate the fitness of the new population
new_fitness_values = f(new_pop);

% Calculate the average fitness of the new population
average_fitness = mean(new_fitness_values);

% Display the average fitness rounded to 4 decimal places
disp(['Average fitness after reproduction: ', num2str(average_fitness, '%.4f')]);






% Question 2

% Population vector after crossover
pop = [0.125, 2.875, 2.5, 4.876, 4.876, 6.125];

% Mutation sites (bit positions to mutate)
mutationSites = [
                -1,-1,-1;
                -1,5,-1;
                -1,6,1;
                -1,-1,-1;
                -1,-1,-1;
                -1,-1,-1
             ];

% Define the quadratic equation e(x) = x^2 - 7*x + 12.25
e = @(x) x.^2 - 7*x + 12.25;

% Define the fitness function f(x) = 1 / (e(x) + 0.001)
f = @(x) 1 ./ (e(x) + 0.001);




% Convert each individual to binary, mutate, and then convert back to decimal
mutatedPop = zeros(size(pop));


for i = 1:length(pop)
    
    % Convert the decimal number to binary
    binaryString = decimalToBinary7Bit(pop(i));
    
    % Mutate the specified bit for the current decimal number
    mutatedBinaryString = binaryString;
    for j = 1:length(mutationSites(i,:))
        if (mutationSites(i,j) >= 0)
            mutatedBinaryString = mutateBinaryString(mutatedBinaryString, mutationSites(i,j));
        end
    end
    % Convert the mutated binary back to decimal
    mutatedPop(i) = binaryToDecimal7Bit(mutatedBinaryString);
end

% Compute the fitness values for the mutated population

fitnessValues = f(mutatedPop);

% Calculate the average fitness value
averageFitness = mean(fitnessValues);

% Display the average fitness value
disp(['The average fitness value of the mutated population is: ', num2str(averageFitness)]);

% Convert decimal number to 7-bit binary representation
function binaryString = decimalToBinary7Bit(decimalNumber)
    % Convert the integer part to binary
    integerPart = floor(decimalNumber);
    binaryIntegerPart = dec2bin(integerPart, 3);
    % Convert the fractional part to binary
    fractionalPart = decimalNumber - integerPart;
    binaryFractionalPart = '';
    for i = 1:4
        fractionalPart = fractionalPart * 2;
        if fractionalPart >= 1
            binaryFractionalPart = strcat(binaryFractionalPart, '1');
            fractionalPart = fractionalPart - 1;
        else
            binaryFractionalPart = strcat(binaryFractionalPart, '0');
        end
    end
    % Combine both parts
    binaryString = strcat(binaryIntegerPart, binaryFractionalPart);
end

% Mutate specified bit of a binary string
function mutatedBinaryString = mutateBinaryString(binaryString, mutationPosition)
    if binaryString(mutationPosition) == '1'
        mutatedBinaryString = [binaryString(1:mutationPosition-1), '0', binaryString(mutationPosition+1:end)];
    else
        mutatedBinaryString = [binaryString(1:mutationPosition-1), '1', binaryString(mutationPosition+1:end)];
    end
end
% Convert 7-bit binary representation to decimal number
function decimalNumber = binaryToDecimal7Bit(binaryString)
    % Split the binary string into the integer and fractional parts
    binaryIntegerPart = binaryString(1:3);
    binaryFractionalPart = binaryString(4:7);
    % Convert the integer part to decimal
    integerPart = bin2dec(binaryIntegerPart);
    % Convert the fractional part to decimal
    fractionalPart = 0;
    for i = 1:length(binaryFractionalPart)
        fractionalPart = fractionalPart + str2double(binaryFractionalPart(i)) * 2^(-i);
    end
    % Combine both parts
    decimalNumber = integerPart + fractionalPart;
end