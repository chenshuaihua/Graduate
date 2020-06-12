clear
clc

xa = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\C_biaozhuncha.txt");
xb = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\E_biaozhuncha.txt");

xc = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\C_biaozhuncha_d1.txt");
xd = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\E_biaozhuncha_d1.txt");

xe = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\C_biaozhuncha_d2.txt");
xf = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\E_biaozhuncha_d2.txt");

xg = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\C_biaozhuncha_d3.txt");
xh = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\E_biaozhuncha_d3.txt");

xi = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\C_biaozhuncha_d4.txt");
xj = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\E_biaozhuncha_d4.txt");

xk = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\C_biaozhuncha_d5.txt");
xl = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\E_biaozhuncha_d5.txt");



%%%%%%%�������ݱ�ǩ
x = [xa xc xe xg xi xk;xb xd xf xh xj xl];
A = zeros(400,1);
B = ones(400,1);
label = [A;B];

%%%%%%K��CV
[m,n] = size(x);
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














