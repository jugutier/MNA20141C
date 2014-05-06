function testQR
Y = load("datos2.txt");
t = normalizar(Y(:,1));
s = Y(:,2);

printf("Cuadrados minimos por QR.\n")
Xqr = cuadminQR(Y)


printf("Cuadrados minimos con algoritmos de Octave.\n")
A = [t.^0 t.^1 t.^2];
b= log(s);
Xoctave = A\b