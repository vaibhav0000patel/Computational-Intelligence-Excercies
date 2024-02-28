clear;
clc;
N = 11;
A = 0.1;

%------------------------
y_0 = getInitialValues(N,A)

function y0 = getInitialValues(N,A)
    y0 = zeros(N,1);
    for j = 0:N-1
        y0(j+1,1) = A*(sin((j*pi)/(N-1))^2);
    end
end