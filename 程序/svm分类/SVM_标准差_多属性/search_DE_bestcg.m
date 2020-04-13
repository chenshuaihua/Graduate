clear
clc

%%%%%%%读取数据
xa = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\D_biaozhuncha.txt");
xb = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\E_biaozhuncha.txt");

xc = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\D_biaozhuncha_d1.txt");
xd = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\E_biaozhuncha_d1.txt");

xe = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\D_biaozhuncha_d2.txt");
xf = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\E_biaozhuncha_d2.txt");

xg = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\D_biaozhuncha_d3.txt");
xh = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\E_biaozhuncha_d3.txt");

xi = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\D_biaozhuncha_d4.txt");
xj = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\E_biaozhuncha_d4.txt");

xk = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\D_biaozhuncha_d5.txt");
xl = load("E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\E_biaozhuncha_d5.txt");


%%%%%%%设置数据标签
x = [xa xc xe xg xi xk;xb xd xf xh xj xl];
y = ones(800,6)*nan;
A = zeros(400,1);
B = ones(400,1);
label = [A;B];

%%%%%%K折CV
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


data_train = [y(1:360,:);y(401:760,:)];
data_test = [y(361:400,:);y(761:800,:)];
label_train = [label(1:360,:);label(401:760,:)];
label_test = [label(361:400,:);label(761:800,:)];
[bestacc,bestc,bestg] = SVMcg(label_train,data_train,-5,5,-5,5,5,0.5,0.5,0.9);
disp(bestc);
disp(bestg);
% svmparams = ['-c ',num2str(bestc),' -g ',num2str(bestg)];
% model = svmtrain(label_train,data_train,svmparams);
% [predict_label,accuracy] = svmpredict(label_test,data_test,model);
%     
%     aa = 0;
%     bb = 0;
%     cc = 0;
%     dd = 0;
%     
%     for ss = 1:160
%         if (predict_label(ss) == label_test(ss) && label_test(ss)==0)
%             dd = dd+1;
%         elseif (predict_label(ss) ~= label_test(ss) && label_test(ss)==0)
%             bb = bb+1;
%         elseif (predict_label(ss) == label_test(ss) && label_test(ss)==1)
%             aa = aa+1;
%         elseif (predict_label(ss) ~= label_test(ss) && label_test(ss)==1)
%             cc = cc+1;
%         end
%     end
%     
%     sen = (aa/(aa+cc))*100;
%     spe = (dd/(bb+dd))*100;
%     disp(['Sensitivity:',num2str(sen),'%'])
%     disp(['Specificity:',num2str(spe),'%'])
%     
    
%     figure;
%     hold on;
%     plot(predict_label,'r*');
%     plot(label_test,'bo');
%     title("支持向量机对AE两组的分类结果（根据原始脑电信号及CD1-CD5的标准差）")


