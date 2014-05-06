function r = transmit(s)
	global h;
	global L;
	M = columns(s);
	printf('transmit M = %d L = %d\n',M, L);
	H = toeplitz([zeros(1,M-L) h'],zeros(1,M));%this is H original, using global h.
	r = H*s;%+ ruido
endfunction