clc
clear

path = 'E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\B_O\';
namelist = dir([path,'*.txt']);
l = length(namelist);

p = cell(1,l);
%namelist(i).name;%这里获得的只是该路径下的文件名，如1.txt是相对路径
for i = 1:l
    filename{i} = [path,namelist(i).name];%通过字符串拼接获得的就是绝对路径了
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
    
    fid = fopen('E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\B_标准差\B_biaozhuncha.txt','at');
    
    for jj = 1:length(y)
        fprintf(fid,'%.4f\r\n',y(jj));
    end
    fclose(fid);
end










