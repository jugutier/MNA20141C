function h = estimateh(E,M)
	load train.m;
	load minimumSquares.m;
	global L;
	S = toeplitz(255*[rand(1,E) zeros(1,M-E)], zeros(1,L));
	r = train(S);
	h = minimumSquares(S,r);
	%sTrainReceived = 255*[rand(1,E) zeros(1,M-E)]
	%[Q R] = qr(S);
	%h_estimada = inv(R)*(Q'*sTrainReceived);
endfunction