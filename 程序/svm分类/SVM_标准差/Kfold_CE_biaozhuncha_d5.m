clear
clc

%%%%%%%读取数据
x1 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\C_biaozhuncha_d5.txt");
x2 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\E_biaozhuncha_d5.txt");

%%%%%%%设置数据标签
x = [x1;x2];
A = zeros(400,1);
B = ones(400,1);
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
    model = svmtrain(label_train,data_train);
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
%     title("支持向量机对CE两组的分类结果（根据CD5的标准差）")
end
