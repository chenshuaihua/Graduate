clc
clear

x1 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\A_Z\Z001.txt");

a1 = x1(1:1024);     %%%%%将txt中的数据分段，此处取了前1024个数据
a2 = x1(1025:2048);
a3 = x1(2049:3072);
a4 = x1(3073:4096);



r1 = std(a1);
r2 = std(a2);
r3 = std(a3);
r4 = std(a4);

y1 = SamEnVal(a1,2,0.15*r1);
y2 = SamEnVal(a2,2,0.15*r2);
y3 = SamEnVal(a3,2,0.15*r3);
y4 = SamEnVal(a4,2,0.15*r4);
