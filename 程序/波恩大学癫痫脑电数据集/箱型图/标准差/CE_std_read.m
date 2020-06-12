clc
clear

x1 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\C_biaozhuncha.txt");
y1 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\E_biaozhuncha.txt");

x2 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\C_biaozhuncha_d1.txt");
y2 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\E_biaozhuncha_d1.txt");

x3 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\C_biaozhuncha_d2.txt");
y3 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\E_biaozhuncha_d2.txt");

x4 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\C_biaozhuncha_d3.txt");
y4 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\E_biaozhuncha_d3.txt");

x5 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\C_biaozhuncha_d4.txt");
y5 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\E_biaozhuncha_d4.txt");

x6 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\C_biaozhuncha_d5.txt");
y6 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\E_biaozhuncha_d5.txt");

figure
subplot(2,3,1)
boxplot([x1,y1],{'C组脑电信号','E组脑电信号'})
xlabel("(a)EEG")
ylabel("标准差")

subplot(2,3,2)
boxplot([x2,y2],{'C组脑电信号','E组脑电信号'})
xlabel("(b)CD1")
ylabel("标准差")

subplot(2,3,3)
boxplot([x3,y3],{'C组脑电信号','E组脑电信号'})
xlabel("(c)CD2")
ylabel("标准差")

subplot(2,3,4)
boxplot([x4,y4],{'C组脑电信号','E组脑电信号'})
xlabel("(d)CD3")
ylabel("标准差")

subplot(2,3,5)
boxplot([x5,y5],{'C组脑电信号','E组脑电信号'})
xlabel("(e)CD4")
ylabel("标准差")

subplot(2,3,6)
boxplot([x6,y6],{'C组脑电信号','E组脑电信号'})
xlabel("(f)CD5")
ylabel("标准差")
