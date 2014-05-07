%Simulates the whole canal transmition problem.
%Note that the h used here is not global, we want to find it.
function simulation()
	global L;

	a = double(imread('../img/lena512.bmp'));
	E = 512;
	%M = size(a,2);%columns
	M = size(a,2)/16;

	initializeCannal(M);
	%% First Part: Estimate h given a sequence of known bytes %%	
	h = estimateh(E,M)
	%% Second Part: transmit image and retrieve it with the h we estimated %%
	H = toeplitz([h.' zeros(1,M-L)],zeros(1,M));
	P = size(a,1);%rows
	r = zeros(M,P);
	s = zeros(M,P);
	G = cholesky(H' * H);

	for k=1:rows(a)
		startTime = time();
		for l = 1:16
			ii = (l-1)*M+1:l*M;
			r(k,ii) = transmit(a(k,ii)');
			s(k,ii) = backSustitution(H,r(k,ii)',G)';
%			s(k,ii) = (H\r(k,ii)')';
		endfor
		elapsedTime = time() - startTime;
		printf('k=%d time= %.5f\n',k,elapsedTime);
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