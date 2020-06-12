# -*- coding: utf-8 -*-
"""
Created on Fri May  1 21:18:46 2020

@author: ILQMN
"""

import pandas as pd
from sklearn.model_selection import train_test_split

names = ['class','AE_biaozhuncha','AE_biaozhuncha_d1','AE_biaozhuncha_d2','AE_biaozhuncha_d3','AE_biaozhuncha_d4','AE_biaozhuncha_d5']

data = pd.read_csv(r'C:\Users\hasee\Desktop\新一轮毕设工作\AE-biaozhuncha-转csv-after-minmax.csv',header=None,names=names)

label = data[['class']]

sub_data = data.iloc[:,1:]

sub_data_train,sub_data_test,label_train,label_test = train_test_split(sub_data,label,test_size = 0.2,random_state = 0)