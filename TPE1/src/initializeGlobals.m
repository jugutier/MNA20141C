function  initializeGlobals()
	global h;
	global L;
	L = 3;
	ganancia = 1/10;
	h = ganancia * (1+randn(L,1));%%this h is unknown, we want to estimate it.
endfunction