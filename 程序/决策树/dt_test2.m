clear
clc

%%%%%%%读取数据



x1 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\A_biaozhuncha_d1.txt");
x2 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\A_biaozhuncha_d2.txt");
x3 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\E_biaozhuncha_d1.txt");
x4 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\E_biaozhuncha_d2.txt");


%%%%%%%设置数据标签

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
   disp("测试精度为：")
   disp(accuracy)