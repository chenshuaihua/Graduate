clc
clear

path = 'C:\Users\hasee\Desktop\����1\chb03\epil\';
namelist = dir([path,'*.txt']);
l = length(namelist);

p = cell(1,l);
%namelist(i).name;%�����õ�ֻ�Ǹ�·���µ��ļ�������1.txt�����·��
for i = 1:l
    filename{i} = [path,namelist(i).name];%ͨ���ַ���ƴ�ӻ�õľ��Ǿ���·����
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
    
    [ca1,la1] = wavedec(a1,5,'db4');   %%%%����С��db4���źŽ���5��ֽ�
    [ca2,la2] = wavedec(a2,5,'db4');
    [ca3,la3] = wavedec(a3,5,'db4');
    [ca4,la4] = wavedec(a4,5,'db4');
    [ca5,la5] = wavedec(a5,5,'db4');
    [ca6,la6] = wavedec(a6,5,'db4');
    [ca7,la7] = wavedec(a7,5,'db4');
    [ca8,la8] = wavedec(a8,5,'db4');
    [ca9,la9] = wavedec(a9,5,'db4');
    [ca10,la10] = wavedec(a10,5,'db4');
    [ca11,la11] = wavedec(a11,5,'db4');   %%%%����С��db4���źŽ���5��ֽ�
    [ca12,la12] = wavedec(a12,5,'db4');
    [ca13,la13] = wavedec(a13,5,'db4');
    [ca14,la14] = wavedec(a14,5,'db4');
    [ca15,la15] = wavedec(a15,5,'db4');
    [ca16,la16] = wavedec(a16,5,'db4');
    [ca17,la17] = wavedec(a17,5,'db4');
    [ca18,la18] = wavedec(a18,5,'db4');
    [ca19,la19] = wavedec(a19,5,'db4');
    [ca20,la20] = wavedec(a20,5,'db4');
    [ca21,la21] = wavedec(a21,5,'db4');   %%%%����С��db4���źŽ���5��ֽ�
    [ca22,la22] = wavedec(a22,5,'db4');
    [ca23,la23] = wavedec(a23,5,'db4');
    [ca24,la24] = wavedec(a24,5,'db4');
    [ca25,la25] = wavedec(a25,5,'db4');
    [ca26,la26] = wavedec(a26,5,'db4');
    [ca27,la27] = wavedec(a27,5,'db4');
    [ca28,la28] = wavedec(a28,5,'db4');
    [ca29,la29] = wavedec(a29,5,'db4');
    [ca30,la30] = wavedec(a30,5,'db4');
   
    
    [detda1_1,detda1_2,detda1_3,detda1_4,detda1_5] = detcoef(ca1,la1,[1,2,3,4,5]);
    [detda2_1,detda2_2,detda2_3,detda2_4,detda2_5] = detcoef(ca2,la2,[1,2,3,4,5]);
    [detda3_1,detda3_2,detda3_3,detda3_4,detda3_5] = detcoef(ca3,la3,[1,2,3,4,5]);
    [detda4_1,detda4_2,detda4_3,detda4_4,detda4_5] = detcoef(ca4,la4,[1,2,3,4,5]);
    [detda5_1,detda5_2,detda5_3,detda5_4,detda5_5] = detcoef(ca5,la5,[1,2,3,4,5]);
    [detda6_1,detda6_2,detda6_3,detda6_4,detda6_5] = detcoef(ca6,la6,[1,2,3,4,5]);
    [detda7_1,detda7_2,detda7_3,detda7_4,detda7_5] = detcoef(ca7,la7,[1,2,3,4,5]);
    [detda8_1,detda8_2,detda8_3,detda8_4,detda8_5] = detcoef(ca8,la8,[1,2,3,4,5]);
    [detda9_1,detda9_2,detda9_3,detda9_4,detda9_5] = detcoef(ca9,la9,[1,2,3,4,5]);
    [detda10_1,detda10_2,detda10_3,detda10_4,detda10_5] = detcoef(ca10,la10,[1,2,3,4,5]);
    [detda11_1,detda11_2,detda11_3,detda11_4,detda11_5] = detcoef(ca11,la11,[1,2,3,4,5]);
    [detda12_1,detda12_2,detda12_3,detda12_4,detda12_5] = detcoef(ca12,la12,[1,2,3,4,5]);
    [detda13_1,detda13_2,detda13_3,detda13_4,detda13_5] = detcoef(ca13,la13,[1,2,3,4,5]);
    [detda14_1,detda14_2,detda14_3,detda14_4,detda14_5] = detcoef(ca14,la14,[1,2,3,4,5]);
    [detda15_1,detda15_2,detda15_3,detda15_4,detda15_5] = detcoef(ca15,la15,[1,2,3,4,5]);
    [detda16_1,detda16_2,detda16_3,detda16_4,detda16_5] = detcoef(ca16,la16,[1,2,3,4,5]);
    [detda17_1,detda17_2,detda17_3,detda17_4,detda17_5] = detcoef(ca17,la17,[1,2,3,4,5]);
    [detda18_1,detda18_2,detda18_3,detda18_4,detda18_5] = detcoef(ca18,la18,[1,2,3,4,5]);
    [detda19_1,detda19_2,detda19_3,detda19_4,detda19_5] = detcoef(ca19,la19,[1,2,3,4,5]);
    [detda20_1,detda20_2,detda20_3,detda20_4,detda20_5] = detcoef(ca20,la20,[1,2,3,4,5]);
    [detda21_1,detda21_2,detda21_3,detda21_4,detda21_5] = detcoef(ca21,la21,[1,2,3,4,5]);
    [detda22_1,detda22_2,detda22_3,detda22_4,detda22_5] = detcoef(ca22,la22,[1,2,3,4,5]);
    [detda23_1,detda23_2,detda23_3,detda23_4,detda23_5] = detcoef(ca23,la23,[1,2,3,4,5]);
    [detda24_1,detda24_2,detda24_3,detda24_4,detda24_5] = detcoef(ca24,la24,[1,2,3,4,5]);
    [detda25_1,detda25_2,detda25_3,detda25_4,detda25_5] = detcoef(ca25,la25,[1,2,3,4,5]);
    [detda26_1,detda26_2,detda26_3,detda26_4,detda26_5] = detcoef(ca26,la26,[1,2,3,4,5]);
    [detda27_1,detda27_2,detda27_3,detda27_4,detda27_5] = detcoef(ca27,la27,[1,2,3,4,5]);
    [detda28_1,detda28_2,detda28_3,detda28_4,detda28_5] = detcoef(ca28,la28,[1,2,3,4,5]);
    [detda29_1,detda29_2,detda29_3,detda29_4,detda29_5] = detcoef(ca29,la29,[1,2,3,4,5]);
    [detda30_1,detda30_2,detda30_3,detda30_4,detda30_5] = detcoef(ca30,la30,[1,2,3,4,5]);
    
    
    std_da1_2 = std(detda1_2);
    std_da2_2 = std(detda2_2);
    std_da3_2 = std(detda3_2);
    std_da4_2 = std(detda4_2);
    std_da5_2 = std(detda5_2);
    std_da6_2 = std(detda6_2);
    std_da7_2 = std(detda7_2);
    std_da8_2 = std(detda8_2);
    std_da9_2 = std(detda9_2);
    std_da10_2 = std(detda10_2);
    std_da11_2 = std(detda11_2);
    std_da12_2 = std(detda12_2);
    std_da13_2 = std(detda13_2);
    std_da14_2 = std(detda14_2);
    std_da15_2 = std(detda15_2);
    std_da16_2 = std(detda16_2);
    std_da17_2 = std(detda17_2);
    std_da18_2 = std(detda18_2);
    std_da19_2 = std(detda19_2);
    std_da20_2 = std(detda20_2);
    std_da21_2 = std(detda21_2);
    std_da22_2 = std(detda22_2);
    std_da23_2 = std(detda23_2);
    std_da24_2 = std(detda24_2);
    std_da25_2 = std(detda25_2);
    std_da26_2 = std(detda26_2);
    std_da27_2 = std(detda27_2);
    std_da28_2 = std(detda28_2);
    std_da29_2 = std(detda29_2);
    std_da30_2 = std(detda30_2);
    
    y1 = SamEnVal(a1,2,0.25*std_da1_2);
    y2 = SamEnVal(a2,2,0.25*std_da2_2);
    y3 = SamEnVal(a3,2,0.25*std_da3_2);
    y4 = SamEnVal(a4,2,0.25*std_da4_2);
    y5 = SamEnVal(a5,2,0.25*std_da5_2);
    y6 = SamEnVal(a6,2,0.25*std_da6_2);
    y7 = SamEnVal(a7,2,0.25*std_da7_2);
    y8 = SamEnVal(a8,2,0.25*std_da8_2);
    y9 = SamEnVal(a9,2,0.25*std_da9_2);
    y10 = SamEnVal(a10,2,0.25*std_da10_2);
    y11 = SamEnVal(a11,2,0.25*std_da11_2);
    y12 = SamEnVal(a12,2,0.25*std_da12_2);
    y13 = SamEnVal(a13,2,0.25*std_da13_2);
    y14 = SamEnVal(a14,2,0.25*std_da14_2);
    y15 = SamEnVal(a15,2,0.25*std_da15_2);
    y16 = SamEnVal(a16,2,0.25*std_da16_2);
    y17 = SamEnVal(a17,2,0.25*std_da17_2);
    y18 = SamEnVal(a18,2,0.25*std_da18_2);
    y19 = SamEnVal(a19,2,0.25*std_da19_2);
    y20 = SamEnVal(a20,2,0.25*std_da20_2);
    y21 = SamEnVal(a21,2,0.25*std_da21_2);
    y22 = SamEnVal(a22,2,0.25*std_da22_2);
    y23 = SamEnVal(a23,2,0.25*std_da23_2);
    y24 = SamEnVal(a24,2,0.25*std_da24_2);
    y25 = SamEnVal(a25,2,0.25*std_da25_2);
    y26 = SamEnVal(a26,2,0.25*std_da26_2);
    y27 = SamEnVal(a27,2,0.25*std_da27_2);
    y28 = SamEnVal(a28,2,0.25*std_da28_2);
    y29 = SamEnVal(a29,2,0.25*std_da29_2);
    y30 = SamEnVal(a30,2,0.25*std_da30_2);
    
    y = [y1;y2;y3;y4;y5;y6;y7;y8;y9;y10;y11;y12;y13;y14;y15;y16;y17;y18;y19;y20;y21;y22;y23;y24;y25;y26;y27;y28;y29;y30];
    
    fid = fopen('E:\��ѧ\����ѧ�꣨2019-2020��\��ѧ��\����\����\CHB-MIT���ݼ�\������\chb03epil_sampen_d2.txt','at');
    
    for jj = 1:length(y)
        fprintf(fid,'%.4f\r\n',y(jj));
    end
    fclose(fid);
end










