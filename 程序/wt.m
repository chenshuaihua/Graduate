clear
clc
x1 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\A_Z\Z001.txt");
x2 = x1(1:1024);
subplot(4,1,1)
plot(x2)
title("正常1时序图")

Len = length(x2);
[ca1,cd1] = dwt(x2,'db4');     %%%%采用db4小波基分解
a1 = upcoef('a',ca1,'db4',1,Len);  %%%从系数得到近似信号  N暂时不知道该取什么值
d1 = upcoef('d',cd1,'db4',1,Len);  %%%从系数得到细节信号
s1 = a1 + d1 ;  %%%重构信号
subplot(4,1,2)
plot(a1)
title("一层小波分解的低频信息")

subplot(4,1,3)
plot(d1)
title("一层小波分解的高频信息")

subplot(4,1,4)
plot(d1)
title("一层小波分解的重构信号")
