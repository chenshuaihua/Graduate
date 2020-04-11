clear
clc

%%%%%%%读取数据
x1 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\样本熵\A_sampen.txt");
x2 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\样本熵\E_sampen.txt");

x3 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\样本熵\A_sampen_d1.txt");
x4 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\样本熵\E_sampen_d1.txt");

x5 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\样本熵\A_sampen_d2.txt");
x6 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\样本熵\E_sampen_d2.txt");

x7 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\样本熵\A_sampen_d3.txt");
x8 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\样本熵\E_sampen_d3.txt");

x9 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\样本熵\A_sampen_d4.txt");
x10 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\样本熵\E_sampen_d4.txt");


%%%%%%%设置数据标签
x = [x1 x3 x5 x7 x9;x2 x4 x6 x8 x10];
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
%     title("支持向量机对AE两组的分类结果（根据原始脑电信号的样本熵）")
end
