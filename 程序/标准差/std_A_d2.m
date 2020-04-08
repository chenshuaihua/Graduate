clc
clear

path = 'E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\A_Z\';
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
    
    [ca1,la1] = wavedec(a1,5,'db4');   %%%%利用小波db4对信号进行5层分解
    [ca2,la2] = wavedec(a2,5,'db4');
    [ca3,la3] = wavedec(a3,5,'db4');
    [ca4,la4] = wavedec(a4,5,'db4');
    
    
    [detda1_1,detda1_2,detda1_3,detda1_4,detda1_5] = detcoef(ca1,la1,[1,2,3,4,5]);
    [detda2_1,detda2_2,detda2_3,detda2_4,detda2_5] = detcoef(ca2,la2,[1,2,3,4,5]);
    [detda3_1,detda3_2,detda3_3,detda3_4,detda3_5] = detcoef(ca3,la3,[1,2,3,4,5]);
    [detda4_1,detda4_2,detda4_3,detda4_4,detda4_5] = detcoef(ca4,la4,[1,2,3,4,5]);
    
    std_da1_2 = std(detda1_2);
    std_da2_2 = std(detda2_2);
    std_da3_2 = std(detda3_2);
    std_da4_2 = std(detda4_2);
    
    y = [std_da1_2;std_da2_2;std_da3_2;std_da4_2];
    
    fid = fopen('E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\标准差\A_biaozhuncha_d2.txt','at');
    
    for jj = 1:length(y)
        fprintf(fid,'%.4f\r\n',y(jj));
    end
    fclose(fid);
end