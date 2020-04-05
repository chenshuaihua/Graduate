%% ***********PCA降维*************

clear all;
clc;  
%% load 
%j:subject  i=test   t:叠加的target次数

t=10;   %//设定每个test里叠加的target次数    
all=load('E:\毕业设计陈露\Chen_数据\提标签\picture_100\picture_1.mat');
all_sample = all.y;

% for j=4:9   %/被试数
%     for i=1:20 
%         eval(['load E:\毕业设计\陈露\Chen_数据\提标签\letter_100\13\VP',num2str(j),'_1113','.mat']);  %//修改路径
%         f_mean=mean(feature(1:t,:));       %%取前t个靶刺激的平均
%         eval(['NO',num2str(j),'(',num2str(i),',:)=f_mean;']);
%     end
%     eval(['all_sample=[all_sample;NO',num2str(j),'];']);
%     eval(['clear NO',num2str(j),';']);
% end
% clear f_mean i j feature t;

%% 标准化
dataset=all_sample;  
stdr=std(dataset);                      %求出各变量标准差
[n,m]=size(dataset)                     %定义矩阵的行列数      
sr=(dataset-repmat(mean(dataset),n,1))./stdr(ones(n,1),:);   %将原始数据集体标准化

%% -----------PCA降维---------------------------------------
data=[];
p_chan=[];   %每一导的主成分个数
for chan=1:6;           %逐个导联进行PCA 6个导联
    ind=(1:21)+(chan-1)*21;  %14个采样点 21个
    g=sr(:,ind);         %取出某一导联
    l=size(g,2);         %A的列数
    [pc,score,eigenvalue,tsquare]=princomp(g);    %调用主成分分析数据  %pc:特征向量 ;  eigenvalue:相关系数阵的特征值
    a=sum(eigenvalue);      %  所有特征值的和
    cc=0; 
    j=0; 
    %主成分个数
    for i=1:l
        b(i)=eigenvalue(i)/a;       %各个特征值的贡献率
        cc=cc+b(i);
        c(i)=cc;                % 累计贡献率
        if cc>0.85&j==0
            j=i                        % 累计到第j个时，累计贡献率超过？
        end
    end
    p_chan=[p_chan,j];
    b=b';    % 各个特征值的贡献率
    c=c';    % 累计贡献率
    P=pc(:,1:j)        % 取前j个特征向量
    F=g*P;            % 各样本的前j个主成分得分，第一列为第一主成分，以此类推
    m=size(F,1);
    data_chan=(F-repmat(min(F),m,1))./repmat((max(F)-min(F)),m,1);  %归一化
    data=[data,data_chan];
end

%% ---------------SVM分类--------------------------------------
for i=1:2;
    label(((i-1)*6+1):6*i,1)=i;       %为样本生成标签，每名受试10个样本，标号相同
end
% [cc,c,g]=SVMcg(label,double(data));
accuracy=svmtrain(label,double(data), '-t 0 -c 1 -v 12');    %对所有sample做10折交叉验证后正确率求平均
% %-s svm类型：SVM设置类型(默认0)
% 　　0 -- C-SVC
% 　　1 --v-SVC
% 　　2 – 一类SVM
% 　　3 -- e -SVR
% 　　4 -- v-SVR
% 
% -t 核函数类型：核函数设置类型(默认2)
% 　　0 – 线性：u'v
% 　　1 – 多项式：(r*u'v + coef0)^degree
% 　　2 – RBF函数：exp(-r|u-v|^2)
% 　　3 –sigmoid：tanh(r*u'v + coef0)
% 
% -g r(gama)：核函数中的gamma函数设置(针对多项式/rbf/sigmoid核函数)
% 
% -c cost：设置C-SVC，e -SVR和v-SVR的参数(损失函数)(默认1)，惩罚系数
% 
% -n nu：设置v-SVC，一类SVM和v- SVR的参数(默认0.5)
% 
% -p p：设置e -SVR 中损失函数p的值(默认0.1)
% 
% -d degree：核函数中的degree设置(针对多项式核函数)(默认3)
% 
% -wi weight：设置第几类的参数C为weight*C(C-SVC中的C)(默认1)
% 
% -v n: n-fold交互检验模式，n为fold的个数，必须大于等于2


