clc
clear

x1 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\A_biaozhuncha.txt");
z1 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\D_biaozhuncha.txt");


x2 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\A_biaozhuncha_d1.txt");
z2 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\D_biaozhuncha_d1.txt");


x3 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\A_biaozhuncha_d2.txt");
z3 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\D_biaozhuncha_d2.txt");


x4 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\A_biaozhuncha_d3.txt");
z4 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\D_biaozhuncha_d3.txt");

x5 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\A_biaozhuncha_d4.txt");
z5 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\D_biaozhuncha_d4.txt");


x6 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\A_biaozhuncha_d5.txt");
z6 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\D_biaozhuncha_d5.txt");


figure
subplot(2,3,1)
boxplot([x1,z1],{'A���Ե��ź�','D���Ե��ź�'})
xlabel("(a)EEG")
ylabel("��׼��")

subplot(2,3,2)
boxplot([x2,z2],{'A���Ե��ź�','D���Ե��ź�'})
xlabel("(b)CD1")
ylabel("��׼��")

subplot(2,3,3)
boxplot([x3,z3],{'A���Ե��ź�','D���Ե��ź�'})
xlabel("(c)CD2")
ylabel("��׼��")

subplot(2,3,4)
boxplot([x4,z4],{'A���Ե��ź�','D���Ե��ź�'})
xlabel("(d)CD3")
ylabel("��׼��")

subplot(2,3,5)
boxplot([x5,z5],{'A���Ե��ź�','D���Ե��ź�'})
xlabel("(e)CD4")
ylabel("��׼��")

subplot(2,3,6)
boxplot([x6,z6],{'A���Ե��ź�','D���Ե��ź�'})
xlabel("(f)CD5")
ylabel("��׼��")
