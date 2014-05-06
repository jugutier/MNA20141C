% This function does back sustitution to solve A x = b,
% A being upper triangular.
% Usage: x = backsustitution(A, b);
%
% Authors:
% Yemel Angel Jardi Bello
% Santiago Jose Samra

function x = backsustitution(A, b)

% A must be upper triangular

for i=1:columns(A)
    for j=1:i-1
        if( A(i,j) != 0)
            error("The input matrix must be upper triangular\n");
        endif
    endfor
endfor

% Must happen that rows(b) == rows(A);

if( rows(b) != rows(A))
    error("The amount of rows of A and b are incompatible\n");
endif

n = rows(A);
x = zeros(n, 1);

    for i = n:-1:1
        x(i) = ( b(i) + sum( -A(i, i+1:n) * x(i+1:n) ) ) / A(i, i);
    endfor

endfunction