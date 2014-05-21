%
% x = Fourier transformed of a discrete binomial sequence Inverse(fftdbiInv)
%
function x = ffdtbiInv(X)
	N = columns(x);
	for i=1:N-1
		for j=1:N-1
			x(i,j) = sum(X, i, j,N,1);
		endfor
	endfor
	x = x * (1/(N^2));
endfunction