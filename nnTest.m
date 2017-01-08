
% trn1trans = trn1n.';
% netx = trn1trans(1:16,:);
% nett = trn1trans(17:18,:);

hiddenLayerNodes = 15;

% weights -1 to 1
% randomWeights = -1 + (1+1)*rand((16+2)*hiddenLayerNodes, hiddenLayerNodes);
% weights 0 to 1
randomWeights = rand((16+2)*hiddenLayerNodes, hiddenLayerNodes);

[net, tr, c, cm, netx, nett] = trainFeedFwdNet(trn1n.', hiddenLayerNodes, 'trainlm', randomWeights);

% testX = netx(:,tr.testInd);
% testT = nett(:,tr.testInd);

% testY = net(testX);

% testIndices = vec2ind(testY);

% plotconfusion(testT,testY);

% [c,cm] = confusion(testT,testY)
fprintf('Train - Number of epochs run : %d\n', tr.num_epochs);
fprintf('Train - Best epoch : %d\n', tr.best_epoch);
fprintf('Train - Best performance : %f\n', tr.best_perf);
fprintf('Train - Percentage Correct Classification : %f%%\n', 100*(1-c));
fprintf('Train - Percentage Incorrect Classification : %f%%\n', 100*c);

% Test net against test data
tst1trans = tst1n.';

testX = tst1trans(1:16,:);
testT = tst1trans(17:18,:);

testY = net(testX);

testIndices = vec2ind(testY);

% plotconfusion(testT,testY);

[c,cm] = confusion(testT,testY);
fprintf('Test - Percentage Correct Classification : %f%%\n', 100*(1-c));
fprintf('Test - Percentage Incorrect Classification : %f%%\n', 100*c);
