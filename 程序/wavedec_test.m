
clc
clear
x1 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\A_Z\Z001.txt");
x2 = x1(1:1024);
subplot(7,1,1)
plot(x2)
title("����1ʱ��ͼ")

%%%%[C��L]= Wavedec(X,N,'wname') 
%%%%N�������ϸ�������
%%%%����C����ֽ���approximation��detail��ϵ����
%%%%��5��ֽ�Ϊ����C=[CA5;CD5;CD4;CD3;CD2;CD1]��L�����������洢����C�и���ϵ���ĳ���
%%%%L=[len5;len5;len4;len4;len2;len1]
[c,l] = wavedec(x2,5,'db4');   %%%%����С��db4���ź�x2���ж��ֽ�


a5 = appcoef(c,l,'db4');
[d1,d2,d3,d4,d5] = detcoef(c,l,[1,2,3,4,5]);

%%%%%%%plot the coefficients
subplot(7,1,2)
plot(a5)
title("����ϵ��")
subplot(7,1,3)
plot(d5)
title("L5��ϸϵ��")
subplot(7,1,4)
plot(d4)
title("L4��ϸϵ��")
subplot(7,1,5)
plot(d3)
title("L3��ϸϵ��")
subplot(7,1,6)
plot(d2)
title("L2��ϸϵ��")
subplot(7,1,7)
plot(d1)
title("L1��ϸϵ��")








