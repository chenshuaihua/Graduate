clear
clc

%%%%%%%��ȡ����
x1 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\������\A_sampen.txt");
x2 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\������\E_sampen.txt");

x3 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\������\A_sampen_d1.txt");
x4 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\������\E_sampen_d1.txt");

x5 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\������\A_sampen_d2.txt");
x6 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\������\E_sampen_d2.txt");

x7 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\������\A_sampen_d3.txt");
x8 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\������\E_sampen_d3.txt");

x9 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\������\A_sampen_d4.txt");
x10 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\������\E_sampen_d4.txt");


%%%%%%%�������ݱ�ǩ
x = [x1 x3 x5 x7 x9;x2 x4 x6 x8 x10];
A = zeros(400,1);
B = ones(400,1);
label = [A;B];

%%%%%%K��CV
[m,n] = size(x);
indices = crossvalind('Kfold',m,5);

%%%%%%%%%%
%%%%%%%%%  train��test�����߼�ֵ
for i = 1:5
    test = (indices == i);
    train = ~test;
    data_train = x(train,:);
    data_test = x(test,:);
    label_train = label(train,:);
    label_test = label(test,:);
    model = svmtrain(label_train,data_train,'-t 2 -c 1.2 -g 2.5');
    [predict_label,accuracy,dec_values] = svmpredict(label_test,data_test,model);
    
    
    aa = 0;
    bb = 0;
    cc = 0;
    dd = 0;
    
    for ss = 1:160
        if (predict_label(ss) == label_test(ss) && label_test(ss)==0)
            dd = dd+1;
        elseif (predict_label(ss) ~= label_test(ss) && label_test(ss)==0)
            bb = bb+1;
        elseif (predict_label(ss) == label_test(ss) && label_test(ss)==1)
            aa = aa+1;
        elseif (predict_label(ss) ~= label_test(ss) && label_test(ss)==1)
            cc = cc+1;
        end
    end
    
    sen = (aa/(aa+cc))*100;
    spe = (dd/(bb+dd))*100;
    disp(['Sensitivity:',num2str(sen),'%'])
    disp(['Specificity:',num2str(spe),'%'])
    
    
%     figure;
%     hold on;
%     plot(predict_label,'r*');
%     plot(label_test,'bo');
%     title("֧����������AE����ķ�����������ԭʼ�Ե��źŵ������أ�")
end
