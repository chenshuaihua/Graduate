clc
clear

P = [-1 -1 2 2; 0 5 0 5];

T = [-1 -1 2 2];

 

%%%%%%%%%%   新式语法

net2 = newff(P,T,5,{'tansig', 'purelin'}, 'traingd'); % 隐含层有5个神经元

 

net2.trainParam.goal = 1e-5;

net2.trainParam.epochs = 300;

net2.trainParam.lr = 0.05;

net2.trainParam.showWindow = 1;

net2.divideFcn = ''; % 为和书本一致，对于样本极少的情况，不要再三分了

net2 = train(net2,P,T);

 

Y2 = sim(net2,P);

disp(['新式语法，改进 mse: ' num2str(mse(T-Y2))]);