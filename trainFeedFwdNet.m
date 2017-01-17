%
% Author : Harsharan Nijjar
% Date : 17 January 2017
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
% Author : Harsharan Nijjar
%

netx = trainingData(1:16,:);
nett = trainingData(17:18,:);

net = feedforwardnet(hiddenLayerNodes, trainingFunc);

% Configure net and set initial weights.
net = configure(net, netx, nett);
net = setwb(net, initWeights);

net.performFcn = 'sse'; % default is 'mse'

% Parameters for dividing the ANN training data into training, validation,
% and test data.
net.divideParam.trainRatio = 70/100; % default 0.7
net.divideParam.valRatio =  15/100; % default 0.15
net.divideParam.testRatio = 15/100; % default 0.15

net.trainParam.goal = 0;
net.trainParam.time = inf;
net.trainParam.max_fail = 6;

if strcmp(trainingFunc, 'trainlm')
    net.trainParam.min_grad = 1e-7;
    net.trainParam.mu = 0.001; % 0.001;
    net.trainParam.mu_dec = 0.1;
    net.trainParam.mu_inc = 10;
    net.trainParam.mu_max = 1e10;
elseif strcmp(trainingFunc, 'trainscg')
    net.trainParam.min_grad = 1e-6;
    net.trainParam.sigma = 5.0e-5;
    net.trainParam.lambda = 5.0e-7;
elseif strcmp(trainingFunc, 'trainrp')
    net.trainparam.lr = 0.01; % learning rate
    net.trainParam.min_grad = 1e-5;
%     net.trainParam.delta_inc = 1.2;
%     net.trainParam.delta_dec = 0.5;
%     net.trainParam.delta0 = 0.07;
%     net.trainParam.delta_max = 50.0;
end

net.trainParam.epochs = 100; % max. epochs/iterations
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
