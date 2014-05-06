function  initializeGlobals()
	global h;
	global L;
	L = 3;
	ganancia = 1/10;
	h = ganancia * (1+randn(L,1));
endfunction