function h = sumaInv(x, l, k)
	h = 0;
	N = columns(x);
	exp = i * 2 * pi / N;
	for n = 1:N
		for m = 1:N
			h += x(n,m) * e^(exp * (n*l + m*k));
		endfor
	endfor
endfunction
