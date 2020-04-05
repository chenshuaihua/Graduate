
clear;
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
filedir=strcat('E:\毕业设计陈露\Chen_数据\505xuwei\picture_250\');   
file=dir(strcat('E:\毕业设计陈露\Chen_数据\505xuwei\picture_250\*.cnt'));
file_size=length(file);
filename_save='VP6_22'; %被试编号 VP5第五个受试 ‘1 ’第一种类型 letter    ‘1 ’100ms
filepath_save='E:\毕业设计陈露\';%%%保存时被试名称
for ii=1:file_size
    EEG = pop_loadcnt([filedir file(ii).name] , 'dataformat', 'int32');
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, ii,'gui','off');
end
EEG = eeg_checkset( EEG );

if file_size>1
EEG = pop_mergeset( ALLEEG, [1:file_size], 0); %合并set
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET,'gui','off'); 
EEG = eeg_checkset( EEG );
end

%%
% EEG= pop_select( EEG,'channel',{'Fz' 'F3' 'F4' 'F7' 'F8' 'Cz' 'C3' 'C4' 'TP7' 'TP8' 'Pz' 'P3' 'P4' 'PO7' 'PO8' 'Oz' 'O1' 'O2' 'M1' 'M2'});
EEG = pop_resample( EEG, 200);
EEGtemp = pop_eegfilt( EEG, 0.5, 0, [], [0]);
EEGtemp = pop_eegfilt( EEGtemp, 0, 45, [], [0]);
EEGtemp =eeg_checkset(EEGtemp);
EEGtemp=pop_reref(EEGtemp,[33 43]);%变参考 M1 M2平均
%EEG_pre= pop_select( EEGtemp,'nochannel',{'M1' 'M2' 'HEO' 'VEO' 'EKG' 'EMG'});
%pop_eegplot( EEG_pre, 1, 1, 1);
% [ALLEEG EEG] = eeg_store(ALLEEG, EEG_pre, CURRENTSET);
eeglab redraw;

%%
[ALLEEG EEG] = eeg_store(ALLEEG, EEGtemp, CURRENTSET);
EEG=eeg_checkset(EEG);
%run ica 跑起来太慢，调试时不运行
% EEG = pop_runica(EEG, 'icatype','runica','dataset',1,'options',{'extended' 1});
EEG = pop_chanedit(EEG, 'lookup','C:\Program Files\MATLAB\R2014a\toolbox\eeglab11_0_4_4b\plugins\dipfit2.2\standard_BESA\standard-10-5-cap385.elp');
%pop_selectcomps(EEG, [1:62] );
% pop_eegplot( EEG, 0, 1, 1);
% eeglab redraw;
Temp=[];
TAudiovisualMat=[];
NAudiovisualMat=[];
TAudioMat=[];
TVisionMat=[];
index=[];
for i=1:length(EEG.event)

    if EEG.urevent(i).type<10
        index=EEG.urevent(i).type;
    else
        if strcmp(EEG.urevent(i).type,'boundary')
            continue;
        else
        temp1=floor(EEG.urevent(i).type/10); %取整 V视觉
        temp2=rem(EEG.urevent(i).type,10);  %取余 A听觉 
        if temp1==index  &&  temp2~=index
                EEG.event(i).type=13;
% temp=EEG.data(:, (EEG.event(i).latency-40):(EEG.event(i).latency+160))-repmat(mean(EEG.data(:, (EEG.event(i).latency-40):EEG.event(i).latency),2),1,201);
% TVisionMat=[TVisionMat;temp];                
        end
        if temp2==index  &&  temp1~=index      
                EEG.event(i).type=31;
% temp=EEG.data(:, (EEG.event(i).latency-40):(EEG.event(i).latency+160))-repmat(mean(EEG.data(:, (EEG.event(i).latency-40):EEG.event(i).latency),2),1,201);
% TAudioMat=[TAudioMat;temp];  
        end
        if temp2==index   &&  temp1==index
            EEG.event(i).type=11;
% temp=EEG.data(:, (EEG.event(i).latency-40):(EEG.event(i).latency+160))-repmat(mean(EEG.data(:, (EEG.event(i).latency-40):EEG.event(i).latency),2),1,201);
% TAudiovisualMat=[TAudiovisualMat;temp];  
        end
        if temp2~=index   &&  temp1~=index
            EEG.event(i).type=33;
% temp=EEG.data(:, (EEG.event(i).latency-40):(EEG.event(i).latency+160))-repmat(mean(EEG.data(:, (EEG.event(i).latency-40):EEG.event(i).latency),2),1,201);
% NAudiovisualMat=[NAudiovisualMat;temp];  
        end
        
        
    end
    end
end

EEG = pop_saveset( EEG, 'filename',filename_save,'filepath',filepath_save);
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
% save([filename{mm,2},num2str(i),'.mat'],'dae_Targ1_Right','dae_Targ2_Right','dae_Targ3_Right','dae_Targ4_Right','latency_React_Right','React_Right_num');
% clear dae_Targ1_Right dae_Targ2_Right dae_Targ3_Right dae_Targ4_Right latency_React_Right React_Right_num
% j=0;
% for k=1:66
% for i=1:10
%     for j=1:20
%     Temp=[Temp;TAudioMat(k+(j-1)*66,:,i)];
%     end
% end
% TAudioMat=[TAudioMat;mean(Temp,1)];
% end
% 
% 
% Y=TAudionMat(20,:);
% X=[-200:5:800];
% xlabel('幅值');
% ylabel('时间');
% title('AERP');
% plot(X,Y);
% %  



% eeglab redraw;
% %%
% 
% j=0;
% AudioMat=[];
% VisionMat=[];
% tempAudioMat=[];
% tempVisionMat=[];
% for i=1:length(EEG.event)
%     if  j<=10
%     if EEG.urevent(i).type<10
%         index=EEG.urevent(i).type;
%         j=j+1;        
%         AudioMat(:,:,j)=tempAudioMat;
%         VisionMat(:,:,j)=tempAudioMat;
%         tempAudioMat=[];
%         tempVisionMat=[];
%     else
%         temp1=floor(EEG.urevent(i).type/10);
%         temp2=rem(EEG.urevent(i).type,10);
%         if temp1==index
%             temp=EEG.data(:, (EEG.urevent(i).latency-40):(EEG.urevent(i).latency+160))-repmat(mean(EEG.data(:, (EEG.urevent(i).latency-40):EEG.urevent(i).latency),2),1,201);
%             tempAudioMat=[tempAudioMat;temp];
%         end
%         if temp2==index          
%             temp=EEG.data(:, (EEG.urevent(i).latency-40):(EEG.urevent(i).latency+160))-repmat(mean(EEG.data(:, (EEG.urevent(i).latency-40):EEG.urevent(i).latency),2),1,201);
%             tempVisionMat=[tempVisionMat;temp];
%         end
%     end
%     end
% end
% 
% Temp=[];
% AudioChanMat=[];
% VisionChanMat=[];
% 
% for k=1:66
% for i=1:10
%     for j=1:20
%     Temp=[Temp;AudioMat(k+(j-1)*66,:,i)];
%     end
% end
% AudioChanMat=[AudioChanMat;mean(Temp,1)];
% end
% Y=AudioChanMat(20,:);
% X=[-200:5:800];
% xlabel('幅值');
% ylabel('时间');
% title('AERP');
% plot(X,Y);
% 
% for k=1:66
% for i=1:10
%     for j=1:20
%     Temp=[Temp;VisionMat(k+(j-1)*66,:,i)];
%     end
% end
% VisionChanMat=[VisionChanMat;mean(Temp,1)];
% end
% 
% Y=VisionChanMat(46,:);
% X=[-200:5:800];
% figure
% plot(X,Y);
% xlabel('时间');
% ylabel('幅值');
% title('VERP');
