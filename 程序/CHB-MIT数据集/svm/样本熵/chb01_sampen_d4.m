clc
clear

%%%%%��ȡ����
x1 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\CHB-MIT���ݼ�\������\chb01_nor_sampen_d4.txt");
x2 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\CHB-MIT���ݼ�\������\chb01_epil_sampen_d4.txt");

%%%%%%%�������ݱ�ǩ
x = [x1;x2];
A = zeros(240,1);
B = ones(240,1);
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
    model = svmtrain(label_train,data_train);
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
%     title("֧����������chb01�ķ�����������CD4�������أ�")
end