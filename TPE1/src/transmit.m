%%%%%%%
%Simulates the transmition of sequence s through a canal.
%params: s, column vector. The sequence.
%return: r, column vector. What you receive.
function r = transmit(s)
	global H;
	global L;
	r = H*s;%+ ruido
endfunction