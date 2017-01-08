function [trainOutput, testOutput] = runExperiment(trainingData, testData, numOfRuns)
%
%
%

% Initialise
hiddenNodeOptions = [5 15 25 35 45 55];
trainingAlgoOptions = {'trainlm' 'trainscg' 'trainrp'};
trainOutputData = cell(size(hiddenNodeOptions, 2) * size(trainingAlgoOptions, 2) * numOfRuns, 11);
testOutputData = cell(size(hiddenNodeOptions, 2) * size(trainingAlgoOptions, 2) * numOfRuns, 8);

i = 0;

for hNodes = hiddenNodeOptions

    for nRun = 1:numOfRuns
        % weights -1 to 1
        % randomWeights = -1 + (1+1)*rand((16+2)*hiddenLayerNodes, hiddenLayerNodes);
        % weights 0 to 1
        randomWeights = rand((16+2)*hNodes, hNodes);
    
        for trAlgo = trainingAlgoOptions

            i = i + 1;
            % train net
            [net, tr, c, cm, netx, nett] = trainFeedFwdNet(trainingData.', hNodes, trAlgo{1}, randomWeights);
            
            % store results
            trainOutputData(i,:) = {hNodes, nRun, trAlgo{1}, c, ...
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
            testOutputData(i,:) = {hNodes, nRun, trAlgo{1}, c, cm(1,1), cm(1,2), cm(2,1), cm(2,2)};

        end
        
    end
    
end

% output experiment data
trainOutput = trainOutputData;
testOutput = testOutputData;

end