%
%cooley tukey fft2
%known fact:
%fft2(x)-fft(fft(x.').') == 0;
%
function X = ctfft2(x)
    x_ = x;
    x= x(:).';
    N = length(x);
    lowerLimit =1;
    limit =0;
    while(N!=0)
        step = 2^floor(log2(N));
        limit += step;
        X(lowerLimit:limit) = ctfft(x(lowerLimit:limit));
        N -= step;
        lowerLimit = limit +1;
    endwhile
    X=reshape(X,size(x_));
endfunction