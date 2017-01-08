function [trainedNet, testRes, c, cm, netInputs, netTargets]  = ...
    trainFeedFwdNet(trainingData, hiddenLayerNodes, trainingFunc, initWeights)
% trainFeedFwdNet Creates and trains a feed forward net.
%
% traingingData : Data for training the net
% hiddenLayerNodes : number of nodes in hidden layer
% trainingFunc : 'trainlm' or 'trainscg' or 'trainrp'
% initWeigts : initial weights before training
%
% Example:
%   [trainingRes, testRes] = importfile(trn1n, 15, 'trainlm');
%

% transformedTDS = trainDataSet.';

netx = trainingData(1:16,:);
nett = trainingData(17:18,:);

net = feedforwardnet(hiddenLayerNodes, trainingFunc);

% Configure net and set initial weights.
net = configure(net, netx, nett);
net = setwb(net, initWeights);

net.performFcn = 'sse'; % default is 'mse'
net.trainParam.epochs = 100;
net.trainparam.lr = 0.3;
net.trainParam.mc = 0.6;
net.trainParam.showWindow = 0; % default is 1 to show dialogue

[net,tr] = train(net,netx,nett);

testX = netx(:,tr.testInd);
testT = nett(:,tr.testInd);

testY = net(testX);

testIndices = vec2ind(testY);

[c,cm] = confusion(testT,testY);

trainedNet = net;
testRes = tr;
netInputs = netx;
netTargets = nett;
end
