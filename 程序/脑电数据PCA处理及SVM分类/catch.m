% EEGLAB history file generated on the 07-Dec-2017
% ------------------------------------------------
%所有标签时段提取出来
clear;
clc;
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
filepath='E:\毕业设计陈露\Chen_数据\setfile\4-9\5\';   % 文件夹位置
filedir='E:\毕业设计陈露\Chen_数据\setfile\4-9\5\*.set';
filename= dir(filedir);
filesavepath = 'E:\毕业设计陈露\Chen_数据\新标签\5\';
label={'11','13','31','33'};
j=4;
% filename1= 'VP4_121.set';
% filename2= 'VP4_122.set';
% filename3= 'VP4_123.set';
% filename4= 'VP4_124.set';

for i=1:length(filename)
%      for j=1:length(label)
        fileSavename=strcat(filename(i).name(1:end-4),label(j),'.set');
        EEG = eeg_checkset( EEG );
        EEG = pop_loadset('filename',filename(i).name,'filepath',filepath);
        EEG = eeg_checkset( EEG );
        EEG = pop_select( EEG,'nochannel',{'M1' 'M2' 'HEO' 'VEO' 'EKG' 'EMG'});
        EEG = eeg_checkset( EEG );
        EEG = pop_epoch( EEG , {label{j}} , [-0.25         0.8] , 'newname',fileSavename{1}, 'epochinfo', 'yes');
        EEG = eeg_checkset( EEG );
        EEG = pop_rmbase( EEG, [-250    0]);
        EEG = eeg_checkset( EEG );
        EEG = pop_saveset( EEG, 'filename',fileSavename{1},'filepath',filesavepath);
     end
% end
% EEG = pop_saveset( EEG, 'filename',filename1,'filepath',filepath);

% EEG = pop_loadset('filename',filename,'filepath','E:\\毕业设计 陈露\\Chen 数据\\setfile\\4-9\\');
% EEG = pop_epoch( EEG, {'13'}, [-0.25         0.8], 'newname',filename2, 'epochinfo', 'yes');
% EEG = eeg_checkset( EEG );
% EEG = pop_rmbase( EEG, [-250    0]); 
% EEG = eeg_checkset( EEG );
% EEG = pop_saveset( EEG, 'filename',filename2,'filepath',filepath);
% 
% EEG = pop_loadset('filename',filename,'filepath','E:\\毕业设计 陈露\\Chen 数据\\setfile\\4-9\\');
% EEG = pop_epoch( EEG, {'31'}, [-0.25         0.8], 'newname',filename3, 'epochinfo', 'yes');
% EEG = eeg_checkset( EEG );
% EEG = pop_rmbase( EEG, [-250    0]);
% EEG = eeg_checkset( EEG );
% EEG = pop_saveset( EEG, 'filename',filename3,'filepath',filepath);
% 
% EEG = pop_loadset('filename',filename,'filepath','E:\\毕业设计 陈露\\Chen 数据\\setfile\\4-9\\');
% EEG = pop_epoch( EEG, {'33'}, [-0.25         0.8], 'newname',filename4, 'epochinfo', 'yes');
% EEG = eeg_checkset( EEG );
% EEG = pop_rmbase( EEG, [-250    0]);
% EEG = eeg_checkset( EEG );
% EEG = pop_saveset( EEG, 'filename',filename4,'filepath',filepath);
