%%%%%画图

clear 
clc

x1 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\A_Z\Z001.txt");

a1 = x1(1:1024);     %%%%%将txt中的数据分段，此处取了前1024个数据

subplot(7,1,1)
plot(a1)
ylabel("A组正常脑电")

%%%%[C，L]= Wavedec(X,N,'wname') 
%%%%N必须是严格正整数
%%%%其中C代表分解后的approximation和detail的系数，
%%%%以5层分解为例，C=[CA5;CD5;CD4;CD3;CD2;CD1]。L是列向量，存储的是C中各组系数的长度
%%%%L=[len5;len5;len4;len4;len2;len1]
[ca1,la1] = wavedec(a1,5,'db4');   %%%%利用小波db4对信号x2进行多层分解
approa1_5 = appcoef(ca1,la1,'db4');
[detda1_1,detda1_2,detda1_3,detda1_4,detda1_5] = detcoef(ca1,la1,[1,2,3,4,5]);


%%%%%%%plot the coefficients
subplot(7,1,2)
plot(detda1_1)
ylabel("CD1")
subplot(7,1,3)
plot(detda1_2)
ylabel("CD2")
subplot(7,1,4)
plot(detda1_3)
ylabel("CD3")
subplot(7,1,5)
plot(detda1_4)
ylabel("CD4")
subplot(7,1,6)
plot(detda1_5)
ylabel("CD5")
subplot(7,1,7)
plot(approa1_5)
ylabel("CA5")
xlabel("小波系数")
