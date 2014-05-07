function e = calculatehError(h_estimated)
	global h;

	e = abs(h - h_estimated);
endfunction