function x = fftbiInv(X)
	for i=1:columns(X)-1
		for j=1:columns(X)-1
			x(i,j) = sumaInv(X, i, j);
		endfor
	endfor
	x = x * (1/(columns(X)^2));
endfunction