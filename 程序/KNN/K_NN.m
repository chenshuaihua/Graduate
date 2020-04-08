%%%%%%%k-nn分类器

function [Rl] = K_NN(Train_data,Train_label,Test_data,Test_label)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
% if nargin < 5
%     error("参数不足！");
% elseif nargin < 6
%     Distance_mark = 'L2';
% end
%%%%%%%求出测试数据和训练数据
[row_Test,~] = size(Test_data);
row_Train = size(Train_data,1);
%%%%%%%%%%%%z-score规范化  
Mean = mean(Train_data);                 %%%%%%求训练数据的均值，按列求  求得行向量
Std = std(Train_data);                   %%%%%%求训练数据的方差，按列求  求得行向量
Train_data = (Train_data - ones(row_Train,1)*Mean)./(ones(row_Train,1)*Std);   %%%%规范化训练数据集   
Test_data = (Test_data - ones(row_Test,1)*Mean)./(ones(row_Test,1)*Std);
%un = unique(Train_label);
%numclasses = length(un);     %%%种类的数量

labels = zeros(row_Train,row_Test);   %%%%%1Xnumclasses 行向量
dist = zeros(row_Train,row_Test);
%%%%%%计算测试数据和所有训练数据间的距离，并排序
for i = 1:row_Test
    test = Test_data(i,:);
    for j = 1:row_Train
        train = Train_data(j,:);
        diff = test - train;
%         switch Distance_mark
%              case {'Euclidean',L2}
                dist(j:i) = norm(diff,2);
%              case 'L1'
%                 dist(j:i) = norm(diff,1);
           %%%%%%%%%%此处可以加上cos
%             otherwise 
%                 dist(j:i) = norm(diff,2);
%         end
    end
    %%%%%%%%%对dist矩阵进行排序   I矩阵是~中每一项对应于dist中的索引，排序按照升序进行
    [~,I] = sort(dist,1);
    %%%%%%%%%%%%求取I矩阵的列数  行数不需要求了，因为我们下面已经指定k=3了，该参数的话可以在下面改 
    [~,cdist] = size(I);
    for y = 1:cdist
        for z = 1:3                        %%%%%%此处指定k的值
            labels(z,y) = Train_label(I(z,y));     %%%%%%将训练数据对应的类别与训练数据训练结果对应
        end
    end
    %%%%%%%mode函数，Rl是矩阵labels中每一列出现最多元素的矩阵，即类别
    [Rl , ~] = mode(labels);
    %%%%%%%%r_Rl应该是1，行数是一
%     [r_Rl,c_Rl] = size(Rl);
%     cun = 0;
%     fal = 0;
%     %%%%%%%%%对照正确的标签，看正确的有多少个，错误的有多少个
%     for q = 1:c_Rl
%         if Rl(r_Rl,c_Rl) == Test_label(c_Rl)
%             cun = cun + 1;
%         else
%             fal = fal + 1; 
%         end
%     end
end

