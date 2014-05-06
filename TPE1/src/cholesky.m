function G = cholesky(A)
	G = zeros(size(A));

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