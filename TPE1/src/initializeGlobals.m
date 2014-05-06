function  initializeGlobals(M)
	global h;
	global L;
	global H;
	L = 3;
	ganancia = 1/10;
	h = ganancia * (1+randn(L,1));%%this h is unknown, we want to estimate it.	
	H = toeplitz([h.' zeros(1,M-L)],zeros(1,M));
endfunction