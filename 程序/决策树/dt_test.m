clear
clc

%%%%%%%��ȡ����
x1 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\A_biaozhuncha_d1.txt");
x2 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\E_biaozhuncha_d1.txt");

%%%%%%%�������ݱ�ǩ
a = x1(1:100,:);
b = x2(1:100,:);
x = [x1;x2];
Y = [a;b];
A = zeros(400,1);
B = ones(400,1);
c = zeros(100,1);
d = ones(100,1);
N = [c;d];

label = [A;B];

 model = fitctree(x,label,'Prune','on');
 
 view(model,'Mode','graph');
 
 predict_label= predict(model,Y);
 
accuracy = length(find(predict_label == N))/length(N)*100;
   disp("���Ծ���Ϊ��")
   disp(accuracy)
%%%%%%K��CV
% [m,n] = size(x);
% indices = crossvalind('Kfold',m,5);

%%%%%%%%%%
%%%%%%%%%  train��test�����߼�ֵ

% for i = 1:5
%     test = (indices == i);
%     train = ~test;
%     data_train = x(train,:);
%     data_test = x(test,:);
%     label_train = label(train,:);
%     label_test = label(test,:);
%     model = fitctree(data_train,label_train);
%     predict_label= predict(model,data_test);
%     
%     accuracy = length(find(predict_label == label_test))/length(label_test)*100;
%     disp("���Ծ���Ϊ��")
%     disp(accuracy)
% end
