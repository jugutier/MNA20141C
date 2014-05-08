%Simulates the initializacion of the communications cannal
%params: M columns of the image to be sent.
function  initializeCannal(M)
	global h;
	global L;
	global H;
	global sigma;
	sigma = 0.00;
	L = 5;
	ganancia = 1/10;
	h = ganancia * (1+randn(L,1));%%this h is unknown, we want to estimate it.	
	H = toeplitz([h.' zeros(1,M-L)],zeros(1,M));
endfunction