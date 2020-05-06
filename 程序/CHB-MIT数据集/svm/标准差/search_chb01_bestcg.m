clc
clear

%%%%%��ȡ����
xa = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\CHB-MIT���ݼ�\��׼��\chb01_nor_biaozhuncha.txt");
xb = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\CHB-MIT���ݼ�\��׼��\chb01_epil_biaozhuncha.txt");

xc = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\CHB-MIT���ݼ�\��׼��\chb01_nor_biaozhuncha_d1.txt");
xd = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\CHB-MIT���ݼ�\��׼��\chb01_epil_biaozhuncha_d1.txt");

xe = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\CHB-MIT���ݼ�\��׼��\chb01_nor_biaozhuncha_d2.txt");
xf = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\CHB-MIT���ݼ�\��׼��\chb01_epil_biaozhuncha_d2.txt");

xg = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\CHB-MIT���ݼ�\��׼��\chb01_nor_biaozhuncha_d3.txt");
xh = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\CHB-MIT���ݼ�\��׼��\chb01_epil_biaozhuncha_d3.txt");

xi = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\CHB-MIT���ݼ�\��׼��\chb01_nor_biaozhuncha_d4.txt");
xj = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\CHB-MIT���ݼ�\��׼��\chb01_epil_biaozhuncha_d4.txt");

xk = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\CHB-MIT���ݼ�\��׼��\chb01_nor_biaozhuncha_d5.txt");
xl = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\CHB-MIT���ݼ�\��׼��\chb01_epil_biaozhuncha_d5.txt");

%%%%%%%�������ݱ�ǩ
x = [xa xc xe xg xi xk;xb xd xf xh xj xl];
A = zeros(240,1);
B = ones(240,1);
label = [A;B];

%%%%%%��׼��
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

data_train = [y(1:200,:);y(241:440,:)];
data_test = [y(201:240,:);y(441:480,:)];
label_train = [label(1:200,:);label(241:440,:)];
label_test = [label(201:240,:);label(441:480,:)];
[bestacc,bestc,bestg] = SVMcg(label_train,data_train,-5,5,-5,5,5,0.5,0.5,0.9);
disp(bestc);
disp(bestg);