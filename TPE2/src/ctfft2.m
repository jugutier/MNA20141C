%
%cooley tukey fft2
%known fact:
%fft2(x)-fft(fft(x).').'== 0;
%
function X = ctfft2(x)
    X = ctfft(ctfft(x).').';
endfunction