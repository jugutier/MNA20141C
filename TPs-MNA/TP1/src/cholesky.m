% This function does Cholesky's decomposition B = G * G'
% Usage: G = cholesky(B);
%
% Authors:
% Yemel Angel Jardi Bello
% Santiago Jose Samra

function G = cholesky(B)  
      
    n = rows(B);
    G = zeros(n, n);
      
    % Preconditions:
    % Positive definite matrix
    if( min(eig(B)) <= 0)
        error("The input matrix is not positive definite\n");
        return;
    endif
    
    % Symmetric matrix
    for i = 1:n
        for j = 1:i-1
            if( B(i,j) != B(j,i) )
                error("The input matrix is not symmetric");
            endif
        endfor
    endfor
    
    % Calculating Cholesky's decomposition
    for i = 1:n
        for j = 1:i-1
            G(i,j) = (B(i,j) - G(i, 1:j-1) * G(j, 1:j-1)' ) / G(j,j);
        endfor
        G(i,i) = sqrt(B(i,i) - sum(G(i, 1:i-1 ).^2));
    endfor

endfunction