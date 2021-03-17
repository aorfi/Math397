load A
[U,S,V] = svd(A);
rank = 2;

sigmas = diag(S);
approx_sigmas = sigmas;
approx_sigmas(rank:end)=0;

ns = length(sigmas);
approx_S = S;
approx_S(1:ns,1:ns)=diag(approx_sigmas);
approx_U = U;
approx_U(:,rank+1:end) = 0;
approx_V = V;
approx_V(:,rank+1:end) = 0;
[n,m] = size(S);
approx_A = approx_U*approx_S*approx_V';
%figure(1), imagesc(approx_A), colormap(gray);


figure(2); plot(Log10(sigmas(1:256)/sigmas(1))); title("\sigma_i/\sigma_1 Log10 Scale")
E = [];
for k=1:100
    approx_sigmas = sigmas;
    approx_sigmas(k:end)=0;
    ns = length(sigmas);
    approx_S = S;
    approx_S(1:ns,1:ns)=diag(approx_sigmas);
    approx_U = U;
    approx_U(:,k+1:end) = 0;
    approx_V = V;
    approx_V(:,k+1:end) = 0;
    [n,m] = size(S);
    approx_A = approx_U*approx_S*approx_V';
    Ek = norm(A-approx_A)/norm(A);
    E(end+1) = Ek;
end
figure(3); plot(Log10(E)); title("Ek Log10 Scale")



