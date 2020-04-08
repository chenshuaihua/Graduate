%%%%%%%求正常脑电数据和癫痫脑电数据分段后的标准差，并绘制盒形图

clear
clc

%%%%%读取数据   
x1 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\A_Z\Z001.txt");
m1 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\E_S\S001.txt");

%%%%%%将数据分段
a1 = x1(1:1024);     %%%%%将txt中的数据分段，此处取了前1024个数据
a2 = x1(1025:2048);
a3 = x1(2049:3072);
a4 = x1(3073:4096);
%plot(x2)
b1 = m1(1:1024);   
b2 = m1(1025:2048); 
b3 = m1(2049:3072); 
b4 = m1(3073:4096); 

[ca1,la1] = wavedec(a1,5,'db4');   %%%%利用小波db4对信号进行5层分解
[ca2,la2] = wavedec(a2,5,'db4');
[ca3,la3] = wavedec(a3,5,'db4');
[ca4,la4] = wavedec(a4,5,'db4');


[detda1_1,detda1_2,detda1_3,detda1_4,detda1_5] = detcoef(ca1,la1,[1,2,3,4,5]);
[detda2_1,detda2_2,detda2_3,detda2_4,detda2_5] = detcoef(ca2,la2,[1,2,3,4,5]);
[detda3_1,detda3_2,detda3_3,detda3_4,detda3_5] = detcoef(ca3,la3,[1,2,3,4,5]);
[detda4_1,detda4_2,detda4_3,detda4_4,detda4_5] = detcoef(ca4,la4,[1,2,3,4,5]);

std_da1_1 = std(detda1_1);
std_da2_1 = std(detda2_1);
std_da3_1 = std(detda3_1);
std_da4_1 = std(detda4_1);






%%%%%计算每一段的标准偏差
y1 = std(a1);
y2 = std(a2);
y3 = std(a3);
y4 = std(a4);
s1 = std(b1);
s2 = std(b2);
s3 = std(b3);
s4 = std(b4);

%%%%%绘制盒形图
% p1 = [y1 y2 y3 y4];
% q1 = [s1 s2 s3 s4];
% subplot(1,2,1)
% boxplot(p1)
% subplot(1,2,2)
% boxplot(q1)
