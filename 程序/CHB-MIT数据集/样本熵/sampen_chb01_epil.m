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
    
    r1 = std(a1);
    r2 = std(a2);
    r3 = std(a3);
    r4 = std(a4);
    r5 = std(a5);
    r6 = std(a6);
    r7 = std(a7);
    r8 = std(a8);
    r9 = std(a9);
    r10 = std(a10);
    r11 = std(a11);
    r12 = std(a12);
    r13 = std(a13);
    r14 = std(a14);
    r15 = std(a15);
    r16 = std(a16);
    r17 = std(a17);
    r18 = std(a18);
    r19 = std(a19);
    r20 = std(a20);
    r21 = std(a21);
    r22 = std(a22);
    r23 = std(a23);
    r24 = std(a24);
    r25 = std(a25);
    r26 = std(a26);
    r27 = std(a27);
    r28 = std(a28);
    r29 = std(a29);
    r30 = std(a30);
    
    y1 = SamEnVal(a1,2,0.25*r1);
    y2 = SamEnVal(a2,2,0.25*r2);
    y3 = SamEnVal(a3,2,0.25*r3);
    y4 = SamEnVal(a4,2,0.25*r4);
    y5 = SamEnVal(a5,2,0.25*r5);
    y6 = SamEnVal(a6,2,0.25*r6);
    y7 = SamEnVal(a7,2,0.25*r7);
    y8 = SamEnVal(a8,2,0.25*r8);
    y9 = SamEnVal(a9,2,0.25*r9);
    y10 = SamEnVal(a10,2,0.25*r10);
    y11 = SamEnVal(a11,2,0.25*r11);
    y12 = SamEnVal(a12,2,0.25*r12);
    y13 = SamEnVal(a13,2,0.25*r13);
    y14 = SamEnVal(a14,2,0.25*r14);
    y15 = SamEnVal(a15,2,0.25*r15);
    y16 = SamEnVal(a16,2,0.25*r16);
    y17 = SamEnVal(a17,2,0.25*r17);
    y18 = SamEnVal(a18,2,0.25*r18);
    y19 = SamEnVal(a19,2,0.25*r19);
    y20 = SamEnVal(a20,2,0.25*r20);
    y21 = SamEnVal(a21,2,0.25*r21);
    y22 = SamEnVal(a22,2,0.25*r22);
    y23 = SamEnVal(a23,2,0.25*r23);
    y24 = SamEnVal(a24,2,0.25*r24);
    y25 = SamEnVal(a25,2,0.25*r25);
    y26 = SamEnVal(a26,2,0.25*r26);
    y27 = SamEnVal(a27,2,0.25*r27);
    y28 = SamEnVal(a28,2,0.25*r28);
    y29 = SamEnVal(a29,2,0.25*r29);
    y30 = SamEnVal(a30,2,0.25*r30);

    
    y = [y1;y2;y3;y4;y5;y6;y7;y8;y9;y10;y11;y12;y13;y14;y15;y16;y17;y18;y19;y20;y21;y22;y23;y24;y25;y26;y27;y28;y29;y30];
    
    fid = fopen('E:\大学\大四学年（2019-2020）\下学期\毕设\数据\CHB-MIT数据集\样本熵\chb01_epil_sampen.txt','at');
    
    for jj = 1:length(y)
        fprintf(fid,'%.4f\r\n',y(jj));
    end
    fclose(fid);
end










