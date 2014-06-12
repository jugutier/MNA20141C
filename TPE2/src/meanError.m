%Calculates mean square error between two grayscale images (in the form of matrixes) of the same size
function e = meanError(A,B)
	[n m] = size(A);
	e = abs(sum(sum((double(A) - double(B)) .^ 2))/(n*m));
endfunction