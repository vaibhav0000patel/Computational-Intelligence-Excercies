% Example 13.4 (Order, length and mutation immunity of schema)
% Consider the following schemas consisting of 12 bits: (i) ***1*01***0*; (ii) ***1****01**; (iii) *1****1*****; (iv) 00**1*0**1**; (v) *010**110*10.
% (a) What are the order and length of each of the schemas?
% (b) Estimate the probability of surviving mutation for each schema if the probability of mutation pm is 0.1 at a single bit position.

% Define schemas and mutation probability
schemas = {'***1*01***0*', '***1****01**', '*1****1*****', '00**1*0**1**', '*010**110*10'};
pm = 0.1;

% Call the function
[orders, lengths, survival_probs] = schema_properties(schemas, pm);

% Display the results
disp('Orders:');
disp(orders);
disp('Lengths:');
disp(lengths);
disp('Survival Probabilities:');
disp(survival_probs);


function [orders, lengths, survival_probs] = schema_properties(schemas, pm)
    % This function calculates the order, length, and survival probability
    % of each schema in a cell array of schema strings.
    % schemas: cell array of schema strings
    % pm: probability of mutation per bit

    n = numel(schemas);  % Number of schemas
    orders = zeros(1, n);
    lengths = zeros(1, n);
    survival_probs = zeros(1, n);

    for i = 1:n
        schema = schemas{i};
        fixed_indices = find(schema ~= '*');  % Find indices of fixed bits
        
        % Calculate order
        orders(i) = numel(fixed_indices);
        
        % Calculate length
        if isempty(fixed_indices)
            lengths(i) = 0;  % No fixed bits means length is 0
        else
            lengths(i) = fixed_indices(end) - fixed_indices(1) + 1;
        end
        
        % Calculate survival probability
        survival_probs(i) = (1 - pm) ^ orders(i);
    end
end