% Solve Ax=b when A is Hermitian positive definite

% Example 1.4.74(ii) from Watkins

A=[ 1 1 1 1 1;
    1 2 2 2 2;
    1 2 3 3 3;
    1 2 3 4 4;
    1 2 3 4 5 ]

b = [5 9 12 14 15]'

R = cholesky(A)

y = fsub(R',b)  %
%y=R'\b

x = bsub(R,y)

r = b-A*x

x_lin = linsolve(A,b)
err = x_lin - x