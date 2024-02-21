clear; clc;
%  A BAM is to be used to store the following 2 pattern pairs given by

X1 = [1 1 1 1 1 1 1 1];
Y1 = [1 -1 1 -1 1 -1];
X2 = [1 1 1 1 -1 -1 -1 -1];
Y2 = [1 1 -1 -1 1 1];

% (a) Determine the weight matrix 𝐖 of the BAM.
    W = X1'*Y1 + X2'*Y2

% (b) Check the correctness of recalls of the original pattern pairs.

    % Forward recalls:
    y1 = Gh(X1, W)
    y2 = Gh(X2, W)
    
    % Backward recalls:
    x1 = Gh(Y1, W')
    x2 = Gh(Y2, W')

% (c) Check the correctness of recalls of the complementary pattern pairs.

    % Forward recalls:
    y1c = Gh(-X1, W)
    y2c = Gh(-X2, W)
    
    % Backward recalls:
    x1c = Gh(-Y1, W')
    x2c = Gh(-Y2, W')

% (d) Determine the steady-state recall pattern pair of the following noisy vector
Xt = [1 1 -1 -1 1 1 1 1];

    Yt = Gh(Xt, W)
    xt = Gh(Yt, W')

function gh = Gh(X,W)
    gh = sign(X*W);
    gh(gh == 0 ) = 1;
end