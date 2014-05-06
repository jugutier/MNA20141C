% This script runs the Cholesky's decomposition for the 
% provided input data. 
% Authors: Yemel Angel Jardi Bello and Santiago Jose Samra

load spdc2693.txt

stats = normalize(spdc2693);

t = stats(:,1);

A = [ ones(rows(stats), 1) t t.^2 ];

b = log(stats(:,2));

G = cholesky(A' * A);

z = forwardsustitution(G, A' * b);

printf("Coeficientes:\n");
x = backsustitution(G', z)

y1 = inline("exp(x(1) .+ x(2) .* t .+ x(3) .* t.^2);");
y2 = inline("x(1) .+ x(2) .* t .+ x(3) .* t.^2;");

E1 = norm(log(stats(:,2)) - y2(t));
E2 = norm(stats(:,2) - y1(t));
printf("E1 - Error cuadratico del ajuste norm(ln(s) - y2(t)): %g\n", E1);
printf("E2 - Error cuadratico del ajuste norm(s - y1(t)): %g\n", E2);

printf("La relacion E1 / E2: %g\n", E1/E2); 
printf("La relacion E2 / E1: %g\n", E2/E1);
printf("La relacion ln(E2): %g\n", log(E2));  

plot(t, stats(:,2), ";original;", t, y1(t), ";ajuste;");
title("Mercado financiero");
xlabel("Tiempo (normalizado)");
ylabel("Indice Standard and Poor\'s");

print("-dpng", "Ajuste.png");