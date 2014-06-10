function X = ictfft2(x)
    X = ictfft(ictfft(x).').';
endfunction