% This function does forward sustitution to solve A x = b,
% A being lower triangular.
% Usage: x = backsustitution(A, b);
%
% Authors:
% Yemel Angel Jardi Bello
% Santiago Jose Samra

function x = forwardsustitution(A, b)

    % Expressing forward sustitution as backsustitution
    x = rot90(backsustitution(rot90(A,2), rot90(b,2)),2);
    
endfunction