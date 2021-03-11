m = 32
v = ([1:m]/m)'
A = vander(v)
[Q_cgs0,R_cgs] = cgs(A);
[Q_cgs,R_cgs] = cgs(Q_cgs0);
[Q_mgs0,R_mgs] = mgs(A);
[Q_mgs,R_mgs] = mgs(Q_mgs0);
[W_house,R_house] = house(A);
Q_house = formQ(W_house);
[Q_qr,R_qr] = qr(A);
Norm_cgs = norm(Q_cgs'*Q_cgs-eye(size(Q_cgs'*Q_cgs)));
Norm_mgs = norm(Q_mgs'*Q_mgs-eye(size(Q_mgs'*Q_mgs)));
Norm_house = norm(Q_house'*Q_house-eye(size(Q_house'*Q_house)));
Norm_qr = norm(Q_qr'*Q_qr-eye(size(Q_qr'*Q_qr)));
