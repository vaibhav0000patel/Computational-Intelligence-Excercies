clear;
clc;

A = 0.1;
alpha = 7;
N = 11;
s = 50;    % threshold
a = 2;     % width  2a + 1 = 5 EXITARY
b = 0.06;  % height
M = 3 + a; % inhibitary region width
c = -0.04;  % height internal


%------------------------
y_0 = getInitialValues(N,A);

f = [c c c b b b b b c c c];

nZero = (N-1)/2;

y_ = zeros(N,N);
y_(1,1:end) = y_0'
for k = 1:N-1
    y = [zeros(nZero,1)' y_(k,1:end) zeros(nZero,1)'];
    for j = 0:N-1
        disp("Y"+(j+1))
        disp(y(j+1:N+j));
        disp((sum(f.*y(j+1:N+j))));
        y_(k+1,j+1) = min(max(alpha.*(sum(f.*y(j+1:N+j))),0),50);   % for j =0
    end
end

disp("Y Final");
disp(y_);

function y0 = getInitialValues(N,A)
    y0 = zeros(N,1);
    for j = 0:N-1
        y0(j+1,1) = A*(sin((j*pi)/(N-1))^2);
    end
end