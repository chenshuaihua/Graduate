clc
clear

path = 'E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\B_O\';
namelist = dir([path,'*.txt']);
l = length(namelist);

p = cell(1,l);
%namelist(i).name;%�����õ�ֻ�Ǹ�·���µ��ļ�������1.txt�����·��
for i = 1:l
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
    p{1,i} = load(filename{i});
    a1 = p{1,i}(1:1024);
    a2 = p{1,i}(1025:2048);
    a3 = p{1,i}(2049:3072);
    a4 = p{1,i}(3073:4096);
    
    y1 = std(a1);
    y2 = std(a2);
    y3 = std(a3);
    y4 = std(a4);
    
    y = [y1;y2;y3;y4];
    
    fid = fopen('E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\1\B_��׼��\B_biaozhuncha.txt','at');
    
    for jj = 1:length(y)
        fprintf(fid,'%.4f\r\n',y(jj));
    end
    fclose(fid);
end










