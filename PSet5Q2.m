A = [25 4 0 1;4 -15 -2 0; 0 -2 6 -1; 1 0 -1 3];
[V,D] = eig(A);
D
dmax = D(4,4);
vmax = V(:,4);
vmax = vmax/vmax(1);

q0 = [1;1;1;1];
n_iter = 10;
iterations = zeros(n_iter,4);
q_minus_v = zeros(n_iter,1);
sigma_minus_d = zeros(n_iter,1);
sigmas = zeros(n_iter,1);

iterations(1,:) = q0;
q_minus_v = norm(q0-vmax);
sigmas(1,:) = norm(q0);
sigma_minus_d = norm(norm(q0)-dmax);

for i = 1:n_iter
    q_old = iterations(i,:)';
    q = A*q_old;
    sigma = norm(q,Inf);
    sigmas(i+1) = sigma;
    q = q/sigma;
    iterations(i+1,:) = q;
    q_minus_v(i+1,:) = norm(q-vmax);
    sigma_minus_d(i+1,:) = norm(sigma - dmax);
end

%X = log(q_minus_v(2:end));
%Y = log(q_minus_v(1:end-1));
%figure(1); plot(X,Y); title("Log of Eigenvector Error Against Previous Iteration "); 
%xlabel('Log||q_i-v||'); ylabel('Log||q_{i+1}-v||')
iterations(end,:)
sigma(end)
%X = log(sigma_minus_d(2:end))
%Y = log(sigma_minus_d(1:end-1))
%figure(1); plot(X,Y); title("Log of Eigenvalue Error Against Previous Iteration "); 
%xlabel('Log||\sigma_i-\lambda||'); ylabel('Log||\sigma_{i+1}-\lambda||')
