clc
clear

P = [-1 -1 2 2; 0 5 0 5];

T = [-1 -1 2 2];

 

%%%%%%%%%%   ��ʽ�﷨

net2 = newff(P,T,5,{'tansig', 'purelin'}, 'traingd'); % ��������5����Ԫ

 

net2.trainParam.goal = 1e-5;

net2.trainParam.epochs = 300;

net2.trainParam.lr = 0.05;

net2.trainParam.showWindow = 1;

net2.divideFcn = ''; % Ϊ���鱾һ�£������������ٵ��������Ҫ��������

net2 = train(net2,P,T);

 

Y2 = sim(net2,P);

disp(['��ʽ�﷨���Ľ� mse: ' num2str(mse(T-Y2))]);