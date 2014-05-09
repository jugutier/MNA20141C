%Calculates the error between h_estimated and the
%h of the cannal.
function e = calculatehError(h_estimated)
	global h;
	e = abs(h - [h_estimated; zeros(length(h)-length(h_estimated),1)]);
endfunction