function r = train(S)
	global h;
	global sigma;
	S = [S zeros(size(S,1), abs(size(S,2) - length(h)))];
	r = S * h;
	r = r + sigma*randn(size(r));
endfunction