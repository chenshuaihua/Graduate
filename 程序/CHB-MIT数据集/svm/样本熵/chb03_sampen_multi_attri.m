clc
clear
%%%%%读取数据
xa = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\CHB-MIT数据集\样本熵\chb03_nor_sampen.txt");
xb = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\CHB-MIT数据集\样本熵\chb03_epil_sampen.txt");

xc = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\CHB-MIT数据集\样本熵\chb03_nor_sampen_d3.txt");
xd = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\CHB-MIT数据集\样本熵\chb03_epil_sampen_d3.txt");

%%%%%%%设置数据标签
x = [xa xc;xb xd ];
A = zeros(240,1);
B = ones(240,1);
label = [A;B];

%%%%%%标准化
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
%%%%%%%%%  train和test都是逻辑值
for i = 1:5
    test = (indices == i);
    train = ~test;
    data_train = y(train,:);
    data_test = y(test,:);
    label_train = label(train,:);
    label_test = label(test,:);
    model = svmtrain(label_train,data_train,'-t 2 -c 1  -g 8');
    [predict_label,accuracy,dec_values] = svmpredict(label_test,data_test,model);
    %%%%%%%%计算accuracy、sensitivity和specificity
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
    
    disp(['准确度为:',num2str(accuracy(1)),'%'])
    
    fid = fopen('E:\大学\大四学年（2019-2020）\下学期\毕设\结果\CHB-MIT数据集\SVM分类\样本熵\test2.txt','at');
    fprintf(fid,'%.4f  %.4f  %.4f\r\n',accuracy(1),sen,spe);
    fclose(fid);
    
%     figure;
%     hold on;
%     plot(predict_label,'r*');
%     plot(label_test,'bo');
%     title("支持向量机对chb03的分类结果（根据原始脑电信号及CD3的样本熵）")
end




