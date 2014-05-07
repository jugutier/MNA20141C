function r = transmit(s)
	global H;
	global L;
	r = H*s;%+ ruido
endfunction