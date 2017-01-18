%
% Author : Harsharan Nijjar
% Date : 17 January 2017
% Script to run all 7 frames of data and store results to csv files.
%

fprintf('Start Time : %s\n', datetime('now')); 
fullNoOfRuns = 30;
numOfLayers = 1;
network = 'pattern'; % feedfwd or pattern
ResultsDirectory = strcat('Results', datestr(datetime('now'), 'yyyymmddHHMM'), 'L', int2str(numOfLayers), network(1));
status = mkdir(ResultsDirectory);
fprintf('%s created - status = %d\n', ResultsDirectory, status);

fprintf('Running frame 1\n');
[trn1Res, tst1Res] = runExperiment(network, trn1n, tst1n, numOfLayers, fullNoOfRuns);
trn1Table = cell2table(trn1Res, 'VariableNames', ...
    {'HiddenNodes', 'Run', 'TraingingAlgo', 'Correct', 'Incorrect', 'c11', 'c12', 'c21', 'c22', 'EpochsRun', 'BestEpoch', 'BestPerf'});
writetable(trn1Table, strcat(ResultsDirectory, '/', 'Fr1TrnResults.csv'));
tst1Table = cell2table(tst1Res, 'VariableNames', ...
    {'HiddenNodes', 'Run', 'TraingingAlgo', 'Correct', 'Incorrect', 'c11', 'c12', 'c21', 'c22'});
writetable(tst1Table, strcat(ResultsDirectory, '/', 'Fr1TstResults.csv'));

fprintf('Running frame 2\n');
[trn2Res, tst2Res] = runExperiment(network, trn2n, tst2n, numOfLayers, fullNoOfRuns);
trn2Table = cell2table(trn2Res, 'VariableNames', ...
    {'HiddenNodes', 'Run', 'TraingingAlgo', 'Correct', 'Incorrect', 'c11', 'c12', 'c21', 'c22', 'EpochsRun', 'BestEpoch', 'BestPerf'});
writetable(trn2Table, strcat(ResultsDirectory, '/', 'Fr2TrnResults.csv'));
tst2Table = cell2table(tst2Res, 'VariableNames', ...
    {'HiddenNodes', 'Run', 'TraingingAlgo', 'Correct', 'Incorrect', 'c11', 'c12', 'c21', 'c22'});
writetable(tst2Table, strcat(ResultsDirectory, '/', 'Fr2TstResults.csv'));

fprintf('Running frame 3\n');
[trn3Res, tst3Res] = runExperiment(network, trn3n, tst3n, numOfLayers, fullNoOfRuns);
trn3Table = cell2table(trn3Res, 'VariableNames', ...
    {'HiddenNodes', 'Run', 'TraingingAlgo', 'Correct', 'Incorrect', 'c11', 'c12', 'c21', 'c22', 'EpochsRun', 'BestEpoch', 'BestPerf'});
writetable(trn3Table, strcat(ResultsDirectory, '/', 'Fr3TrnResults.csv'));
tst3Table = cell2table(tst3Res, 'VariableNames', ...
    {'HiddenNodes', 'Run', 'TraingingAlgo', 'Correct', 'Incorrect', 'c11', 'c12', 'c21', 'c22'});
writetable(tst3Table, strcat(ResultsDirectory, '/', 'Fr3TstResults.csv'));

fprintf('Running frame 4\n');
[trn4Res, tst4Res] = runExperiment(network, trn4n, tst4n, numOfLayers, fullNoOfRuns);
trn4Table = cell2table(trn4Res, 'VariableNames', ...
    {'HiddenNodes', 'Run', 'TraingingAlgo', 'Correct', 'Incorrect', 'c11', 'c12', 'c21', 'c22', 'EpochsRun', 'BestEpoch', 'BestPerf'});
writetable(trn4Table, strcat(ResultsDirectory, '/', 'Fr4TrnResults.csv'));
tst4Table = cell2table(tst4Res, 'VariableNames', ...
    {'HiddenNodes', 'Run', 'TraingingAlgo', 'Correct', 'Incorrect', 'c11', 'c12', 'c21', 'c22'});
writetable(tst4Table, strcat(ResultsDirectory, '/', 'Fr4TstResults.csv'));

fprintf('Running frame 5\n');
[trn5Res, tst5Res] = runExperiment(network, trn5n, tst5n, numOfLayers, fullNoOfRuns);
trn5Table = cell2table(trn5Res, 'VariableNames', ...
    {'HiddenNodes', 'Run', 'TraingingAlgo', 'Correct', 'Incorrect', 'c11', 'c12', 'c21', 'c22', 'EpochsRun', 'BestEpoch', 'BestPerf'});
writetable(trn5Table, strcat(ResultsDirectory, '/', 'Fr5TrnResults.csv'));
tst5Table = cell2table(tst5Res, 'VariableNames', ...
    {'HiddenNodes', 'Run', 'TraingingAlgo', 'Correct', 'Incorrect', 'c11', 'c12', 'c21', 'c22'});
writetable(tst5Table, strcat(ResultsDirectory, '/', 'Fr5TstResults.csv'));

fprintf('Running frame 6\n');
[trn6Res, tst6Res] = runExperiment(network, trn6n, tst6n, numOfLayers, fullNoOfRuns);
trn6Table = cell2table(trn6Res, 'VariableNames', ...
    {'HiddenNodes', 'Run', 'TraingingAlgo', 'Correct', 'Incorrect', 'c11', 'c12', 'c21', 'c22', 'EpochsRun', 'BestEpoch', 'BestPerf'});
writetable(trn6Table, strcat(ResultsDirectory, '/', 'Fr6TrnResults.csv'));
tst6Table = cell2table(tst6Res, 'VariableNames', ...
    {'HiddenNodes', 'Run', 'TraingingAlgo', 'Correct', 'Incorrect', 'c11', 'c12', 'c21', 'c22'});
writetable(tst6Table, strcat(ResultsDirectory, '/', 'Fr6TstResults.csv'));

fprintf('Running frame 7\n');
[trn7Res, tst7Res] = runExperiment(network, trn7n, tst7n, numOfLayers, fullNoOfRuns);
trn7Table = cell2table(trn7Res, 'VariableNames', ...
    {'HiddenNodes', 'Run', 'TraingingAlgo', 'Correct', 'Incorrect', 'c11', 'c12', 'c21', 'c22', 'EpochsRun', 'BestEpoch', 'BestPerf'});
writetable(trn7Table, strcat(ResultsDirectory, '/', 'Fr7TrnResults.csv'));
tst7Table = cell2table(tst7Res, 'VariableNames', ...
    {'HiddenNodes', 'Run', 'TraingingAlgo', 'Correct', 'Incorrect', 'c11', 'c12', 'c21', 'c22'});
writetable(tst7Table, strcat(ResultsDirectory, '/', 'Fr7TstResults.csv'));

fprintf('Completed experiment run\n');

fprintf('End Time : %s\n', datetime('now'));
