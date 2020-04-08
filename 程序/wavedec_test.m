
clc
clear
x1 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\A_Z\Z001.txt");
x2 = x1(1:1024);
subplot(7,1,1)
plot(x2)
title("正常1时序图")

%%%%[C，L]= Wavedec(X,N,'wname') 
%%%%N必须是严格正整数
%%%%其中C代表分解后的approximation和detail的系数，
%%%%以5层分解为例，C=[CA5;CD5;CD4;CD3;CD2;CD1]。L是列向量，存储的是C中各组系数的长度
%%%%L=[len5;len5;len4;len4;len2;len1]
[c,l] = wavedec(x2,5,'db4');   %%%%利用小波db4对信号x2进行多层分解


a5 = appcoef(c,l,'db4');
[d1,d2,d3,d4,d5] = detcoef(c,l,[1,2,3,4,5]);

%%%%%%%plot the coefficients
subplot(7,1,2)
plot(a5)
title("近似系数")
subplot(7,1,3)
plot(d5)
title("L5详细系数")
subplot(7,1,4)
plot(d4)
title("L4详细系数")
subplot(7,1,5)
plot(d3)
title("L3详细系数")
subplot(7,1,6)
plot(d2)
title("L2详细系数")
subplot(7,1,7)
plot(d1)
title("L1详细系数")








