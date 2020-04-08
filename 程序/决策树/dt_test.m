clear
clc

%%%%%%%读取数据
x1 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\A_biaozhuncha_d1.txt");
x2 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\E_biaozhuncha_d1.txt");

%%%%%%%设置数据标签
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
   disp("测试精度为：")
   disp(accuracy)
%%%%%%K折CV
% [m,n] = size(x);
% indices = crossvalind('Kfold',m,5);

%%%%%%%%%%
%%%%%%%%%  train和test都是逻辑值

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
%     disp("测试精度为：")
%     disp(accuracy)
% end
