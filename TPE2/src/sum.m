%
% inv is 1 to calculate the inverse, -1 otherwise
%
function h = sum(x, l, k,N,inv)
	h = 0;
	exp = (inv)* i * 2 * pi / N;
	for n = 1:N
		for m = 1:N
			h += x(n,m) * e^(exp * (n*l + m*k));
		endfor
	endfor
endfunction
