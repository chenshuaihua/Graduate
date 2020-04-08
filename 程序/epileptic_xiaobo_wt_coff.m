%%%%��ͼ

clear 
clc

m1 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\E_S\S001.txt");

b1 = m1(1:1024);   

subplot(7,1,1)
plot(b1)
ylabel("E������Ե�")

%%%%[C��L]= Wavedec(X,N,'wname') 
%%%%N�������ϸ�������
%%%%����C����ֽ���approximation��detail��ϵ����
%%%%��5��ֽ�Ϊ����C=[CA5;CD5;CD4;CD3;CD2;CD1]��L�����������洢����C�и���ϵ���ĳ���
%%%%L=[len5;len5;len4;len4;len2;len1]

   %%%%����С��db4���ź�x2���ж��ֽ�


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
xlabel("С��ϵ��")