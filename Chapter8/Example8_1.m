clear;clc;
% (XOR problem solved by nonlinear transform)

% In the XOR problem as shown in Table E8.1.1 and Figure E8.1.1, there are four patterns (or points), [0, 0], [1, 1], [0, 1], and [1, 0], in a 2- dimensional input space.

% The XOR problem requirement is to construct a pattern classifier that produces the binary output 0 in response to the input pattern [0, 0] or [1, 1] with identical elements; and the binary output 1 in response to the input pattern [0, 1] or [1, 0] with different elements.


X1 = [ 0 0 ];
X2 = [ 0 1 ];
X3 = [ 1 0 ];
X4 = [ 1 1 ];

y = [ 0 1 1 0 ];

T1 = [ 1 1 ];
T2 = [ 0 0 ];

fi1X1 = gkp(X1,T1)
fi1X2 = gkp(X2,T1)
fi1X3 = gkp(X3,T1)
fi1X4 = gkp(X4,T1)


fi2X1 = gkp(X1,T2)
fi2X2 = gkp(X2,T2)
fi2X3 = gkp(X3,T2)
fi2X4 = gkp(X4,T2)


function g=gkp(X,T)
    g = exp(-norm(X - T)^2);
end


% As seen, the transformed input patterns [0, 0] and [1, 1] are now linearly separable from the remaining input patterns [0, 1] and [1, 0].

% In the XOR example, the nonlinearity of the Gaussian hidden function is sufficient to transform the problem into a linearly separable one, and there is no need for an increase in the dimensionality of the hidden-unit space.