clear
clc

%%%%%%%��ȡ����



x1 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\A_biaozhuncha_d1.txt");
x2 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\A_biaozhuncha_d2.txt");
x3 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\E_biaozhuncha_d1.txt");
x4 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\E_biaozhuncha_d2.txt");


%%%%%%%�������ݱ�ǩ

a = x1(1:100,:);
b = x2(1:100,:);
p = x3(1:100,:);
q = x4(1:100,:);

x = [x1 x2;x3 x4];
Y = [a b;p q];

A = zeros(400,1);
B = ones(400,1);
label = [A;B];

c = zeros(100,1);
d = ones(100,1);
N = [c;d];



 model = fitctree(x,label,'Prune','on');
 predict_label= predict(model,Y);
 
accuracy = length(find(predict_label == N))/length(N)*100;
   disp("���Ծ���Ϊ��")
   disp(accuracy)