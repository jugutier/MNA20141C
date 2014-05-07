%%%
%Decomposes matrix A into matrix G with Cholesky's decomposition.
function G = cholesky(A)
	G = zeros(size(A));

	if(min(eig(A)) <= 0)
		error('Matrix is not positive definite.');
	endif

	for j = 1:columns(A)
		for i = (j):rows(A)
			if i == j
				G(j, j) = sqrt(A(j,j) - sum(G(j, 1:(j-1)).^2));
			else
				G(i, j) = (A(i, j) - sum(G(i, 1:(j-1)) .* G(j, 1:(j-1)))) / G(j,j);
			endif
		endfor
	endfor
endfunction