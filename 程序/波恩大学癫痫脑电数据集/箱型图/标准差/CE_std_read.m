clc
clear

x1 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\C_biaozhuncha.txt");
y1 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\E_biaozhuncha.txt");

x2 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\C_biaozhuncha_d1.txt");
y2 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\E_biaozhuncha_d1.txt");

x3 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\C_biaozhuncha_d2.txt");
y3 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\E_biaozhuncha_d2.txt");

x4 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\C_biaozhuncha_d3.txt");
y4 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\E_biaozhuncha_d3.txt");

x5 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\C_biaozhuncha_d4.txt");
y5 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\E_biaozhuncha_d4.txt");

x6 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\C_biaozhuncha_d5.txt");
y6 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\E_biaozhuncha_d5.txt");

figure
subplot(2,3,1)
boxplot([x1,y1],{'C���Ե��ź�','E���Ե��ź�'})
xlabel("(a)EEG")
ylabel("��׼��")

subplot(2,3,2)
boxplot([x2,y2],{'C���Ե��ź�','E���Ե��ź�'})
xlabel("(b)CD1")
ylabel("��׼��")

subplot(2,3,3)
boxplot([x3,y3],{'C���Ե��ź�','E���Ե��ź�'})
xlabel("(c)CD2")
ylabel("��׼��")

subplot(2,3,4)
boxplot([x4,y4],{'C���Ե��ź�','E���Ե��ź�'})
xlabel("(d)CD3")
ylabel("��׼��")

subplot(2,3,5)
boxplot([x5,y5],{'C���Ե��ź�','E���Ե��ź�'})
xlabel("(e)CD4")
ylabel("��׼��")

subplot(2,3,6)
boxplot([x6,y6],{'C���Ե��ź�','E���Ե��ź�'})
xlabel("(f)CD5")
ylabel("��׼��")
