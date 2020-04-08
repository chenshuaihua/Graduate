clc
clear


path = 'E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\E_S\';
namelist = dir([path,'*.txt']);
l = length(namelist);

p = cell(1,l);
for i = 1:l
    filename{i} = [path,namelist(i).name];%通过字符串拼接获得的就是绝对路径了
    p{1,i} = load(filename{i});
    a1 = p{1,i}(1:1024);
    a2 = p{1,i}(1025:2048);
    a3 = p{1,i}(2049:3072);
    a4 = p{1,i}(3073:4096);
    
    r1 = std(a1);
    r2 = std(a2);
    r3 = std(a3);
    r4 = std(a4);
    
    %%%%%%计算正常脑电信号的样本熵
    y1 = SamEnVal(a1,2,0.25*r1);
    y2 = SamEnVal(a2,2,0.25*r2);
    y3 = SamEnVal(a3,2,0.25*r3);
    y4 = SamEnVal(a4,2,0.25*r4);
    
    y = [y1;y2;y3;y4];
    
    fid = fopen('E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\样本熵\E_sampen.txt','at');
    
    for jj = 1:length(y)
        fprintf(fid,'%.4f\r\n',y(jj));
    end
    fclose(fid);
end



