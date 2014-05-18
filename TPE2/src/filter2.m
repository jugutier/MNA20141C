function H = filter2()
    H = zeros(400, 400);
    for i=1:400
        for j=1:400
            H(i,j) = exp(-0.01*(i^2 + j^2));
        endfor
    endfor
endfunction
