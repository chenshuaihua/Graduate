clear 
clc

x1 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\A_Z\Z001.txt");
m1 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\E_S\S001.txt");

a1 = x1(1:1024);     %%%%%将txt中的数据分段，此处取了前1024个数据
a2 = x1(1025:2048);
a3 = x1(2049:3072);
a4 = x1(3073:4096);

b1 = m1(1:1024);   
b2 = m1(1025:2048); 
b3 = m1(2049:3072); 
b4 = m1(3073:4096); 

% subplot(7,1,1)
% plot(a1)
% title("正常1时序图")

%%%%[C，L]= Wavedec(X,N,'wname') 
%%%%N必须是严格正整数
%%%%其中C代表分解后的approximation和detail的系数，
%%%%以5层分解为例，C=[CA5;CD5;CD4;CD3;CD2;CD1]。L是列向量，存储的是C中各组系数的长度
%%%%L=[len5;len5;len4;len4;len2;len1]
[ca1,la1] = wavedec(a1,5,'db4');   %%%%利用小波db4对信号x2进行多层分解
[ca2,la2] = wavedec(a2,5,'db4');
[ca3,la3] = wavedec(a3,5,'db4');
[ca4,la4] = wavedec(a4,5,'db4');

[cb1,lb1] = wavedec(b1,5,'db4');
[cb2,lb2] = wavedec(b2,5,'db4');
[cb3,lb3] = wavedec(b3,5,'db4');
[cb4,lb4] = wavedec(b4,5,'db4');

approa1_5 = appcoef(ca1,la1,'db4');
approa2_5 = appcoef(ca2,la2,'db4');
approa3_5 = appcoef(ca3,la3,'db4');
approa4_5 = appcoef(ca4,la4,'db4');
[detda1_1,detda1_2,detda1_3,detda1_4,detda1_5] = detcoef(ca1,la1,[1,2,3,4,5]);
[detda2_1,detda2_2,detda2_3,detda2_4,detda2_5] = detcoef(ca2,la2,[1,2,3,4,5]);
[detda3_1,detda3_2,detda3_3,detda3_4,detda3_5] = detcoef(ca3,la3,[1,2,3,4,5]);
[detda4_1,detda4_2,detda4_3,detda4_4,detda4_5] = detcoef(ca4,la4,[1,2,3,4,5]);

approb1_5 = appcoef(cb1,lb1,'db4');
approb2_5 = appcoef(cb2,lb2,'db4');
approb3_5 = appcoef(cb3,lb3,'db4');
approb4_5 = appcoef(cb4,lb4,'db4');
[detdb1_1,detdb1_2,detdb1_3,detdb1_4,detdb1_5] = detcoef(cb1,lb1,[1,2,3,4,5]);
[detdb2_1,detdb2_2,detdb2_3,detdb2_4,detdb2_5] = detcoef(cb2,lb2,[1,2,3,4,5]);
[detdb3_1,detdb3_2,detdb3_3,detdb3_4,detdb3_5] = detcoef(cb3,lb3,[1,2,3,4,5]);
[detdb4_1,detdb4_2,detdb4_3,detdb4_4,detdb4_5] = detcoef(cb4,lb4,[1,2,3,4,5]);

std_da1_5 = std(detda1_5);
std_da1_4 = std(detda1_4);
std_da1_3 = std(detda1_3);
std_da1_2 = std(detda1_2);
std_da1_1 = std(detda1_1);

std_db1_5 = std(detdb1_5);
std_db1_4 = std(detdb1_4);
std_db1_3 = std(detdb1_3);
std_db1_2 = std(detdb1_2);
std_db1_1 = std(detdb1_1);
%%%%%%%plot the coefficients
% subplot(7,1,2)
% plot(a5)
% title("近似系数")
% subplot(7,1,3)
% plot(d5)
% title("L5详细系数")
% subplot(7,1,4)
% plot(d4)
% title("L4详细系数")
% subplot(7,1,5)
% plot(d3)
% title("L3详细系数")
% subplot(7,1,6)
% plot(d2)
% title("L2详细系数")
% subplot(7,1,7)
% plot(d1)
% title("L1详细系数")
