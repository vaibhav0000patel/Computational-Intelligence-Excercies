clear; clc;

% Consider a sequence of temporal patterns X1, X2, X3, X1 given below are to be stored in a TAM,

X1 = [ 1 -1 1 -1  1 -1  1 -1 ];
X2 = [ 1 1 -1 -1  1  1 -1 -1 ];
X3 = [ 1 1  1  1 -1 -1 -1 -1 ];

% (a) Determine the memory matrix 𝐖 of the TAM.
    
    W = X1'*X2 + X2'*X3 + X3'*X1

% (b) Check the correctness of forward recalls and backward recalls.
    
    % Forward recalls:
    x2 = Gh(X1,W)
    x3 = Gh(X2,W)
    x1 = Gh(X3,W)

    % Backward recalls:
    x3 = Gh(X1,W')
    x1 = Gh(X2,W')
    x2 = Gh(X3,W')

% (c) Check the correctness of complementary forward recalls 
    % and complementary backward recalls.
    
    % Complementary forward recalls:
    x2c = Gh(-X1,W)
    x3c = Gh(-X2,W)
    x1c = Gh(-X3,W)

    % Complementary backward recalls:
    x3c = Gh(-X1,W')
    x1c = Gh(-X2,W')
    x2c = Gh(-X3,W')

% (d) Given the following noisy vector as Xt = [ 1 1 –1 –1 1 –1 –1 –1 ], 
    % identify the original vector of Xt by performing forward and backward recalls.
    
    Xt = [ 1 1 -1 -1 1 -1 -1 -1 ];

    % Forward recall:
    xt3 = Gh(Xt,W)

    % Backward recall:
    xt1 = Gh(Xt,W')

% Hence, 𝐗t is a corrupted version of 𝐗2.

function gh = Gh(X,W)
    gh = sign(X*W);
    gh(gh == 0 ) = 1;
end