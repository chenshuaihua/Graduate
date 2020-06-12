clear
clc

%%%%%%%读取数据
x1 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\A_biaozhuncha_d4.txt");
x2 = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\E_biaozhuncha_d4.txt");

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
    %%%%%%%计算准确度，灵敏度和特异度
    sen = (aa/(aa+cc))*100;
    spe = (dd/(bb+dd))*100;
    acc = ((aa+dd)/160)*100 ; 
  
    disp(['Accuracy:',num2str(acc),'%'])
    disp(['Sensitivity:',num2str(sen),'%'])
    disp(['Specificity:',num2str(spe),'%'])
    
    fid = fopen('E:\大学\大四学年（2019-2020）\下学期\毕设\结果\DT分类\标准差\test.txt','at');
    fprintf(fid,'%.4f  %.4f  %.4f\r\n',acc,sen,spe);
    fclose(fid);
    
%     figure;
%     hold on;
%     plot(predict_label,'r*');
%     plot(label_test,'bo');
%     title("DT对AE两组的分类结果（根据CD4的标准差）")

end


