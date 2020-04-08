%%%%画图

clear 
clc

m1 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\E_S\S001.txt");

b1 = m1(1:1024);   

subplot(7,1,1)
plot(b1)
ylabel("E组癫痫脑电")

%%%%[C，L]= Wavedec(X,N,'wname') 
%%%%N必须是严格正整数
%%%%其中C代表分解后的approximation和detail的系数，
%%%%以5层分解为例，C=[CA5;CD5;CD4;CD3;CD2;CD1]。L是列向量，存储的是C中各组系数的长度
%%%%L=[len5;len5;len4;len4;len2;len1]

   %%%%利用小波db4对信号x2进行多层分解


[cb1,lb1] = wavedec(b1,5,'db4');
approb1_5 = appcoef(cb1,lb1,'db4');
[detdb1_1,detdb1_2,detdb1_3,detdb1_4,detdb1_5] = detcoef(cb1,lb1,[1,2,3,4,5]);

%%%%%%%plot the coefficients
subplot(7,1,2)
plot(detdb1_1)
ylabel("CD1")

subplot(7,1,3)
plot(detdb1_2)
ylabel("CD2")

subplot(7,1,4)
plot(detdb1_3)
ylabel("CD3")

subplot(7,1,5)
plot(detdb1_4)
ylabel("CD4")

subplot(7,1,6)
plot(detdb1_5)
ylabel("CD5")

subplot(7,1,7)
plot(approb1_5)
ylabel("CA5")
xlabel("小波系数")