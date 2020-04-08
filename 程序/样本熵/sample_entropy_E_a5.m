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
    
    [ca1,la1] = wavedec(a1,5,'db4');   %%%%利用小波db4对信号进行5层分解
    [ca2,la2] = wavedec(a2,5,'db4');
    [ca3,la3] = wavedec(a3,5,'db4');
    [ca4,la4] = wavedec(a4,5,'db4');
    
    appao1_5 = appcoef(ca1,la1,'db4');
    appao2_5 = appcoef(ca2,la2,'db4');
    appao3_5 = appcoef(ca3,la3,'db4');
    appao4_5 = appcoef(ca4,la4,'db4');
    

    std_ao1_5 = std(appao1_5);
    std_ao2_5 = std(appao2_5);
    std_ao3_5 = std(appao3_5);
    std_ao4_5 = std(appao4_5);
    
    %%%%%%计算正常脑电信号经过小波分解后，小波系数的样本熵
    yd1 = SamEnVal(appao1_5,2,0.25*std_ao1_5);
    yd2 = SamEnVal(appao2_5,2,0.25*std_ao2_5);
    yd3 = SamEnVal(appao3_5,2,0.25*std_ao3_5);
    yd4 = SamEnVal(appao4_5,2,0.25*std_ao4_5);
    
    y = [yd1;yd2;yd3;yd4];
    fid = fopen('E:\大学\大四学年（2019-2020）\下学期\毕设\数据\1\样本熵\E_sampen_a5.txt','at');
    
    for jj = 1:length(y)
        fprintf(fid,'%.4f\r\n',y(jj));
    end
    fclose(fid);
end






