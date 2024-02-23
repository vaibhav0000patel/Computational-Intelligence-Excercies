clear;
clc;
% (Generalized RBF network design for input to output mapping) Matlab

% Assuming that the Gaussian function consisting of squared 𝑙2-norm operator are used as the nonlinear function defined by

k = 4;
p = 2;
T = [0.4979, 0.5021, 0, 0; 0, 0, 0.4979, 0.5021];
X = [1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1];
D = [1,1,0,0];

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

% From the results, it can be observed that the recalled outputs are correct and closed to the desired outputs.
% Due to the symmetry of the problem, the output unit uses weight sharing, hence there is only one single weight 𝑤1 = 1.3041 to determine (differs from 𝑤2 = -1.3041 by the sign).
% The output unit includes a nonzero bias 𝑤0 = 0.5 because the output values of the mapping problem have a nonzero mean of 0.5.

function g=gkp(X,T)
    g = exp(-norm(X - T)^2);
end
