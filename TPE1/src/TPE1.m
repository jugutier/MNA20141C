function solution = TPE1()%the h used here is not global, we want to find it.
	load initializeGlobals.m;
	load train.m;
	load transmit.m;
	initializeGlobals();
	global L;

	img = imread('../img/lena512.bmp');
	s = double(img(1,L));
	M = columns(s);
	S = toeplitz([zeros(1,M-L) s'],zeros(1,M));%%case M=L
	r = train(S);
	h = r/S;%TODO: find h with chol and backwards substitution.
	%%%%%%%%%%%%% Second Part %%%%%%%%%%%%%%%%%	
	a = double(img);
	M = columns(a);
	H = toeplitz([zeros(1,M-L) h'],zeros(1,M));
	P = rows(a);
	Rfinal = [];%zeros(M,P);
	Sfinal = [];
	for k=1:rows(a)
		r = transmit(a(k,:));
		Rfinal = [Rfinal r];		
		s= r/H;
		Sfinal = [Sfinal; s;];
	endfor
	Sfinal = uint8(Sfinal');
	imshow(Sfinal);
	
	
endfunction