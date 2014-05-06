function solution = TPE1()%the h used here is not global, we want to find it.
	load initializeGlobals.m;
	load train.m;
	load transmit.m;
	initializeGlobals();
	global L;

	img = double(imread('../img/lena512.bmp'));

	M = (L+2);%size(s,2);%columns(s);
	s = img(1,1:(M-L))';
	S = toeplitz([s.' zeros(1,M-L)],zeros(1,M))%%case M=L
	r = train(S);

	h = r/S%TODO: find h with chol and backwards substitution.
	%%%%%%%%%%%%% Second Part %%%%%%%%%%%%%%%%%	
	a = img;
	M = size(a,2);%columns
	H = toeplitz([h.' zeros(1,M-L)],zeros(1,M));
	P = size(a,1);%rows
	r = zeros(M,P);
	s = zeros(M,P);
	for k=1:rows(a)
		r(k,:) = transmit(a(k,:),M);	
		s(k,:)= r/H;
	endfor
	r = uint8(r);
	s = uint8(s);
	imshow(r);
	imshow(s);	
endfunction