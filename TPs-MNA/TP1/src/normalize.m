% This function normalizes the input data
%
% Authors:
% Yemel Angel Jardi Bello
% Santiago Jose Samra

function stats = normalize(rawData)

firstCol = rawData(:,1);
secondCol = rawData(:,2);

stats = [ (firstCol .- mean(firstCol)) ./ std(firstCol) secondCol];

endfunction