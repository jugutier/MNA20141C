function test
Y = load("datos.txt");
t = normalizar(Y(:,1));
s = Y(:,2);

printf("Cuadrados minimos con eliminacion Gaussiana.\n")
Xgauss = cuadminGauss(Y)

printf("Cuadrados minimos por Cholesky.\n")
Xchol = cuadminCholesky(Y)

%printf("Cuadrados minimos por QR.\n")
%Xqr = cuadminQR(Y)


printf("Cuadrados minimos con algoritmos de Octave.\n")
A = [t.^0 t.^1 t.^2];
b= log(s);
Xoctave = A\b


X = Xgauss;
printf(" y2(t) = %g + %gt + %gt²\n", X(1), X(2), X(3));


printf("Error cuadratico del ajuste norm(ln(s)-y2(t)):\n")
E1 = norm(log(s) - y2(X(1), X(2), X(3), t))

printf("Error cuadratico del ajuste norm(s-y1(t)):\n")
E2 = norm(s - y1(X(1), X(2), X(3), t))
log(E2)

plot(t, log(s), ";Original;",  t, y2(X(1), X(2), X(3), t), ";Ajustado;");
title("Ajuste cuadrados minimos del logaritmo natural del indice Standard and Poor's");
print("-dpng", "cuadradosMinimos.png");

plot(t, s, ";Original;",  t, y1(X(1), X(2), X(3), t), ";Ajustado;");
title("Mercado Financiero");
xlabel("Tiempo normalizado");
ylabel("Indice Standard and Poor's");
print("-dpng", "Ajuste.png");