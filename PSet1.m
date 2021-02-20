% Connectivity matrix definition
P = [0 0 1/2 0 0 1/5;1/2 0 0 0 0 1/5;0 1/2 0 1/3 0 1/5;0 0 0 0 1/2 1/5;0 0 0 1/3 0 1/5; 1/2 1/2 1/2 1/3 1/2 0] 
% Random initial vector
r = rand(6,1);
% Normalize
r = r/sum(r);

% Define error and counter
err = 1;
num_it = 0;
% Perform matrix multiplication until the error is less than 0.001
while err > 0.0001
    r0=r;
    r = P*r0;
    disp(r)
    err = norm(r-r0);
    num_it = num_it + 1;
end

disp(r)
