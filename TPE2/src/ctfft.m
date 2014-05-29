%cooley tukey fast fourier transformed
%N must be a power of 2
%
function X =  ctfft(x,N)
    if(N == 1)      
        X(1)=x(1);
    else
        X(1:N/2) = ctfft(x(1:2:N),N/2);
        X(N/2+1:N) = ctfft(x(2:2:N), N/2);
        k = 1: N/2;
        t = X(k);
        X(k) = t + exp(-2*pi*i* (k-1)/N).*X(k+N/2);
        X(k+N/2) = t - exp(-2*pi*i* (k-1)/N).*X(k+N/2);
    endif
    X= X.';
endfunction