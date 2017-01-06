function dataset = normaliseData(rawData)
% Normalise data in a dataset between the min and max values of a column
% in a passed in matrix.  Will output the results between 0 and 1.
%
% Example:
%   normalisedDataset = normaliseData(trn1);
%

normData = zeros(size(rawData, 1), 18);

% Loop through each of the 17 dimensions normalising within each column.
for i = 1:17
    dimMin = min(rawData(:,i));
    dimMax = max(rawData(:,i));
    normData(:,i) = mat2gray(rawData(:,i), [dimMin, dimMax]);
end

% Create the second of the two classifications where they are the inverse
% of each other.
normData(:,18) = not(normData(:,17));

% Output result
dataset = normData;
