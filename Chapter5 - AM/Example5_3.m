clear;
clc;

% Define the bipolar representations of the sequences
% Each letter is represented by a 6x9 matrix of ±1
% For simplicity, we'll use random matrices here
RING = 2 * randi([0, 1], 6, 9) - 1
WEAK = 2 * randi([0, 1], 6, 9) - 1
BOLD = 2 * randi([0, 1], 6, 9) - 1
THIN = 2 * randi([0, 1], 6, 9) - 1

% Training for ABAM (store only RING and WEAK)
ABAM_matrix = [RING; WEAK]' * [RING; WEAK]

% Training for CBAM (store all four sequences)
CBAM_matrix = [RING; WEAK; BOLD; THIN]' * [RING; WEAK; BOLD; THIN]

% Training for RUAM (store all four sequences)
% For simplicity, we'll use a single recurrent matrix for all sequences
RUAM_matrix = [RING; WEAK; BOLD; THIN]' * [RING; WEAK; BOLD; THIN] % Simplified

% Example recall (using partial/noisy sequences as input)
partial_sequence = RING; % Assume this is a partial or noisy version of RING
recalled_sequence_ABAM = recall_ABAM_CBAM(ABAM_matrix, partial_sequence);
recalled_sequence_CBAM = recall_ABAM_CBAM(CBAM_matrix, partial_sequence);
recalled_sequence_RUAM = recall_RUAM(RUAM_matrix, partial_sequence, 5); % 5 iterations

% Compare performances (this is a simple example, you can expand it)
disp('Recalled sequence by ABAM:');
disp(recalled_sequence_ABAM);
disp('Recalled sequence by CBAM:');
disp(recalled_sequence_CBAM);
disp('Recalled sequence by RUAM:');
disp(recalled_sequence_RUAM);



% Recall function for ABAM and CBAM
function recalled_sequence = recall_ABAM_CBAM(memory_matrix, input_sequence)
    recalled_sequence = sign(input_sequence * memory_matrix);
end

% Recall function for RUAM
function recalled_sequence = recall_RUAM(memory_matrix, input_sequence, iterations)
    recalled_sequence = input_sequence;
    for i = 1:iterations
        recalled_sequence = sign(recalled_sequence * memory_matrix);
    end
end