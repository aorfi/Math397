y = [1 1.25 1.5 1.75 2]
b = [5.1 5.79 6.53 7.45 8.44]'

A_linear = [ 1 1;
    1 1.25;
    1 1.5;
    1 1.75;
    1 2]
ATA_linear = A_linear'*A_linear
R_linear = cholesky(ATA_linear)
y_linear = fsub(R_linear',A_linear'*b) 
x_linear = bsub(R_linear,y_linear)
r_linear = A_linear'*b-ATA_linear*x_linear

A_quad = [ 1 1 1;
    1 1.25 1.25^2;
    1 1.5 1.5^2;
    1 1.75 1.75^2;
    1 2 4]
ATA_quad = A_quad'*A_quad
R_quad = cholesky(ATA_quad)
y_quad = fsub(R_quad',A_quad'*b) 
x_quad = bsub(R_quad,y_quad)
r_quad = A_quad'*b-ATA_quad*x_quad

figure
x  = 0.75: .1 : 2.25;
f = x_linear(2)*x+x_linear(1);
g = x_quad(3)*x.^2+x_quad(2)*x+x_quad(1);
scatter(y,b);
hold on;
plot(x,f);
plot(x,g);
grid on;
title('PSet2 Q3 Linear and Quadratic Fit')
