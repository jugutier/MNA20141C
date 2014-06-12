%cooley tukey fast fourier transformed/inverse
%in the case of a matrix performs fft over each column
%if dimentions are not power of two a proper amount of zeroes will be used
%to fill up to the next power and trim on the output, so the user won't notice.
%
%inverse is 1 when calculating the inverse. -1 otherwise
%
function X = core(x , inv_)
    [n m] = size(x);
    X = zeros(n,m);
    for k = 1:m
        X(:,k)= ctfftCore(x(:,k),n,inv_);
    endfor
    if(inv_ == 1)
        X = X/n;
    endif
endfunction

function X =  ctfftCore(x,N,inv_)
    if(N == 25)      
        %X(1)=x(1);
        col = exp(inv_*2*pi*i* (0:N-1)/N).';
        V = vander(col,N);
        X = x.'*V;
        X = fliplr(X);
    else
        X(1:N/2) = ctfftCore(x(1:2:N),N/2,inv_);
        X(N/2+1:N) = ctfftCore(x(2:2:N),N/2,inv_);
        k = 1: N/2;
        t = X(k);
        X(k) = t + exp(inv_*2*pi*i* (k-1)/N).*X(k+N/2);
        X(k+N/2) = t - exp(inv_*2*pi*i* (k-1)/N).*X(k+N/2);
    endif
endfunction 