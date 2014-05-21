function H = onesFilter()
    H = ones(400, 400);
    for i=1:400
        for j=190:210
            H(i,j) = 0;
        endfor
    endfor

    for i=190:210
        for j=1:400
            H(i,j) = 0;
        endfor
    endfor

endfunction
