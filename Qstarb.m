function Qstb=Qstarb(W,b)
[m,n]=size(W); 
Qstb=b;
for k=1:n
  Qstb(k:m)=Qstb(k:m)-2*W(k:m,k)*(W(k:m,k)'*Qstb(k:m));
end