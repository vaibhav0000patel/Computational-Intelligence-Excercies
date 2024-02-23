clear;clc;
% Consider the 4 initial centers on a 2-dimensional plane defined by [-1 <= x <= 1 and -1 <= y <= 1]

global C;
C = [1 2 3 4];

w1 = [  0.5,  0.5 ];
w2 = [ -0.5,  0.5 ];
w3 = [ -0.5, -0.5 ];
w4 = [  0.5, -0.5 ];

X1 = [  0.4,  0.2 ];
X2 = [ -0.3,  0.7 ];
X3 = [ -0.1, -0.9 ];
X4 = [  0.3, -0.2 ];

global T;
T = [ 1 4 3 2 ];

% (a) Given the learning rate parameter 𝑔(1) = 0.5, show the calculations to illustrate what will happen after presenting the four input vectors as listed in

W1 = w1;
W2 = w2;
W3 = w3;
W4 = w4;
g_1 = 0.5;
[W1,W2,W3,W4] = iteration(1,X1,W1,W2,W3,W4,g_1);
[W1,W2,W3,W4] = iteration(2,X2,W1,W2,W3,W4,g_1);
[W1,W2,W3,W4] = iteration(3,X3,W1,W2,W3,W4,g_1);
[W1,W2,W3,W4] = iteration(4,X4,W1,W2,W3,W4,g_1)

% (b) On the 2-dimensional plane, plot the movement of each of the four centers by joining the initial center to the final center by an arrow.

plotCenters(w1,w2,w3,w4,W1,W2,W3,W4);


function [W1,W2,W3,W4] = iteration(i,X,W1,W2,W3,W4,g)
    d1 = squared_euclidean_distance(X, W1);
    d2 = squared_euclidean_distance(X, W2);
    d3 = squared_euclidean_distance(X, W3);
    d4 = squared_euclidean_distance(X, W4);
    D = [d1 d2 d3 d4];
    if d1 == min(D)
        W1 = update_weight(i, 1, X, W1, g);
    end
    if d2 == min(D)
        W2 = update_weight(i, 2, X, W2, g);
    end
    if d3 == min(D)
        W3 = update_weight(i, 3, X, W3, g);
    end
    if d4 == min(D)
        W4 = update_weight(i, 4, X, W4, g);
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



function plotCenters(w1_initial,w2_initial,w3_initial,w4_initial,W1_final,W2_final,W3_final,W4_final)
   
    % Calculate differences for arrow directions
    dW1 = W1_final - w1_initial;
    dW2 = W2_final - w2_initial;
    dW3 = W3_final - w3_initial;
    dW4 = W4_final - w4_initial;
    
    % Plotting
    figure;
    hold on;
    quiver(w1_initial(1), w1_initial(2), dW1(1), dW1(2), 0, 'r');
    quiver(w2_initial(1), w2_initial(2), dW2(1), dW2(2), 0, 'g');
    quiver(w3_initial(1), w3_initial(2), dW3(1), dW3(2), 0, 'b');
    quiver(w4_initial(1), w4_initial(2), dW4(1), dW4(2), 0, 'k');
    hold off;
    
    % Set axis limits and labels
    axis equal;
    xlim([-1, 1]);
    ylim([-1, 1]);
    xlabel('X-axis');
    ylabel('Y-axis');
    title('Movement of Centers');
    legend({'Center 1', 'Center 2', 'Center 3', 'Center 4'}, 'Location', 'best');
    grid on;

end
