function r = train(S)
	global h;
	global sigma;
	r = S * h;
	r = r + sigma*randn(size(r));
endfunction