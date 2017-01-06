
trn1trans = trn1n.';

netx = trn1trans(1:16,:);
nett = trn1trans(17:18,:);

% netx = trn1n(:,1:16);
% nett = trn1n(:,17);

hiddenLayerNodes = 15;

% Levenberg-Marquardt
net = feedforwardnet(hiddenLayerNodes, 'trainlm');

% Scaled Conjugate Gradient
% net = feedforwardnet(hiddenLayerNodes, 'trainscg');

% Resilient Backpropagation (Rprop)
% net = feedforwardnet(hiddenLayerNodes, 'trainrp');

% Configure net and set random initial weights.
net = configure(net, netx, nett);
% weights -1 to 1
% randomWeights = -1 + (1+1)*rand((16+2)*hiddenLayerNodes, hiddenLayerNodes);
% weights 0 to 1
randomWeights = rand((16+2)*hiddenLayerNodes, hiddenLayerNodes);
net = setwb(net, randomWeights);

net.performFcn = 'sse'; % default is 'mse'
net.trainParam.epochs = 100;
net.trainparam.lr = 0.3;
net.trainParam.mc = 0.6;
net.trainParam.showWindow = 0 % default is 1

[net,tr] = train(net,netx,nett);

testX = netx(:,tr.testInd);
testT = nett(:,tr.testInd);

testY = net(testX);

testIndices = vec2ind(testY);

% plotconfusion(testT,testY);

[c,cm] = confusion(testT,testY)
fprintf('Number of epochs run : %d\n', tr.num_epochs);
fprintf('Best epoch : %d\n', tr.best_epoch);
fprintf('Best performance : %f\n', tr.best_perf);
fprintf('Percentage Correct Classification : %f%%\n', 100*(1-c));
fprintf('Percentage Incorrect Classification : %f%%\n', 100*c);
