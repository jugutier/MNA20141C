%Simulates the whole canal transmition problem.
%Note that the h used here is not global, we want to find it.
function simulation()
	global L;

	a = double(imread('../img/lena512.bmp'));
	E = 512;
	M = size(a,2);%columns
	initializeCannal(M);
	%% First Part: Estimate h given a sequence of known bytes %%	
	h = estimateh(E,M);
	%% Second Part: transmit image and retrieve it with the h we estimated %%
	hTrainReceived = [h.' zeros(1,M-L)];	
	H = toeplitz(hTrainReceived,zeros(1,M));
	P = size(a,1);%rows
	r = zeros(M,P);
	s = zeros(M,P);

	G = cholesky(H' * H);

	for k=1:rows(a)
		startTime = time();
		r(k,:) = transmit(a(k,:)')';
		s(k,:) = backSustitution(H,r(k,:)',G)';
		elapsedTime = time() - startTime;
		printf('k=%d time= %.5f\n',k,elapsedTime);
	endfor
	r = uint8(r);
	s = uint8(s);
	%saveImages(r, s);
	figure(1);
	imshow(r);
	figure(2);
	imshow(s);	
endfunction