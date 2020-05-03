# -*- coding: utf-8 -*-
"""
Created on Fri May  1 20:55:53 2020

@author: ILQMN
"""
import pandas as pd

names = ['class','AE_biaozhuncha','AE_biaozhuncha_d1','AE_biaozhuncha_d2','AE_biaozhuncha_d3','AE_biaozhuncha_d4','AE_biaozhuncha_d5']

data = pd.read_csv(r'C:\Users\hasee\Desktop\AE-biaozhuncha-转csv.csv',header=None,names=names)

y = data[['class']]

x = data.iloc[:,1:]

