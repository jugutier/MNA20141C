function x = minimumSquares(A, y)
	load cholesky.m;
	G = cholesky(A' * A);
	n= columns(A);
	w = zeros(n, 1);
	x = zeros(n, 1);

	for i=1:n
		w(i) = ((A' * y)(i) - G(i, 1:(i - 1)) * w(1:(i-1))) / G(i, i);
	endfor

	for i=n:-1:1
		x(i) = (w(i) - G'(i, i+1:n ) * x(i+1:n)) / G'(i, i);
	endfor
endfunction