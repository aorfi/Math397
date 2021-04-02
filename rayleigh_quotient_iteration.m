A = [3 -2;1 0];

I = eye(size(A));

q0 = [1;0];

n_iter = 4;

iterations = zeros(n_iter,2);
sigmas = zeros(n_iter,1);
rhos = zeros(n_iter,1);

iterations(1,:) = q0;
sigmas(1,:) = norm(q0,Inf);
rhos(1,:) = transpose(q0)*A*q0/norm(q0)^2;


for i = 1:n_iter
    q_old = iterations(i,:)';
    q = (A-rhos(i)*I)\q_old; % inverse power method
    sigma = norm(q,Inf);
    sigmas(i+1) = sigma;
    q = q/sigma;
    iterations(i+1,:) = q;
    rhos(i+1,:) = transpose(q)*A*q/norm(q)^2;
end

iterations(end,:)

v = iterations(end,:);
vector = [v(1);v(2)];
value = A*vector;
value = value(1)
rhos_minmus_lam = rhos - value
seq = zeros(n_iter,1);
for i = 1:n_iter
    seq(i) = log(rhos_minmus_lam(i+1))/log(rhos_minmus_lam(i));
end
seq


errors = zeros(n_iter,1);
for i = 1:n_iter
   errors(i,:) = norm(iterations(i,:)'-v');
end
