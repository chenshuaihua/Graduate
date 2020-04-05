%% ***********PCA��ά*************

clear all;
clc;  
%% load 
%j:subject  i=test   t:���ӵ�target����

t=10;   %//�趨ÿ��test����ӵ�target����    
all=load('E:\��ҵ��Ƴ�¶\Chen_����\���ǩ\picture_100\picture_1.mat');
all_sample = all.y;

% for j=4:9   %/������
%     for i=1:20 
%         eval(['load E:\��ҵ���\��¶\Chen_����\���ǩ\letter_100\13\VP',num2str(j),'_1113','.mat']);  %//�޸�·��
%         f_mean=mean(feature(1:t,:));       %%ȡǰt���д̼���ƽ��
%         eval(['NO',num2str(j),'(',num2str(i),',:)=f_mean;']);
%     end
%     eval(['all_sample=[all_sample;NO',num2str(j),'];']);
%     eval(['clear NO',num2str(j),';']);
% end
% clear f_mean i j feature t;

%% ��׼��
dataset=all_sample;  
stdr=std(dataset);                      %�����������׼��
[n,m]=size(dataset)                     %��������������      
sr=(dataset-repmat(mean(dataset),n,1))./stdr(ones(n,1),:);   %��ԭʼ���ݼ����׼��

%% -----------PCA��ά---------------------------------------
data=[];
p_chan=[];   %ÿһ�������ɷָ���
for chan=1:6;           %�����������PCA 6������
    ind=(1:21)+(chan-1)*21;  %14�������� 21��
    g=sr(:,ind);         %ȡ��ĳһ����
    l=size(g,2);         %A������
    [pc,score,eigenvalue,tsquare]=princomp(g);    %�������ɷַ�������  %pc:�������� ;  eigenvalue:���ϵ���������ֵ
    a=sum(eigenvalue);      %  ��������ֵ�ĺ�
    cc=0; 
    j=0; 
    %���ɷָ���
    for i=1:l
        b(i)=eigenvalue(i)/a;       %��������ֵ�Ĺ�����
        cc=cc+b(i);
        c(i)=cc;                % �ۼƹ�����
        if cc>0.85&j==0
            j=i                        % �ۼƵ���j��ʱ���ۼƹ����ʳ�����
        end
    end
    p_chan=[p_chan,j];
    b=b';    % ��������ֵ�Ĺ�����
    c=c';    % �ۼƹ�����
    P=pc(:,1:j)        % ȡǰj����������
    F=g*P;            % ��������ǰj�����ɷֵ÷֣���һ��Ϊ��һ���ɷ֣��Դ�����
    m=size(F,1);
    data_chan=(F-repmat(min(F),m,1))./repmat((max(F)-min(F)),m,1);  %��һ��
    data=[data,data_chan];
end

%% ---------------SVM����--------------------------------------
for i=1:2;
    label(((i-1)*6+1):6*i,1)=i;       %Ϊ�������ɱ�ǩ��ÿ������10�������������ͬ
end
% [cc,c,g]=SVMcg(label,double(data));
accuracy=svmtrain(label,double(data), '-t 0 -c 1 -v 12');    %������sample��10�۽�����֤����ȷ����ƽ��
% %-s svm���ͣ�SVM��������(Ĭ��0)
% ����0 -- C-SVC
% ����1 --v-SVC
% ����2 �C һ��SVM
% ����3 -- e -SVR
% ����4 -- v-SVR
% 
% -t �˺������ͣ��˺�����������(Ĭ��2)
% ����0 �C ���ԣ�u'v
% ����1 �C ����ʽ��(r*u'v + coef0)^degree
% ����2 �C RBF������exp(-r|u-v|^2)
% ����3 �Csigmoid��tanh(r*u'v + coef0)
% 
% -g r(gama)���˺����е�gamma��������(��Զ���ʽ/rbf/sigmoid�˺���)
% 
% -c cost������C-SVC��e -SVR��v-SVR�Ĳ���(��ʧ����)(Ĭ��1)���ͷ�ϵ��
% 
% -n nu������v-SVC��һ��SVM��v- SVR�Ĳ���(Ĭ��0.5)
% 
% -p p������e -SVR ����ʧ����p��ֵ(Ĭ��0.1)
% 
% -d degree���˺����е�degree����(��Զ���ʽ�˺���)(Ĭ��3)
% 
% -wi weight�����õڼ���Ĳ���CΪweight*C(C-SVC�е�C)(Ĭ��1)
% 
% -v n: n-fold��������ģʽ��nΪfold�ĸ�����������ڵ���2


