# -*- coding: utf-8 -*-
"""
Created on Sat May  2 15:45:36 2020

@author: ILQMN
"""

import pandas as pd
from sklearn.model_selection import train_test_split
import numpy as np 
from sklearn.metrics import accuracy_score
from sklearn.metrics import roc_curve
from sklearn.neighbors import KNeighborsClassifier #导入KNN
from sklearn.svm import SVC  #导入SVC
from sklearn.tree import DecisionTreeClassifier  #导入DT
from vecstack import stacking

#种类，特征向量
names = ['class','chb03_sampen','chb03_sampen_d3']

data = pd.read_csv(r'E:\大学\大四学年（2019-2020）\下学期\毕设\数据\CHB-MIT数据集\stacking\样本熵\chb03_sampen.csv',header=None,names=names)

label = data[['class']]

sub_data = data.iloc[:,1:]

sub_data_train,sub_data_test,label_train,label_test = train_test_split(sub_data,label,test_size = 0.2,random_state = 0)

models = [
    SVC(C=1,kernel='rbf',degree=3,gamma=8,coef0=0.0,shrinking=True,probability=False,tol=0.001),
    
    KNeighborsClassifier(n_neighbors=9,weights='uniform',algorithm='auto',p=2,metric='minkowski',metric_params=None,radius=None)]

S_train,S_test = stacking(models,
                          sub_data_train,label_train,sub_data_test,
                          regression=False,

                          mode='oof_pred_bag',

                          needs_proba=False,

                          save_dir=None,

                          metric=accuracy_score,

                          n_folds=5,

                          stratified=True,

                          shuffle=True,

                          random_state=0,

                          verbose=2
)


#cart算法采用的是 GINI 指数
model = DecisionTreeClassifier(criterion="gini",splitter="best",max_depth=None)

model = model.fit(S_train,label_train)


y_pred = model.predict(S_test)


print('预测结果：[%.8f]' % accuracy_score(label_test,y_pred))



