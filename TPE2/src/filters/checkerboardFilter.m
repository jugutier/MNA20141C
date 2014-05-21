%
% H will have the shape of a checkerboard, black and white 'squares'.
%
function H = checkerboardFilter()
    H = zeros(400, 400);
    for i=1:400
        for j=1:400
            H(i,j) = mod(i+j, 2);
        endfor
    endfor

endfunction