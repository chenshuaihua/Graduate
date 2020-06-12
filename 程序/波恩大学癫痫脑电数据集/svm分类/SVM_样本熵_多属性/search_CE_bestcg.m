clear
clc

%%%%%%%读取数据
x1 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\样本熵\C_sampen.txt");
x2 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\样本熵\E_sampen.txt");

x3 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\样本熵\C_sampen_d1.txt");
x4 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\样本熵\E_sampen_d1.txt");

x5 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\样本熵\C_sampen_d2.txt");
x6 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\样本熵\E_sampen_d2.txt");

x7 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\样本熵\C_sampen_d3.txt");
x8 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\样本熵\E_sampen_d3.txt");



%%%%%%%设置数据标签
x = [x1 x3 x5 x7;x2 x4 x6 x8 ];
A = zeros(400,1);
B = ones(400,1);
label = [A;B];
[m,n] = size(x);
y = ones(800,4)*nan;

%%%%%%%归一化
a_gy=0;
for j_gy=1:n
    for i_gy=1:m
        a_gy=a_gy+x(i_gy,j_gy)^2;
    end
    A_gy(1,j_gy)=sqrt(a_gy);
    a_gy=0;
end
A_gy=repmat(A_gy,m,1);
y = x./A_gy;


data_train = [y(1:360,:);y(401:760,:)];
data_test = [y(361:400,:);y(761:800,:)];
label_train = [label(1:360,:);label(401:760,:)];
label_test = [label(361:400,:);label(761:800,:)];
[bestacc,bestc,bestg] = SVMcg(label_train,data_train,-5,5,-5,5,5,0.5,0.5,0.9);
disp(bestc);
disp(bestg);

