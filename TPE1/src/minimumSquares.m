function x = minimumSquares(A, y, G)
	%load cholesky.m;
	
	%G = cholesky(A' * A);
	%w = zeros(columns(A), 1);
	%x = zeros(columns(A), 1);

	%for i=1:length(w)
	%	w(i) = ((A' * y)(i) - G(i, 1:(i - 1)) * w(1:(i-1))) / G(i, i);
	%endfor

	%l = length(x);

	%for i=l:-1:1
	%	x(i) = (w(i) - G'(i, i+1:l ) * x(i+1:l)) / G'(i, i);
	%endfor

	w = inv(G) * A' * y;
	x = inv(G') * w;
endfunction