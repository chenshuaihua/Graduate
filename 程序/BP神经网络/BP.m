clc
clear

%%%%%%%读取数据
x1 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\A_biaozhuncha_d1.txt");
x2 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\A_biaozhuncha_d2.txt");
x3 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\E_biaozhuncha_d1.txt");
x4 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\E_biaozhuncha_d2.txt");

%%%%%%%设置数据标签
x = [x1 x2;x3 x4];
A = zeros(400,1);
B = ones(400,1);
label = [A;B];

