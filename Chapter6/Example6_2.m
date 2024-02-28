clear;
clc;
alpha = 7; 
N = 11;
s = 50;    % threshold
a = 2;     % width  2a + 1 = 5 EXITARY
b = 0.06;  % height
M = 3 + a; % inhibitary region width
c = -0.04;  % height internal

y0=0.0000; y1=0.1682; y2=0.3455; y3=0.6545; y4=0.9045; y5=1.0434; y6 =0.9045; y7=0.6545;   y8=0.3455;   y9=0.1682;   y10 =0.0000; 

Y = [y0 y1 y2 y3 y4 y5 y6 y7 y8 y9 y10];

f = [c c c b b b b b c c c];
%------------------------

nZero = (N-1)/2;
y = [zeros(nZero,1)' Y zeros(nZero,1)'];
y_ = zeros(N,1);

for j = 1:N
    disp("Y"+j)
    disp(f);
    disp(y(j:N+j-1));
    disp((sum(f.*y(j:N+j-1))));
    y_(j,1) = alpha.*(sum(f.*y(j:N+j-1)));   % for j =0
    disp(y_(j,1));
end

disp("Y Final");
disp(y_);