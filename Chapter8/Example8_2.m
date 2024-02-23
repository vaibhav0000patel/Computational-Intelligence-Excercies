clear;clc;
% (XOR problem solved by interpolation RBF network)

% In this example, we design an interpolation RBF network to map the four input-output pattern-pairs of the XOR problem.

% Using the Gaussian function as the nonlinear basis function, an exact solution is considered using an RBF network with four hidden units, with each radial basis function center set to one of the input patterns.

X = [ 0 0; 0 1; 1 0; 1 1];
T = X;

% (a) Constructing the interpolation matrix fi for the resulting network to compute the inverse matrix of fi^-1; and then

fi = zeros(4, 4);

for i = 1:4
    for j = 1:4
        fi(i,j)=gkp(X(i,:),T(j,:));
    end
end

disp(fi);


% (b) Calculating the linear weights 𝐖 for the output layer of the network.

disp(inv(fi));
D = [0 1 1 0]';
W = inv(fi)* D

% It can be verified that the obtained 𝐖 can recall 𝐃 correctly from 𝐃 = fi * 𝐖
% Ill-conditioning matrix: The numerical conditioning of an approximation matrix is defined as the ratio of the largest eigenvalue to the smallest eigenvalue of the matrix. If the value of the ratio increases, the degree of ill-conditioning increases.

function g=gkp(X,T)
    g = exp(-norm(X - T)^2);
end
