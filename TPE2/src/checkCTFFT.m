%Compares ctfft2 with fft2 from octave
%and returns error 
function e = checkCTFFT()
	x = loadData('../data/saturn');
	A = fft2(x);
	B = ctfft2(x);
	e = meanError(A,B);
endfunction