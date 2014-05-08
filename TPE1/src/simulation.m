%Simulates the whole canal transmition problem.
%Note that the h used here is not global, we want to find it.
function simulation()
	global L;

	format long;

	original = imread('../img/lena512.bmp');
	a = double(original);
	E = 512;
	chunk_amount = 16;
	M = size(a,2) / chunk_amount;

	initializeCannal(M);
	%% First Part: Estimate h given a sequence of known bytes %%	
	h = estimateh(E,M);
	e = calculatehError(h)
	%% Second Part: transmit image and retrieve it with the h we estimated %%
	H = toeplitz([h.' zeros(1,M-L)],zeros(1,M));
	P = size(a,1);
	r = zeros(M,P);
	s = zeros(M,P);
	G = cholesky(H' * H);

	for k=1:rows(a)
		k
		fflush(stdout);
		for l = 1:chunk_amount
			ii = (l-1)*M+1:l*M;			
			r(k,ii) = transmit(a(k,ii)');
			s(k,ii) = backSustitution(H,r(k,ii)',G)';
		endfor
	endfor
	r = uint8(r);
	s = uint8(s);
	saveImages(r, s);
	figure(1);
	imshow(original);
	title('Original image');
	figure(2);
	imshow(r);
	title('Received image');
	figure(3);
	imshow(s);
	title('Corrected image');	
endfunction