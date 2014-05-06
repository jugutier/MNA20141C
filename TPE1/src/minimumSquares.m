function x = minimumSquares(A, y)
	load cholesky.m;
	G = cholesky(A' * A);
	w = zeros(columns(A), 1);
	x = zeros(columns(A), 1);

	for i=1:length(w)
		w(i) = ((A' * y)(i) - G(i, 1:(i - 1)) * w(1:(i-1))) / G(i, i);
	endfor

	for i=length(x):-1:1
		x(i) = (w(i) - G'(i, i+1:length(x) ) * x(i+1:length(x))) / G'(i, i);
	endfor
endfunction