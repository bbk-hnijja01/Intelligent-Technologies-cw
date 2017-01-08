function [trainOutput, testOutput] = runExperiment(trainingData, testData, numOfRuns)
%
%
%

% Initialise
hiddenNodeOptions = [5 15 25 35 45 55];
trainingAlgoOptions = ['trainlm' 'trainscg' 'trainrp'];
trainOutputData = zeros(size(hiddenNodeOptions, 2) * size(trainingAlgoOptions, 2) * numOfRuns, 7);

i = 0;

for hNodes = hiddenNodeOptions
    
    % weights -1 to 1
    % randomWeights = -1 + (1+1)*rand((16+2)*hiddenLayerNodes, hiddenLayerNodes);
    % weights 0 to 1
    randomWeights = rand((16+2)*hNodes, hNodes);
    
    for trAlgo = trainingAlgoOptions

        for nRun = 1:numOfRuns
            i = i + 1;
            % train net
            [net, tr, c, cm, netx, nett] = trainFeedFwdNet(trainingData.', hNodes, trAlgo, randomWeights);
            
            % store results
            trainOutputData(i,:) = [hNodes, trAlgo, c, cm(1,1), cm(1,2), cm(2,1), cm(2,2)];

            % test net
            testDataTrans = testData.';

            testX = testDataTrans(1:16,:);
            testT = testDataTrans(17:18,:);

            testY = net(testX);

            testIndices = vec2ind(testY);

            % plotconfusion(testT,testY);

            [c,cm] = confusion(testT,testY);

            % store results
            testOutputData(i,:) = [hNodes, trAlgo, c, cm(1,1), cm(1,2), cm(2,1), cm(2,2)];

        end
        
    end
    
end

% output experiment data
trainOutput = trainOutputData;
testOutput = testOutputData;

end