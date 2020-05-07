clc
clear
%%%%%��ȡ����
xa = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\CHB-MIT���ݼ�\������\chb03_nor_sampen.txt");
xb = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\CHB-MIT���ݼ�\������\chb03_epil_sampen.txt");

xc = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\CHB-MIT���ݼ�\������\chb03_nor_sampen_d3.txt");
xd = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\CHB-MIT���ݼ�\������\chb03_epil_sampen_d3.txt");

%%%%%%%�������ݱ�ǩ
x = [xa xc;xb xd ];
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

indices = crossvalind('Kfold',m,5);

%%%%%%%%%%
%%%%%%%%%  train��test�����߼�ֵ
for i = 1:5
    test = (indices == i);
    train = ~test;
    data_train = y(train,:);
    data_test = y(test,:);
    label_train = label(train,:);
    label_test = label(test,:);
    model = svmtrain(label_train,data_train,'-t 2 -c 1  -g 8');
    [predict_label,accuracy,dec_values] = svmpredict(label_test,data_test,model);
    %%%%%%%%����accuracy��sensitivity��specificity
    aa = 0;
    bb = 0;
    cc = 0;
    dd = 0;
    
    for ss = 1:96
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
    
    disp(['׼ȷ��Ϊ:',num2str(accuracy(1)),'%'])
    
    fid = fopen('E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\���\CHB-MIT���ݼ�\SVM����\������\test2.txt','at');
    fprintf(fid,'%.4f  %.4f  %.4f\r\n',accuracy(1),sen,spe);
    fclose(fid);
    
%     figure;
%     hold on;
%     plot(predict_label,'r*');
%     plot(label_test,'bo');
%     title("֧����������chb03�ķ�����������ԭʼ�Ե��źż�CD3�������أ�")
end




