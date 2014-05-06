function [ X ] = cuadminQR (Y)
%inciar las variables
T = Y(:,1);
T = normalizar(T);
A = [T.^0  T.^1  T.^2];
b= log(Y(:,2));
k = 3;
A0=A;

[rows,cols]=size(A);
Q=eye(rows);
for i=1:k
	x = A(:,i);
	S = sqrt(sum(x(i:rows).^2));
	y = zeros(rows,1);
	y(1:i-1)= x(1:i-1);
	y(i) = S;

	w= x-y;
	norma = sqrt(sum(w.^2));

	Qi = eye(rows) - (2/norma^2)*(w*w');
	Q = Q*Qi;
	A = Qi*A;

end
R=A;
c=Q'*b;
C=[R c];

[rows,cols]=size(C);
X = zeros(3,1);
X(end) = C(3,cols)/C(3,3);
for k=3-1:-1:1
  X(k) = (C(k,cols)-C(k,k+1:cols-1)*X(k+1:3))/C(k,k);
end