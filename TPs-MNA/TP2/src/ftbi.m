function X = fftbi(x)
	for i=1:columns(x)-1
		for j=1:columns(x)-1
			X(i,j) = suma(x,i,j);
		endfor
	endfor
endfunction
