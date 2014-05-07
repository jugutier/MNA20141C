function solution = TPE1()%the h used here is not global, we want to find it.
	load initializeGlobals.m;
	load train.m;
	load transmit.m;
	load minimumSquares.m;	
	global L;
	global sigma;

	format long;

	sigma = 1;

	%%% First Part: Estimate h given a sequence of known bytes %%	
	a = double(imread('../img/lena512.bmp')) / 255;
	E = 512;
	M = size(a,2);
	initializeGlobals(M);
	sTrainSent = [rand(1,E) zeros(1,M-E)];
	S = toeplitz(sTrainSent, zeros(1,L));
	r = train(S);

	G = cholesky(S' * S);
	%G = chol(S' * S);
	%G = G';


	h = minimumSquares(S,r, G);
	%% Second Part: transmit image and retrieve it with the h we estimated %%	
	H = toeplitz([h.' zeros(1,M-L)],zeros(1,M));
	P = size(a,1);%rows
	r = zeros(M,P);
	s = zeros(M,P);
	transmitted = 0;
	transmit_line = 0;
	corrected = 0;

	G = cholesky(H' * H);

	%G = chol(H' * H);
	%G = G';

	for k=1:rows(a)
		transmit_line = a(k,:);
		transmitted = transmit(transmit_line,M);
		corrected = minimumSquares(H, transmitted, G);
		r(k,:) = transmitted * 255;
		s(k,:) = corrected * 255;
		k
		fflush(stdout);
	endfor
	r = uint8(r);
	s = uint8(s);
	%saveImages(r, s);
	figure(1);
	imshow(r);
	figure(2);
	imshow(s);	
endfunction