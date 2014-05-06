function r = transmit(s,M)
	global h;
	global L;
	%M = columns(s);
	%%printf('transmit M = %d L = %d\n',M, L);
	H = toeplitz([h.' zeros(1,M-L)],zeros(1,M));%this is H original, using global h.
	r = H*s';%+ ruido
endfunction