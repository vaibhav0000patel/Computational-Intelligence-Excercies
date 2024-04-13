% Example 19.2 (Numbers of weights in a convolutional layer)

% Inout Image
M = 32;
N = 32;
nC = 3;

% Number of filters
nF = 8;

% Filter Size
F1 = 5;
F2 = 5;

% Dilation Factor
D = 1;

% Stride
S = 2;

% Padding
P = 2;




% Number of filter weights per filter
W = F1 * F2 * nC + 1

% Total number of filter weights for all filters
nW = W * nF

% Size of each feature map
Mc = ((M - ((F1 - 1) * D + 1) + 2 * P)/S) + 1

% Number of neurons
nN = floor(Mc)*floor(Mc)

% Number of neurons due to 8 filters
tnN = nN * nF