clc
clear

path = 'C:\Users\hasee\Desktop\数据1\chb01\epil\';
namelist = dir([path,'*.txt']);
l = length(namelist);

p = cell(1,l);
%namelist(i).name;%这里获得的只是该路径下的文件名，如1.txt是相对路径
for i = 1:l
    filename{i} = [path,namelist(i).name];%通过字符串拼接获得的就是绝对路径了
    p{1,i} = load(filename{i});
    a1 = p{1,i}(1:256);
    a2 = p{1,i}(257:512);
    a3 = p{1,i}(513:768);
    a4 = p{1,i}(769:1024);
    a5 = p{1,i}(1025:1280);
    a6 = p{1,i}(1281:1536);
    a7 = p{1,i}(1537:1792);
    a8 = p{1,i}(1793:2048);
    a9 = p{1,i}(2049:2304);
    a10 = p{1,i}(2305:2560);
    a11 = p{1,i}(2561:2816);
    a12 = p{1,i}(2817:3072);
    a13 = p{1,i}(3073:3328);
    a14 = p{1,i}(3329:3584);
    a15 = p{1,i}(3585:3840);
    a16 = p{1,i}(3841:4096);
    a17 = p{1,i}(4097:4352);
    a18 = p{1,i}(4353:4608);
    a19 = p{1,i}(4609:4864);
    a20 = p{1,i}(4865:5120);
    a21 = p{1,i}(5121:5376);
    a22 = p{1,i}(5377:5632);
    a23 = p{1,i}(5633:5888);
    a24 = p{1,i}(5889:6144);
    a25 = p{1,i}(6145:6400);
    a26 = p{1,i}(6401:6656);
    a27 = p{1,i}(6657:6912);
    a28 = p{1,i}(6913:7168);
    a29 = p{1,i}(7169:7424);
    a30 = p{1,i}(7425:7680);
    
    y1 = std(a1);
    y2 = std(a2);
    y3 = std(a3);
    y4 = std(a4);
    y5 = std(a5);
    y6 = std(a6);
    y7 = std(a7);
    y8 = std(a8);
    y9 = std(a9);
    y10 = std(a10);
    y11 = std(a11);
    y12 = std(a12);
    y13 = std(a13);
    y14 = std(a14);
    y15 = std(a15);
    y16 = std(a16);
    y17 = std(a17);
    y18 = std(a18);
    y19 = std(a19);
    y20 = std(a20);
    y21 = std(a21);
    y22 = std(a22);
    y23 = std(a23);
    y24 = std(a24);
    y25 = std(a25);
    y26 = std(a26);
    y27 = std(a27);
    y28 = std(a28);
    y29 = std(a29);
    y30 = std(a30);
    

    y = [y1;y2;y3;y4;y5;y6;y7;y8;y9;y10;y11;y12;y13;y14;y15;y16;y17;y18;y19;y20;y21;y22;y23;y24;y25;y26;y27;y28;y29;y30];
    
    fid = fopen('E:\大学\大四学年（2019-2020）\下学期\毕设\数据\CHB-MIT数据集\标准差\chb01_epil_biaozhuncha.txt','at');
    
    for jj = 1:length(y)
        fprintf(fid,'%.4f\r\n',y(jj));
    end
    fclose(fid);
end










