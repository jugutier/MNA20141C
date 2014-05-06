function [ X ] = cuadminCholesky (Y)
%inciar las variables
T = Y(:,1);
T = normalizar(T);
A = [T.^0  T.^1  T.^2];
b= log(Y(:,2));
B = A'*A;
c = A'*b;
k = 2;

%descomposicion de cholesky

G = zeros(3);
for(j=1 : 3)
  G(j,j)=sqrt(B(j,j) - sum(G(j,1:j-1).^2));
  for(i=j+1:3)
    G(i,j)=(B(i,j)-G(i,1:j-1)*G(j,1:j-1)')/G(j,j);
  endfor
endfor
%G


%Ya tenemos G, vemos si es S.C.D y calculamos Z
if(G(1,1) ~= 0 && G(2,2) ~= 0 && G(3,3) ~= 0)
  z1 = c(1)/G(1,1);
  z2 = (c(2)-G(2,1)*z1)/G(2,2);
  z3 = (c(3) - G(3,1)*z1 - G(3,2)*z2)/G(3,3);
  Z = [z1,z2,z3];

%Calculamos X
  x3 = Z(3)/G'(3,3);
  x2 = (Z(2)-G'(2,3)*x3)/G'(2,2);
  x1 = (Z(1) - G'(1,2)*x2 - G'(1,3)*x3)/G'(1,1);
  X = [x1,x2,x3]';
else
  error("el sistema no es compatible determinado, no tiene solucion\n")
end
