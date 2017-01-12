% Script to process full data set in one go
% 

% Load data files
trnFull = importfile('../endoscopy-video-frames-data/fulltrn.txt', 1, 2100);
tstFull = importfile('../endoscopy-video-frames-data/fulltst.txt', 1, 26047);

[trnFulln, tstFulln] = normaliseData(trnFull, tstFull);

fprintf('Start Time : %s\n', datetime('now'));
fullNoOfRuns = 30;
ResultsDirectory = strcat('Results', datestr(datetime('now'), 'yyyymmddHHMM'));
status = mkdir(ResultsDirectory);
fprintf('%s created - status = %d\n', ResultsDirectory, status);

fprintf('Running all frames\n');
[trnFullRes, tstFullRes] = runExperiment(trnFulln, tstFulln, fullNoOfRuns);
trnFullTable = cell2table(trnFullRes, 'VariableNames', ...
    {'HiddenNodes', 'Run', 'TraingingAlgo', 'Correct', 'Incorrect', 'c11', 'c12', 'c21', 'c22', 'EpochsRun', 'BestEpoch', 'BestPerf'});
writetable(trnFullTable, strcat(ResultsDirectory, '/', 'FullTrnResults.csv'));
tstFullTable = cell2table(tstFullRes, 'VariableNames', ...
    {'HiddenNodes', 'Run', 'TraingingAlgo', 'Correct', 'Incorrect', 'c11', 'c12', 'c21', 'c22'});
writetable(tstFullTable, strcat(ResultsDirectory, '/', 'FullTstResults.csv'));

fprintf('Completed full run\n');

fprintf('End Time : %s\n', datetime('now'));
