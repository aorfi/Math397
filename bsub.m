function [ x ] = bsub( U,b )
% Backward Substitution Algorithm
% Solves Ux=b to find x by backward
% substitution when U is upper triangular
% 
% Algorithm does not test whether U is upper
% triangular. Any lower triangular elements
% are ignored.

x=nan(size(b));
[m,n]=size(U);
[mv,nv]=size(b);
if m~=n 
    disp('matrix not square')
    return
elseif mv~=m || nv ~= 1
    disp('vector size not compatible with matrix')
    return
end

% do backward substitution
for i=n:-1:1
    x(i)=b(i);
    for j=i+1:n
        x(i)=x(i)-U(i,j)*x(j);
    end
    x(i)=x(i)/U(i,i);
end




end

