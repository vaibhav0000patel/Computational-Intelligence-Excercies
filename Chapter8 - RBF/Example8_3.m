clear;clc;
% (XOR problem solved by generalized RBF network)

% In this example, we shall illustrate the design procedures of the generalized RBF network for the XOR problem using one bias and two RBF centers instead of four RBF centers as required in the interpolation RBF network of Example 8.2

% The input-output pattern-pairs of the XOR problem are shown in the Table below. Using the Gaussian function consisting of squared 𝑙2-norm operator as the nonlinear function, a pair of Gaussian functions is defined as

k = 4;
p = 2;
X = [ 1 1; 0 1; 0 0; 1 0];
D = [ 0 1 0 1 ];
T = [ 1 1; 0 0 ];

G = zeros(k, p);

for i = 1:k
    for j = 1:p
        G(i,j)=gkp(X(i,:),T(j,:));
    end
end

disp(G);

H = [[1 1 1 1]' G];

H_plus = (H'*H)^-1*H'

Wc = H_plus*D'

Y = H * Wc

% From the results, it can be observed that the two sets of output weights are equal. This is due to the symmetry of the problem which results having the output unit uses weight sharing, hence there is only a single weight 𝑤 to determine.

function g=gkp(X,T)
    g = exp(-norm(X - T)^2);
end
