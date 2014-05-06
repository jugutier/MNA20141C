function solution = TPE1()
	load initializeGlobals.m;
	load train.m;
	load transmit.m;
	initializeGlobals();
	global h;
	global L;
	filename = '../img/lena512.bmp';
	s = double(imread(filename)(1,L));
	M = columns(s);
	S = toeplitz([zeros(1,M-L) s'],zeros(1,M));
	r = train(S);
	h = r/S;%desp cholesy y subst hacia atras
	a = double(imread(filename));
	L= rows(h);
	M = columns(a);
	Sfinal = [];
	for i=1:columns(a)
		r = transmit(a(:,i));
		H = toeplitz([zeros(1,M-L) h'],zeros(1,M));
		s= r/H;
		Sfinal = [Sfinal s];
	endfor
	Sfinal = uint8(Sfinal);
	imshow(Sfinal);
	
	
endfunction