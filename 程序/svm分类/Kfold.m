%%%%%%%%采用交叉验证的例子

clc
clear

data = [1;2;34;56;12;34;5;32;87;81;90;3;6;7;8;9;12;56;4;4;5;6;8;25;15;73;345;12;456;762;2;4;5;7;3;5;6;7;8;378;567;981];
label = [1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0];
[m,n] = size(data);

indices = crossvalind('Kfold',m,5);

for i = 1:5
    test = (indices == i);
    train = ~test;
    data_train = data(train,:);
    data_test = data(test,:);
    label_train = label(train,:);
    label_test = label(test,:);
end
