clear
clc
x1 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\A_Z\Z001.txt");
x2 = x1(1:1024);
subplot(4,1,1)
plot(x2)
title("����1ʱ��ͼ")

Len = length(x2);
[ca1,cd1] = dwt(x2,'db4');     %%%%����db4С�����ֽ�
a1 = upcoef('a',ca1,'db4',1,Len);  %%%��ϵ���õ������ź�  N��ʱ��֪����ȡʲôֵ
d1 = upcoef('d',cd1,'db4',1,Len);  %%%��ϵ���õ�ϸ���ź�
s1 = a1 + d1 ;  %%%�ع��ź�
subplot(4,1,2)
plot(a1)
title("һ��С���ֽ�ĵ�Ƶ��Ϣ")

subplot(4,1,3)
plot(d1)
title("һ��С���ֽ�ĸ�Ƶ��Ϣ")

subplot(4,1,4)
plot(d1)
title("һ��С���ֽ���ع��ź�")
