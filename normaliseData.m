function dataset = normaliseData(rawData)
% Normalise data in a dataset between the min and max values of a column
% in a passed in matrix.  Will output the results between 0 and 1.
%
% Example:
%   normalisedDataset = normaliseData(trn1);
%

newData = rawData;

% Loop through each of the 17 dimensions normalising within each column.
for i = 1:17
    dimMin = min(rawData(:,i));
    dimMax = max(rawData(:,i));
    newData(:,i) = mat2gray(rawData(:,i), [dimMin, dimMax]);
end

% Output result
dataset = newData;
