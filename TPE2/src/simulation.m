
function simulation()
	addpath('./filters');
	x = loadData('../data/saturn');
	colormap(gray(255));

	%Display original image
	%image(x');
	%print("-dpng", "../img/saturn.png");

	%Display image transformed into phase
	printf('Transforming image into phase... ');
	fflush(stdout);
	X = ctfft2(x);
	phase = angle(X);
	mx = max(max(phase));
	mn = min(min(phase));

	m = 255/(mx-mn);
	b = -m*mn;

	nphase = floor(m*phase + b);
	image(nphase');
	print("-dpng", "../img/saturn_phase.png");
	printf('done.\n');
	fflush(stdout);

	%Display image transformed into amplitude
	printf('Transforming image into amplitude... ');
	fflush(stdout);
	image(abs(X)');
	print("-dpng", "../img/saturn_amplitude.png");
	printf('done.\n');
	fflush(stdout);


	%Display recovered original image
	printf('Recovering original image... ');
	fflush(stdout);
	xprima = ictfft2(X);
	image(abs(xprima)');
	print("-dpng", "../img/saturn_recovered.png");
	printf('done.\n');
	fflush(stdout);

	%Apply first filter
	printf('Applying first filter... ');
	fflush(stdout);
	xf1_function = onesFilter().*X;
	xf1_result = abs(ictfft2(xf1_function))';
	image(xf1_result);
	print("-dpng", "../img/saturn_filter1.png");
	printf('done.\n');
	fflush(stdout);

	%Apply second filter (Gaussian)
	printf('Applying gaussian filter... ');
	fflush(stdout);
	xf2_function = gaussianFilter().*X;
	xf2_result = abs(ictfft2(xf2_function))';
	image(xf2_result);
	print("-dpng", "../img/saturn_filter2.png");
	printf('done.\n');
	fflush(stdout);

	%Apply third filter (Checkerboard)
	printf('Applying checkeredboard filter... ');
	fflush(stdout);
	xf3_function = checkerboardFilter().*X;
	xf3_result = abs(ictfft2(xf3_function))';
	image(xf3_result);
	print("-dpng", "../img/saturn_filter3.png");
	printf('done.\n');
	fflush(stdout);
end
