clc;clear;
% Example 13.1 (Roulette wheel reproduction of next population)
% Given a population of six chromosomes with the fitness values specified by 30, 25, 20, 15, 7, and 3. Six random numbers 53, 9, 64, 96, 28, and 82 are generated. Using the roulette wheel reproduction method, determine the chromosomes of the next population (or generation).



% Fitness values of the chromosomes
fitness = [30, 25, 20, 15, 7, 3];

% Random numbers generated
random_numbers = [53, 9, 64, 96, 28, 82];

% Total fitness
total_fitness = sum(fitness);

% Cumulative probability of each chromosome
cumulative_prob = cumsum(fitness) / total_fitness;

% Next generation's chromosomes
next_generation = zeros(1, length(random_numbers));

% Determine chromosomes of the next population using roulette wheel
for i = 1:length(random_numbers)
    rnd = random_numbers(i) / 100; % Scale random number to [0, 1]
    % Find the first chromosome where the cumulative probability exceeds the random number
    for j = 1:length(cumulative_prob)
        if rnd <= cumulative_prob(j)
            next_generation(i) = j;
            break;
        end
    end
end

% Display the selected chromosomes for the next generation
disp('Chromosomes selected for the next generation:');
disp(next_generation);
