
[x y] = loadData('../datos/saturno');
colormap(gray(255));

% Se muestra la imagen original
image(x');
title("Saturno");
print("-dpng", "../images/saturnoVisible.png");

% Se muestra la imagen transformada en phase
X = fftn(x);
phase = angle(X);
mx = max(max(phase));
mn = min(min(phase));

m = 255/(mx-mn);
b = -m*mn;

nphase = floor(m*phase + b);
image(nphase');
title("Saturno en fase");
print("-dpng", "../images/saturnoEnFase.png");

% Se muestra la imagen transformada en amplitud
image(abs(X)');
title("Saturno en Amplitud");
print("-dpng", "../images/saturnoEnAmplitud.png");


% Se muetra la imagen original tras las transformaciones
xprima = ifftn(X);
image(abs(xprima)');
title("Saturno recuperado");
print("-dpng", "../images/saturnoRecuperado.png");


% Se aplica el primer filtro
Xfilter1 = filter1().*X;
xfilter1 = abs(ifftn(Xfilter1))';
image(xfilter1);
title("Saturno con filtro 1");
print("-dpng", "../images/saturnoFiltrado1.png");

% Se aplica el segundo filtro
Xfilter2 = filter2().*X;
xfilter2 = abs(ifftn(Xfilter2))';
image(xfilter2);
title("Saturno con filtro gaussiano (2)");
print("-dpng", "../images/saturnoFiltrado2.png");

% Se aplica el segundo filtro
Xfilter3 = filter3().*X;
xfilter3 = abs(ifftn(Xfilter3))';
image(xfilter3);
title("Saturno con filtro damero (3)");
print("-dpng", "../images/saturnoFiltrado3.png");

