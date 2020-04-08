%%%%%%��һ�������ƽ��׼ȷ��Ϊ96%����d1Ϊ93.75%��d2Ϊ94.625%�����֮����������


clear
clc

%%%%%%%��ȡ����
x1 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\A_biaozhuncha_d1.txt");
x2 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\A_biaozhuncha_d2.txt");
x3 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\E_biaozhuncha_d1.txt");
x4 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\E_biaozhuncha_d2.txt");


%%%%%%%�������ݱ�ǩ
x = [x1 x2;x3 x4];
A = zeros(400,1);
B = ones(400,1);
label = [A;B];

%%%%%%K��CV
[m,n] = size(x);
indices = crossvalind('Kfold',m,5);

%%%%%%%%%%
%%%%%%%%%  train��test�����߼�ֵ
for i = 1:5
    test = (indices == i);
    train = ~test;
    data_train = x(train,:);
    data_test = x(test,:);
    label_train = label(train,:);
    label_test = label(test,:);
    model = svmtrain(label_train,data_train,'-c 1 -d 3');
    [predict_label,accuracy,dec_values] = svmpredict(label_test,data_test,model);
end