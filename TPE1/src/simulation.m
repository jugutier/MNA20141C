function simulation()%the h used here is not global, we want to find it.
	load initializeCannal.m;
	load estimateh.m
	load transmit.m;
	load minimumSquares.m;	
	global L;

	a = double(imread('../img/lena512.bmp'));
	E = 32;
	M = size(a,2);
	initializeCannal(M);
	%% First Part: Estimate h given a sequence of known bytes %%	
	h = estimateh(E,M);
	%% Second Part: transmit image and retrieve it with the h we estimated %%	
	H = toeplitz([h.' zeros(1,M-L)],zeros(1,M));
	P = size(a,1);%rows
	r = zeros(M,P);
	s = zeros(M,P);
	
	for k=1:rows(a)
		startTime = time();
		r(k,:) = transmit(a(k,:)');
		s(k,:) = lsqnonneg(H,r(k,:)');
		%s(k,:)%for debugging
		%s(k,:) = minimumSquares(H,r(k,:)')';%
		elapsedTime = time() - startTime;
		printf('k=%d time= %.5f\n',k,elapsedTime);
	endfor
	r = uint8(r);
	s = uint8(s);
	saveImages(r, s);
	imshow(r);
	imshow(s);	
endfunction