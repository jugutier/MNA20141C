%%%
%Decomposes matrix A into matrix G with Cholesky's decomposition.
function G = cholesky(A)
	G = zeros(size(A));

%	if(min(eig(A)) <= 0)
%		error('Matrix is not positive definite.');
%	endif

	for j = 1:columns(A)
		G(j, j) = sqrt(A(j,j) - sum(G(j, 1:(j-1)).^2));

		for i = (j+1):rows(A)
			G(i, j) = (A(i, j) - sum(G(i, 1:(j-1)) .* G(j, 1:(j-1)))) / G(j,j);
		endfor
	endfor
endfunction