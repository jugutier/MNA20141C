%Compute the whole simulation aving and showing images
%also display error on recovery.
function simulation()
	addpath('./filters');
	x = loadData('../data/saturn');
	colormap(gray(255));

	%Display original image
	%doi(x);

	%Display image transformed into phase
	tic
	X = ctfft2(x);
	toc
	%ditip(X);	

	%Display image transformed into amplitude
	%ditia(X);

	%Display recovered original image
	originalImage = x;
	recoveredImage = droi(X);
	printf('Error while recovering image: %.22f\n',meanError(originalImage,recoveredImage));

	%Apply first filter
	%aff(X);

	%Apply second filter (Gaussian)
	%asf(X);

	%Apply third filter (Checkerboard)
	%atf(X);
end

function doi(x)
	image(x');
	print("-dpng", "../img/saturn.png");
endfunction

function ditip(X)
	printf('Transforming image into phase... ');
	fflush(stdout);
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
endfunction

function ditia(X)
	printf('Transforming image into amplitude... ');
	fflush(stdout);
	image(abs(X)');
	print("-dpng", "../img/saturn_amplitude.png");
	printf('done.\n');
	fflush(stdout);
endfunction

function recoveredImage = droi(X)
	printf('Recovering original image... ');
	fflush(stdout);
	xprima = ictfft2(X);
	recoveredImage = abs(xprima)';
	image(recoveredImage);
	print("-dpng", "../img/saturn_recovered.png");
	printf('done.\n');
	fflush(stdout);
endfunction

function aff(X)
	printf('Applying first filter... ');
	fflush(stdout);
	xf1_function = onesFilter().*X;
	xf1_result = abs(ictfft2(xf1_function))';
	image(xf1_result);
	print("-dpng", "../img/saturn_filter1.png");
	printf('done.\n');
	fflush(stdout);
endfunction

function asf(X)
	printf('Applying gaussian filter... ');
	fflush(stdout);
	xf2_function = gaussianFilter().*X;
	xf2_result = abs(ictfft2(xf2_function))';
	image(xf2_result);
	print("-dpng", "../img/saturn_filter2.png");
	printf('done.\n');
	fflush(stdout);
endfunction

function atf(X)
	printf('Applying checkeredboard filter... ');
	fflush(stdout);
	xf3_function = checkerboardFilter().*X;
	xf3_result = abs(ictfft2(xf3_function))';
	image(xf3_result);
	print("-dpng", "../img/saturn_filter3.png");
	printf('done.\n');
	fflush(stdout);
endfunction