clc
clear

x1 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\A_biaozhuncha.txt");
z1 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\D_biaozhuncha.txt");


x2 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\A_biaozhuncha_d1.txt");
z2 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\D_biaozhuncha_d1.txt");


x3 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\A_biaozhuncha_d2.txt");
z3 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\D_biaozhuncha_d2.txt");


x4 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\A_biaozhuncha_d3.txt");
z4 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\D_biaozhuncha_d3.txt");

x5 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\A_biaozhuncha_d4.txt");
z5 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\D_biaozhuncha_d4.txt");


x6 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\A_biaozhuncha_d5.txt");
z6 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\D_biaozhuncha_d5.txt");


figure
subplot(2,3,1)
boxplot([x1,z1],{'A组脑电信号','D组脑电信号'})
xlabel("(a)EEG")
ylabel("标准差")

subplot(2,3,2)
boxplot([x2,z2],{'A组脑电信号','D组脑电信号'})
xlabel("(b)CD1")
ylabel("标准差")

subplot(2,3,3)
boxplot([x3,z3],{'A组脑电信号','D组脑电信号'})
xlabel("(c)CD2")
ylabel("标准差")

subplot(2,3,4)
boxplot([x4,z4],{'A组脑电信号','D组脑电信号'})
xlabel("(d)CD3")
ylabel("标准差")

subplot(2,3,5)
boxplot([x5,z5],{'A组脑电信号','D组脑电信号'})
xlabel("(e)CD4")
ylabel("标准差")

subplot(2,3,6)
boxplot([x6,z6],{'A组脑电信号','D组脑电信号'})
xlabel("(f)CD5")
ylabel("标准差")
