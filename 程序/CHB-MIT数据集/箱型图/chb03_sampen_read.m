clc
clear
%%%%%读取数据
x1 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\CHB-MIT数据集\样本熵\chb03_nor_sampen.txt");
y1 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\CHB-MIT数据集\样本熵\chb03_epil_sampen.txt");

x2 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\CHB-MIT数据集\样本熵\chb03_nor_sampen_d1.txt");
y2 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\CHB-MIT数据集\样本熵\chb03_epil_sampen_d1.txt");

x3 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\CHB-MIT数据集\样本熵\chb03_nor_sampen_d2.txt");
y3 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\CHB-MIT数据集\样本熵\chb03_epil_sampen_d2.txt");

x4 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\CHB-MIT数据集\样本熵\chb03_nor_sampen_d3.txt");
y4 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\CHB-MIT数据集\样本熵\chb03_epil_sampen_d3.txt");

x5 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\CHB-MIT数据集\样本熵\chb03_nor_sampen_d4.txt");
y5 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\CHB-MIT数据集\样本熵\chb03_epil_sampen_d4.txt");

x6 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\CHB-MIT数据集\样本熵\chb03_nor_sampen_d5.txt");
y6 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\CHB-MIT数据集\样本熵\chb03_epil_sampen_d5.txt");


%%%%%绘制箱型图（2X3）
figure
subplot(2,3,1)
boxplot([x1,y1],{'chb03间期脑电信号','chb03发作期脑电信号'})
xlabel("(a)EEG")
ylabel("样本熵")

subplot(2,3,2)
boxplot([x2,y2],{'chb03间期脑电信号','chb03发作期脑电信号'})
xlabel("(b)CD1")
ylabel("样本熵")

subplot(2,3,3)
boxplot([x3,y3],{'chb03间期脑电信号','chb03发作期脑电信号'})
xlabel("(c)CD2")
ylabel("样本熵")

subplot(2,3,4)
boxplot([x4,y4],{'chb03间期脑电信号','chb03发作期脑电信号'})
xlabel("(d)CD3")
ylabel("样本熵")

subplot(2,3,5)
boxplot([x5,y5],{'chb03间期脑电信号','chb03发作期脑电信号'})
xlabel("(e)CD4")
ylabel("样本熵")

subplot(2,3,6)
boxplot([x6,y6],{'chb03间期脑电信号','chb03发作期脑电信号'})
xlabel("(f)CD5")
ylabel("样本熵")
