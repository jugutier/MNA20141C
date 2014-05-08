%Solves the backsustitution problem needed to
%complete minimum squares with Cholesky's decomposition
%G*w = A'*y
%G'*x = w
%parms: A Matrix
%parms: G Cholesky Matrix 
%prams: y Column vector
%return: x Column vector
function x = backSustitution(A, y, G)
	n = columns(A);
	w = zeros(n, 1);
	x = zeros(n, 1);
	temp = (A' * y);%for eficciency
	%We treat the scalar case in a separate way
	%because of how octave handles matrixes.
	if(max(size(temp))==1)
		w = temp/G;
		x = w/G;
	else
		for i=1:n
			w(i) = (temp(i) - G(i, 1:(i - 1)) * w(1:(i - 1))) / G(i, i);
		endfor

		for i=n:-1:1
			x(i) = (w(i) - G'(i, i+1:n ) * x(i+1:n)) / G'(i, i);
		endfor
	endif
endfunction