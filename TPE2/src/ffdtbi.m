%
% X = Fourier transformed of a discrete binomial sequence (fftdbi)
%
function X = fftdbi(x)
	N = columns(x);
	for i=1:N-1
		for j=1:N-1
			X(i,j) = sum(x,i,j,N,-1);
		endfor
	endfor
endfunction
