clc
clear
%%%%%��ȡ����
x1 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\CHB-MIT���ݼ�\������\chb03_nor_sampen.txt");
y1 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\CHB-MIT���ݼ�\������\chb03_epil_sampen.txt");

x2 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\CHB-MIT���ݼ�\������\chb03_nor_sampen_d1.txt");
y2 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\CHB-MIT���ݼ�\������\chb03_epil_sampen_d1.txt");

x3 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\CHB-MIT���ݼ�\������\chb03_nor_sampen_d2.txt");
y3 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\CHB-MIT���ݼ�\������\chb03_epil_sampen_d2.txt");

x4 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\CHB-MIT���ݼ�\������\chb03_nor_sampen_d3.txt");
y4 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\CHB-MIT���ݼ�\������\chb03_epil_sampen_d3.txt");

x5 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\CHB-MIT���ݼ�\������\chb03_nor_sampen_d4.txt");
y5 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\CHB-MIT���ݼ�\������\chb03_epil_sampen_d4.txt");

x6 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\CHB-MIT���ݼ�\������\chb03_nor_sampen_d5.txt");
y6 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\CHB-MIT���ݼ�\������\chb03_epil_sampen_d5.txt");


%%%%%��������ͼ��2X3��
figure
subplot(2,3,1)
boxplot([x1,y1],{'chb03�����Ե��ź�','chb03�������Ե��ź�'})
xlabel("(a)EEG")
ylabel("������")

subplot(2,3,2)
boxplot([x2,y2],{'chb03�����Ե��ź�','chb03�������Ե��ź�'})
xlabel("(b)CD1")
ylabel("������")

subplot(2,3,3)
boxplot([x3,y3],{'chb03�����Ե��ź�','chb03�������Ե��ź�'})
xlabel("(c)CD2")
ylabel("������")

subplot(2,3,4)
boxplot([x4,y4],{'chb03�����Ե��ź�','chb03�������Ե��ź�'})
xlabel("(d)CD3")
ylabel("������")

subplot(2,3,5)
boxplot([x5,y5],{'chb03�����Ե��ź�','chb03�������Ե��ź�'})
xlabel("(e)CD4")
ylabel("������")

subplot(2,3,6)
boxplot([x6,y6],{'chb03�����Ե��ź�','chb03�������Ե��ź�'})
xlabel("(f)CD5")
ylabel("������")
