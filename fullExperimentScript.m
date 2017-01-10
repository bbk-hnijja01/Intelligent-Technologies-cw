
fullNoOfRuns = 2;
ResultsDirectory = strcat('Results', datestr(datetime('now'), 'yyyyMMddhhmm'));
status = mkdir(ResultsDirectory);

fprintf('Running frame 1\n');
[trn1Res, tst1Res] = runExperiment(trn1n, tst1n, fullNoOfRuns);
trn1Table = cell2table(trn1Res, 'VariableNames', ...
    {'HiddenNodes', 'Run', 'TraingingAlgo', 'c', 'c11', 'c12', 'c21', 'c22', 'EpochsRun', 'BestEpoch', 'BestPerf'});
writetable(trn1Table, strcat(ResultsDirectory, '/', 'Fr1TrnResults.dat'));
tst1Table = cell2table(tst1Res, 'VariableNames', ...
    {'HiddenNodes', 'Run', 'TraingingAlgo', 'c', 'c11', 'c12', 'c21', 'c22'});
writetable(tst1Table, strcat(ResultsDirectory, '/', 'Fr1TstResults.dat'));

fprintf('Running frame 2\n');
[trn2Res, tst2Res] = runExperiment(trn2n, tst2n, fullNoOfRuns);
trn2Table = cell2table(trn2Res, 'VariableNames', ...
    {'HiddenNodes', 'Run', 'TraingingAlgo', 'c', 'c11', 'c12', 'c21', 'c22', 'EpochsRun', 'BestEpoch', 'BestPerf'});
writetable(trn2Table, strcat(ResultsDirectory, '/', 'Fr2TrnResults.dat'));
tst2Table = cell2table(tst2Res, 'VariableNames', ...
    {'HiddenNodes', 'Run', 'TraingingAlgo', 'c', 'c11', 'c12', 'c21', 'c22'});
writetable(tst2Table, strcat(ResultsDirectory, '/', 'Fr2TstResults.dat'));

fprintf('Running frame 3\n');
[trn3Res, tst3Res] = runExperiment(trn3n, tst3n, fullNoOfRuns);
trn3Table = cell2table(trn3Res, 'VariableNames', ...
    {'HiddenNodes', 'Run', 'TraingingAlgo', 'c', 'c11', 'c12', 'c21', 'c22', 'EpochsRun', 'BestEpoch', 'BestPerf'});
writetable(trn3Table, strcat(ResultsDirectory, '/', 'Fr3TrnResults.dat'));
tst3Table = cell2table(tst3Res, 'VariableNames', ...
    {'HiddenNodes', 'Run', 'TraingingAlgo', 'c', 'c11', 'c12', 'c21', 'c22'});
writetable(tst3Table, strcat(ResultsDirectory, '/', 'Fr3TstResults.dat'));

fprintf('Running frame 4\n');
[trn4Res, tst4Res] = runExperiment(trn4n, tst4n, fullNoOfRuns);
trn4Table = cell2table(trn4Res, 'VariableNames', ...
    {'HiddenNodes', 'Run', 'TraingingAlgo', 'c', 'c11', 'c12', 'c21', 'c22', 'EpochsRun', 'BestEpoch', 'BestPerf'});
writetable(trn4Table, strcat(ResultsDirectory, '/', 'Fr4TrnResults.dat'));
tst4Table = cell2table(tst4Res, 'VariableNames', ...
    {'HiddenNodes', 'Run', 'TraingingAlgo', 'c', 'c11', 'c12', 'c21', 'c22'});
writetable(tst4Table, strcat(ResultsDirectory, '/', 'Fr4TstResults.dat'));

fprintf('Running frame 5\n');
[trn5Res, tst5Res] = runExperiment(trn5n, tst5n, fullNoOfRuns);
trn5Table = cell2table(trn5Res, 'VariableNames', ...
    {'HiddenNodes', 'Run', 'TraingingAlgo', 'c', 'c11', 'c12', 'c21', 'c22', 'EpochsRun', 'BestEpoch', 'BestPerf'});
writetable(trn5Table, strcat(ResultsDirectory, '/', 'Fr5TrnResults.dat'));
tst5Table = cell2table(tst5Res, 'VariableNames', ...
    {'HiddenNodes', 'Run', 'TraingingAlgo', 'c', 'c11', 'c12', 'c21', 'c22'});
writetable(tst5Table, strcat(ResultsDirectory, '/', 'Fr5TstResults.dat'));

fprintf('Running frame 6\n');
[trn6Res, tst6Res] = runExperiment(trn6n, tst6n, fullNoOfRuns);
trn6Table = cell2table(trn6Res, 'VariableNames', ...
    {'HiddenNodes', 'Run', 'TraingingAlgo', 'c', 'c11', 'c12', 'c21', 'c22', 'EpochsRun', 'BestEpoch', 'BestPerf'});
writetable(trn6Table, strcat(ResultsDirectory, '/', 'Fr6TrnResults.dat'));
tst6Table = cell2table(tst6Res, 'VariableNames', ...
    {'HiddenNodes', 'Run', 'TraingingAlgo', 'c', 'c11', 'c12', 'c21', 'c22'});
writetable(tst6Table, strcat(ResultsDirectory, '/', 'Fr6TstResults.dat'));

fprintf('Running frame 7\n');
[trn7Res, tst7Res] = runExperiment(trn7n, tst7n, fullNoOfRuns);
trn7Table = cell2table(trn7Res, 'VariableNames', ...
    {'HiddenNodes', 'Run', 'TraingingAlgo', 'c', 'c11', 'c12', 'c21', 'c22', 'EpochsRun', 'BestEpoch', 'BestPerf'});
writetable(trn7Table, strcat(ResultsDirectory, '/', 'Fr7TrnResults.dat'));
tst7Table = cell2table(tst7Res, 'VariableNames', ...
    {'HiddenNodes', 'Run', 'TraingingAlgo', 'c', 'c11', 'c12', 'c21', 'c22'});
writetable(tst7Table, strcat(ResultsDirectory, '/', 'Fr7TstResults.dat'));

fprintf('Completed experiment run\n');

