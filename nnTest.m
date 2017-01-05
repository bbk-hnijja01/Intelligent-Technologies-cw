
trn1trans = trn1n.';

netx = trn1trans(1:16,:);
nett = trn1trans(17,:);

% netx = trn1n(:,1:16);
% nett = trn1n(:,17);

hiddenLayerNodes = 10;

% Levenberg-Marquardt
% net = feedforwardnet(hiddenLayerNodes, 'trainlm');

% Scaled Conjugate Gradient
net = feedforwardnet(hiddenLayerNodes, 'trainscg');

% Resilient Backpropagation (Rprop)
% net = feedforwardnet(hiddenLayerNodes, 'trainrp');

net.trainParam.epochs = 100;
net.trainparam.lr = 0.3;
net.trainParam.mc = 0.6;
[net,tr] = train(net,netx,nett);

testX = netx(:,tr.testInd);
testT = nett(:,tr.testInd);

testY = net(testX);

testIndices = vec2ind(testY);

% plotconfusion(testT,testY);

[c,cm] = confusion(testT,testY)
fprintf('Percentage Correct Classification : %f%%\n', 100*(1-c));
fprintf('Percentage Incorrect Classification : %f%%\n', 100*c);
