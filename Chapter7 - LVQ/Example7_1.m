clear;clc;
% A learning vector quantization network is used to cluster 4 vectors into 2 classes
% Assuming 𝐗1 and 𝐗2 are selected as the initial weights of two different clusters as shown in Table E7.1.2; and the updated weights are used immediately for each input vector presentation.

% Clustering vectors using LVQ.
k = 1:4;
X1 = [ 1 0 0 0 ];
X2 = [ 0 1 0 0 ];
X3 = [ 0 0 1 0 ];
X4 = [ 0 0 0 1 ];

global T;
T = [1 1 2 2 ];

% Initial weights for LVQ.
j = 1:2;
z

global C;
C = [1 2];

% (a) With g(1) = 0.5, g(t+1) = 0.5 g(t) show the step-by-step calculations up to the end of iteration 2.

% Iteration 1

g_1 = 0.5;
W1 = w1;
W2 = w2;
[W1,W2] = iteration(1,X1,W1,W2,g_1);
[W1,W2] = iteration(2,X2,W1,W2,g_1);
[W1,W2] = iteration(3,X3,W1,W2,g_1);
[W1,W2] = iteration(4,X4,W1,W2,g_1);

% Iteration 2
g_2 = 0.5*g_1;
[W1,W2] = iteration(1,X1,W1,W2,g_2);
[W1,W2] = iteration(2,X2,W1,W2,g_2);
[W1,W2] = iteration(3,X3,W1,W2,g_2);
[W1,W2] = iteration(4,X4,W1,W2,g_2)


% (b) With g(1) = 0.5, g(t+1) = 0.99 * g(t) write a Matlab program to compute the weight vectors and 

g_ = 0.5;
W1 = w1;
W2 = w2;
for i = 1:100
    [W1,W2] = iteration(1,X1,W1,W2,g_);
    [W1,W2] = iteration(2,X2,W1,W2,g_);
    [W1,W2] = iteration(3,X3,W1,W2,g_);
    [W1,W2] = iteration(4,X4,W1,W2,g_);
    g_ = 0.99*g_;
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
