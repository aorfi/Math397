function [R]=cholesky(A)
[m,n]=size(A);
R=zeros(m,n);
if m~=n 
    disp('matrix not square')
    R=[];
    return
end
for i=1:m
    R(i,i)=sqrt(A(i,i)-sum(abs(R(1:i-1,i)).^2));
    if conj(R(i,i))~=R(i,i) %R(i,i) not real
      disp('matrix not Hpd')
      R=[];
        return
    end  
    if abs(R(i,i))<1e-16  %R(i,i) zero
        disp('matrix not Hpd')
        R=[];
        return
    end
    for j=i+1:m
            R(i,j)=(A(i,j)-sum(conj(R(1:i-1,i)).*R(1:i-1,j)))/R(i,i);
    end
end