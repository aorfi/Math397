A = [9 1;1 2];


q0 = [1;1];
% q0 = rand(2,1)

n_iter = 10;

iterations = zeros(n_iter,2);
sigmas = zeros(n_iter,1);

iterations(1,:) = q0;
sigmas(1,:) = norm(q0);

for i = 1:n_iter
    q_old = iterations(i,:)';
    q = A*q_old;
    sigma = norm(q,Inf);
    sigmas(i+1) = sigma;
    q = q/sigma;
    iterations(i+1,:) = q;
end

iterations(end,:)