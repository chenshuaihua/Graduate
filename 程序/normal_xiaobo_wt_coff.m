%%%%%��ͼ

clear 
clc

x1 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\A_Z\Z001.txt");

a1 = x1(1:1024);     %%%%%��txt�е����ݷֶΣ��˴�ȡ��ǰ1024������

subplot(7,1,1)
plot(a1)
ylabel("A�������Ե�")

%%%%[C��L]= Wavedec(X,N,'wname') 
%%%%N�������ϸ�������
%%%%����C����ֽ���approximation��detail��ϵ����
%%%%��5��ֽ�Ϊ����C=[CA5;CD5;CD4;CD3;CD2;CD1]��L�����������洢����C�и���ϵ���ĳ���
%%%%L=[len5;len5;len4;len4;len2;len1]
[ca1,la1] = wavedec(a1,5,'db4');   %%%%����С��db4���ź�x2���ж��ֽ�
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
xlabel("С��ϵ��")
