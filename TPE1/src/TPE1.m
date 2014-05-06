function solution = TPE1()%the h used here is not global, we want to find it.
	load initializeGlobals.m;
	load train.m;
	load transmit.m;
	load minimumSquares.m;	
	global L;

	%%% First Part: Estimate h given a sequence of known bytes %%	
	a = double(imread('../img/lena512.bmp'));
	E = 512;
	M = size(a,2);
	initializeGlobals(M);
	sTrainSent = 255*[rand(1,E) zeros(1,M-E)];
	S = toeplitz(sTrainSent, zeros(1,L));
	r = train(S);
	h = minimumSquares(S,r);
	%% Second Part: transmit image and retrieve it with the h we estimated %%	
	H = toeplitz([h.' zeros(1,M-L)],zeros(1,M));
	P = size(a,1);%rows
	r = zeros(M,P);
	s = zeros(M,P);
	for k=1:rows(a)
		r(k,:) = transmit(a(k,:),M);	
		s(k,:) = minimumSquares(H,r);
	endfor
	r = uint8(r);
	s = uint8(s);
	imshow(r);
	imshow(s);	
endfunction