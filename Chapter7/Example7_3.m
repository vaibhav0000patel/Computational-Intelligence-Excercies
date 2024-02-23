clear;clc;
% (XOR problem cannot be learnt by LVQ classifier) Matlab

% A learning vector quantization network with a structure of 2 inputs with 2 output classes “0” and “1” is given.

% Consider the XOR problem, assume 𝐗1 and 𝐗2 are chosen as the two initial weight vectors; the latest weight vectors are used within an iteration; the learning rate 𝑔(1) = 0.5 and 𝑔(t+1) = 0.5 𝑔(t):

global C;
C = [1 2];

w1 = [ 1, 1 ];
w2 = [ 0, 1 ];

X1 = [ 1, 1 ];
X2 = [ 0, 1 ];
X3 = [ 0, 0 ];
X4 = [ 1, 0 ];

global T;
T = [ 1 2 1 2 ];

% (a) Show the step-by-step calculations to obtain the weights of the LVQ.

    W1 = w1;
    W2 = w2;
    
    % Since 𝐗1 and 𝐗1 have been chosen as the initial weight vectors, these two vectors are not required to be presented at Iteration 1
    
    % Iteration 1
    g_1 = 0.5;
    [W1,W2] = iteration(3,X3,W1,W2,g_1);
    [W1,W2] = iteration(4,X4,W1,W2,g_1);
    
    % Iteration 2
    g_2 = g_1*0.5;
    [W1,W2] = iteration(1,X1,W1,W2,g_2);
    [W1,W2] = iteration(2,X2,W1,W2,g_2);
    [W1,W2] = iteration(3,X3,W1,W2,g_2);
    [W1,W2] = iteration(4,X4,W1,W2,g_2);

    % Iteration 3
    g_3 = g_2*0.5;
    [W1,W2] = iteration(1,X1,W1,W2,g_3);
    [W1,W2] = iteration(2,X2,W1,W2,g_3);
    [W1,W2] = iteration(3,X3,W1,W2,g_3);
    [W1,W2] = iteration(4,X4,W1,W2,g_3)

% (b) After learning, verify the classification correctness of the LVQ and tabulate them i
    
    g_ = 0.5;
    W1 = w1;
    W2 = w2;
    for i = 1:100
        [W1,W2] = iteration(1,X1,W1,W2,g_);
        [W1,W2] = iteration(2,X2,W1,W2,g_);
        [W1,W2] = iteration(3,X3,W1,W2,g_);
        [W1,W2] = iteration(4,X4,W1,W2,g_);
        g_ = 0.5*g_;
    end
    disp("After 100 iterations W1 and W2 :");
    disp(W1);
    disp(W2);

    % verify the recall correctness at the outputs after 100 iterations.

    Y1 = [X1*W1', X1*W2']
    Y2 = [X2*W1', X2*W2']
    Y3 = [X3*W1', X3*W2']
    Y4 = [X4*W1', X4*W2']

function [W1,W2] = iteration(i,X,W1,W2,g)
    d1 = squared_euclidean_distance(X, W1);
    d2 = squared_euclidean_distance(X, W2);
    D = [d1 d2];
    if d1 == min(D)
        W1 = update_weight(i, 1, X, W1, g);
    end
    if d2 == min(D)
        W2 = update_weight(i, 2, X, W2, g);
    end
end

function distance = squared_euclidean_distance(X, W)
    difference = X - W;
    squared_difference = difference .^ 2;
    distance = sum(squared_difference);
end

function w = update_weight(i, j, X, W, g)
    global T C;
    if T(i)~=C(j)
        g = -g;
    end
    w = W + g * (X - W);
end
