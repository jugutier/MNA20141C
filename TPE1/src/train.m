%This function simulates the passage
%of the train sequence through the channel.
%params: S the toeplitz matrix containing the train sequence.
%observations: it forces the passage of S
%by taking less elements of h(unknown) if it has to.
%return: r what you would receive on the other end of the channel.
function r = train(S)
	global h;
	global sigma;
	r = S * h(1: size(S,2));
	r = r + sigma*randn(size(r));
endfunction