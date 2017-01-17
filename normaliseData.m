function [trnDataSet, tstDataSet] = normaliseData(rawTrnData, rawTstData)
% Normalise data in a dataset between the min and max values of a column
% in a passed in matrix.  Will output the results between 0 and 1.
%
% Example:
%   normalisedDataset = normaliseData(trn1);
%
% Author : Harsharan Nijjar
%

normTrnData = zeros(size(rawTrnData, 1), 18);
normTstData = zeros(size(rawTstData, 1), 18);

% Loop through each of the 17 dimensions normalising within each column.
for i = 1:17
    dimMin = min([min(rawTrnData(:,i)), min(rawTstData(:,i))]);
    dimMax = max([max(rawTrnData(:,i)), max(rawTrnData(:,i))]);
    normTrnData(:,i) = mat2gray(rawTrnData(:,i), [dimMin, dimMax]);
    normTstData(:,i) = mat2gray(rawTstData(:,i), [dimMin, dimMax]);
end

% Create the second of the two classifications where they are the inverse
% of each other.
normTrnData(:,18) = not(normTrnData(:,17));
normTstData(:,18) = not(normTstData(:,17));

% Output result
trnDataSet = normTrnData;
tstDataSet = normTstData;
end