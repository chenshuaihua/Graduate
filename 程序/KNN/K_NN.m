%%%%%%%k-nn������

function [Rl] = K_NN(Train_data,Train_label,Test_data,Test_label)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
% if nargin < 5
%     error("�������㣡");
% elseif nargin < 6
%     Distance_mark = 'L2';
% end
%%%%%%%����������ݺ�ѵ������
[row_Test,~] = size(Test_data);
row_Train = size(Train_data,1);
%%%%%%%%%%%%z-score�淶��  
Mean = mean(Train_data);                 %%%%%%��ѵ�����ݵľ�ֵ��������  ���������
Std = std(Train_data);                   %%%%%%��ѵ�����ݵķ��������  ���������
Train_data = (Train_data - ones(row_Train,1)*Mean)./(ones(row_Train,1)*Std);   %%%%�淶��ѵ�����ݼ�   
Test_data = (Test_data - ones(row_Test,1)*Mean)./(ones(row_Test,1)*Std);
%un = unique(Train_label);
%numclasses = length(un);     %%%���������

labels = zeros(row_Train,row_Test);   %%%%%1Xnumclasses ������
dist = zeros(row_Train,row_Test);
%%%%%%����������ݺ�����ѵ�����ݼ�ľ��룬������
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
           %%%%%%%%%%�˴����Լ���cos
%             otherwise 
%                 dist(j:i) = norm(diff,2);
%         end
    end
    %%%%%%%%%��dist�����������   I������~��ÿһ���Ӧ��dist�е��������������������
    [~,I] = sort(dist,1);
    %%%%%%%%%%%%��ȡI���������  ��������Ҫ���ˣ���Ϊ���������Ѿ�ָ��k=3�ˣ��ò����Ļ������������ 
    [~,cdist] = size(I);
    for y = 1:cdist
        for z = 1:3                        %%%%%%�˴�ָ��k��ֵ
            labels(z,y) = Train_label(I(z,y));     %%%%%%��ѵ�����ݶ�Ӧ�������ѵ������ѵ�������Ӧ
        end
    end
    %%%%%%%mode������Rl�Ǿ���labels��ÿһ�г������Ԫ�صľ��󣬼����
    [Rl , ~] = mode(labels);
    %%%%%%%%r_RlӦ����1��������һ
%     [r_Rl,c_Rl] = size(Rl);
%     cun = 0;
%     fal = 0;
%     %%%%%%%%%������ȷ�ı�ǩ������ȷ���ж��ٸ���������ж��ٸ�
%     for q = 1:c_Rl
%         if Rl(r_Rl,c_Rl) == Test_label(c_Rl)
%             cun = cun + 1;
%         else
%             fal = fal + 1; 
%         end
%     end
end

