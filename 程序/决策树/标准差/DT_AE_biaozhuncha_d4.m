clear
clc

%%%%%%%��ȡ����
x1 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\A_biaozhuncha_d4.txt");
x2 = load("E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\��׼��\E_biaozhuncha_d4.txt");

%%%%%%%�������ݱ�ǩ
x = [x1;x2];
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
    model = fitctree(data_train,label_train,'Prune','on');
    predict_label= predict(model,data_test);
   % view(model,'Mode','graph');
    
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
    %%%%%%%����׼ȷ�ȣ������Ⱥ������
    sen = (aa/(aa+cc))*100;
    spe = (dd/(bb+dd))*100;
    acc = ((aa+dd)/160)*100 ; 
  
    disp(['Accuracy:',num2str(acc),'%'])
    disp(['Sensitivity:',num2str(sen),'%'])
    disp(['Specificity:',num2str(spe),'%'])
    
    fid = fopen('E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\���\DT����\��׼��\test.txt','at');
    fprintf(fid,'%.4f  %.4f  %.4f\r\n',acc,sen,spe);
    fclose(fid);
    
%     figure;
%     hold on;
%     plot(predict_label,'r*');
%     plot(label_test,'bo');
%     title("DT��AE����ķ�����������CD4�ı�׼�")

end


