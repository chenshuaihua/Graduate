%%%%%%%与d5相比，最后算出来的准确率，平均后均为50%，好像没什么提升
%%%%%%%可能是参数选择的问题

clear
clc

%%%%%%%读取数据
x1 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\样本熵\A_sampen_d4.txt");
x2 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\样本熵\A_sampen_d5.txt");
x3 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\样本熵\E_sampen_d4.txt");
x4 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\样本熵\E_sampen_d5.txt");

%%%%%%%设置数据标签
x = [x1 x2;x3 x4];
A = zeros(400,1);
B = ones(400,1);
label = [A;B];

%%%%%%K折CV
[m,n] = size(x);
indices = crossvalind('Kfold',m,10);

%%%%%%%%%%
%%%%%%%%%  train和test都是逻辑值
for i = 1:10
    test = (indices == i);
    train = ~test;
    data_train = x(train,:);
    data_test = x(test,:);
    label_train = label(train,:);
    label_test = label(test,:);
    model = svmtrain(label_train,data_train,'-c 1 -d 3');
    [predict_label,accuracy,dec_values] = svmpredict(label_test,data_test,model);
end