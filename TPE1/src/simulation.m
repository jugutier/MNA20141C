function simulation()%the h used here is not global, we want to find it.
	load initializeCannal.m;
	load estimateh.m
	load transmit.m;
	load minimumSquares.m;	
	global L;

	a = double(imread('../img/lena512.bmp'));
	E = 512;
	M = size(a,2);
	initializeCannal(M);
	%%% First Part: Estimate h given a sequence of known bytes %%	
	h = estimateh(E,M);
	%% Second Part: transmit image and retrieve it with the h we estimated %%	
	H = toeplitz([h.' zeros(1,M-L)],zeros(1,M));
	P = size(a,1);%rows
	r = zeros(M,P);
	s = zeros(M,P);
	for k=1:rows(a)
		currentr = transmit(a(k,:),M);
		r(k,:) = currentr;	
		s(k,:) = minimumSquares(H,currentr');
	endfor
	r = uint8(r);
	s = uint8(s);
	imshow(r);
	imshow(s);	
endfunction