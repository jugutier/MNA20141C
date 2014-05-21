
function simulation()
	%[x y] = loadData('../data/saturn');
	x = loadData('../data/saturn');
	colormap(gray(255));

	mkdir('../img/results');

	%Display original image
	image(x');
	print("-dpng", "../img/results/saturn.png");

	%Display image transformed into phase
	X = fftn(x);
	phase = angle(X);
	mx = max(max(phase));
	mn = min(min(phase));

	m = 255/(mx-mn);
	b = -m*mn;

	nphase = floor(m*phase + b);
	image(nphase');
	print("-dpng", "../img/results/saturn_phase.png");

	%Display image transformed into amplitude
	image(abs(X)');
	print("-dpng", "../img/results/saturn_amplitude.png");


	%Display recovered original image
	xprima = ifftn(X);
	image(abs(xprima)');
	print("-dpng", "../img/results/saturn_recovered.png");


	%Apply first filter
	xf1_function = filter1().*X;
	xf1_result = abs(ifftn(xf1_function))';
	image(xf1_result);
	print("-dpng", "../img/results/saturn_filter1.png");

	%Apply second filter (Gaussian)
	xf2_function = filter2().*X;
	xf2_result = abs(ifftn(xf2_function))';
	image(xf2_result);
	print("-dpng", "../img/results/saturn_filter2.png");

	%Apply third filter (Checkered)
	xf3_function = filter3().*X;
	xf3_result = abs(ifftn(xf3_function))';
	image(xf3_result);
	print("-dpng", "../img/results/saturn_filter3.png");
end
