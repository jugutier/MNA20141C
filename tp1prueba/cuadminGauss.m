function [ X ] = cuadminGauss (Y)
%inciar las variables
T = Y(:,1);
T = normalizar(T);
A = [T.^0  T.^1  T.^2];
b= log(Y(:,2));
B = A'*A;
c = A'*b;
C = [B c];
k = 2;


%eliminacion Gaussiana de B
[rows,cols]=size(C);
for i=1:rows-1
  B1 = C(i,i);
  for j=k:rows
    C(j,:) = B1*C(j,:) - C(j,i)*C(i,:);
  end
  k = k + 1;
end

%Ya tenemos C Gaussiana, vemos si es S.C.D
for i=1:rows
	if(C(i,cols) == 0 || C(i,i) == 0)
		error("el sistema no es compatible determinado, no tiene solucion\n")
	end
end
%suponemos que no tengo nada igual a cero en la diagonal

X = zeros(rows,1);
X(end) = C(rows,cols)/C(rows,rows);
for k=rows-1:-1:1
  X(k) = (C(k,cols)-C(k,k+1:cols-1)*X(k+1:rows))/C(k,k);
end