%
% Author : Harsharan Nijjar
% Date : 17 January 2017
function [trainOutput, testOutput] = runExperiment(trainingData, testData, ...
    numOfLayers, numOfRuns)
% runExperiment calls trainFeedFwdNet for the different configurations that
% are to be run for number of hidden nodes, training algorithms, and for
% the number of runs passed in.  It performs this for the training and
% testing dataset passed in.
%
% trainingData : trainging dataset
% testData : dataset for testing the trained ANN
% numOfRuns : number of times to create a ANN and store the results
%
% Example
%   [trn1Res, tst1Res] = runExperiment(trn1n, tst1n, 30)
%
% Author : Harsharan Nijjar
%

% Initialise 
if numOfLayers == 1
    hiddenNodeOptions = [5 15 25 35 45 55];
elseif numOfLayers == 2
    hiddenNodeOptions = [5 15 25 35 45];
else
    hiddenNodeOptions = [5 15 25];
end
trainingAlgoOptions = {'trainlm' 'trainscg' 'trainrp'};
trainOutputData = ...
    cell(size(hiddenNodeOptions, 2) * size(trainingAlgoOptions, 2) * numOfRuns, 12);
testOutputData = ...
    cell(size(hiddenNodeOptions, 2) * size(trainingAlgoOptions, 2) * numOfRuns, 9);
layerNodes = zeros(1, numOfLayers);

i = 0;

for hNodes = hiddenNodeOptions
    fprintf('Running %d nodes : %s\n', hNodes, datestr(datetime('now'), 'HH:MM:SS'));
    for iLayer = 1:numOfLayers
        layerNodes(1, iLayer) = hNodes;
    end

    % Seed the random generated numbers so that the same starting weights are
    % used for each hidden layer config.
    rng('default');
    rng(12345);

    for nRun = 1:numOfRuns
        % weights -1 to 1
        % randomWeights = -1 + (1+1)*rand((16+2)*hiddenLayerNodes, hiddenLayerNodes);
        % weights 0 to 1
        randomWeights = rand((16+2)*hNodes, hNodes);
    
        for trAlgo = trainingAlgoOptions

            i = i + 1;
            % train net
%             [net, tr, c, cm, netx, nett] = ...
%                 trainFeedFwdNet(trainingData.', hNodes, trAlgo{1}, randomWeights);
            [net, tr, c, cm, netx, nett] = ...
                trainFeedFwdNet(trainingData.', layerNodes, trAlgo{1}, randomWeights);
            
            % store results
            trainOutputData(i,:) = {hNodes, nRun, trAlgo{1}, 1-c, c, ...
                cm(1,1), cm(1,2), cm(2,1), cm(2,2), ...
                tr.num_epochs, tr.best_epoch, tr.best_perf};

            % test net
            testDataTrans = testData.';

            testX = testDataTrans(1:16,:);
            testT = testDataTrans(17:18,:);

            testY = net(testX);

            testIndices = vec2ind(testY);

            % plotconfusion(testT,testY);

            [c,cm] = confusion(testT,testY);

            % store results
            testOutputData(i,:) = {hNodes, nRun, trAlgo{1}, 1-c, c, ...
                                    cm(1,1), cm(1,2), cm(2,1), cm(2,2)};

        end
        
    end
    
end

% output experiment data
trainOutput = trainOutputData;
testOutput = testOutputData;

end