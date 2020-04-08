clc
clear

y1 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\A_biaozhuncha.txt");
y2 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\E_biaozhuncha.txt");
y11 = y1';
x = (1:1:400);

scatter(x,y11)
