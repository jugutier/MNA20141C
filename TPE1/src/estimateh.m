%Estimates h of the cannal.
%params: E the lenght of the train sequence.
%params: M columns of the image to be sent.
function h = estimateh(E,M)
	global L;
	global Lguess = 10;
	MAX_IMGVALUE = 255;
	trainSequence = MAX_IMGVALUE*rand(1,E);
	S = toeplitz([trainSequence  zeros(1,M-E)], zeros(1,Lguess));
	r = train(S);
	G = cholesky(S' * S);
	h = backSustitution(S,r,G);
%	h = [h; zeros(abs(L - Lguess),1)];
endfunction