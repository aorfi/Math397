function [ x ] = fsub( L,b )
% Forward Substitution Algorithm
% Solves Lx=b to find x by forward
% substitution when L is lower triangular
% 
% Algorithm does not test whether L is lower
% triangular. Any upper triangular elements
% are ignored.

x=nan(size(b));
[m,n]=size(L);
[mv,nv]=size(b);
if m~=n 
    disp('matrix not square')
    return
elseif mv~=m || nv ~= 1
    disp('vector size not compatible with matrix')
    return
end

% do forward substitution
for i=1:n
    x(i)=b(i);
    for j=1:i-1
        x(i)=x(i)-L(i,j)*x(j);
    end
    x(i)=x(i)/L(i,i);
end




end

