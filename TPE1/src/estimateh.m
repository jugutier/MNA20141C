function h = estimateh(E,M)
	global L;
	Lguess = L;
	MAX_IMGVALUE = 255;
	trainSequence = MAX_IMGVALUE*rand(1,E);
	S = toeplitz([trainSequence  zeros(1,M-E)], zeros(1,Lguess));
	r = train(S);
	G = cholesky(S' * S);
	h = backSustitution(S,r,G);
	h = [h; zeros(abs(L - Lguess),1)];
endfunction