clc
clear

x1 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\CHB-MIT数据集\标准差\chb01_nor_biaozhuncha_d5.txt");
x2 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\CHB-MIT数据集\标准差\chb01_epil_biaozhuncha_d5.txt");

%%%%%%%设置数据标签
x = [x1;x2];
A = zeros(240,1);
B = ones(240,1);
label = [A;B];

%%%%%%K折CV
[m,n] = size(x);
indices = crossvalind('Kfold',m,5);

%%%%%%%%%%
%%%%%%%%%  train和test都是逻辑值
for i = 1:5
    test = (indices == i);
    train = ~test;
    data_train = x(train,:);
    data_test = x(test,:);
    label_train = label(train,:);
    label_test = label(test,:);
    model = fitcknn(data_train,label_train,'NumNeighbors',9);
    predict_label= predict(model,data_test);
   
    
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
    acc = ((aa+dd)/96)*100 ; 
 
    disp(['Accuracy:',num2str(acc),'%'])
    disp(['Sensitivity:',num2str(sen),'%'])
    disp(['Specificity:',num2str(spe),'%'])
    
    fid = fopen('E:\大学\大四学年（2019-2020）\下学期\毕设\结果\CHB-MIT数据集\KNN分类\标准差\test.txt','at');
    fprintf(fid,'%.4f  %.4f  %.4f\r\n',acc,sen,spe);
    fclose(fid);
    
%     figure;
%     hold on;
%     plot(predict_label,'r*');
%     plot(label_test,'bo');
%     title("KNN对chb01的分类结果（根据CD5的标准差）")

    
    
end
