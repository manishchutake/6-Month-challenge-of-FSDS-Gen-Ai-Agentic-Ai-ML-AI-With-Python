#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Sep 28 20:45:18 2025

import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

dataset  = pd.read_csv("/Users/manishuxuid/Desktop/FSDS/FSDS Notes/19 sept- ML/Data (2).csv")

x = dataset.iloc[:, :-1].values
y = dataset.iloc [:, 3].values

from sklearn.impute import SimpleImputer

imputer = SimpleImputer()
imputer = imputer.fit(x[:, 1:3])
x[:, 1:3] = imputer.transform(x[:, 1:3])


from sklearn.preprocessing import LabelEncoder

labelencoder_x = LabelEncoder()
x[:,0] = labelencoder_x.fit_transform(x[:,0])

labelencoder_y = LabelEncoder()
y = labelencoder_y.fit_transform(y)


from sklearn.model_selection import train_test_split

x_train,x_test, y_train, y_test = train_test_split(x, y, test_size = 0.2, random_state = 0)


#Feature Scaling

from sklearn.preprocessing import StandardScaler

sc_x= StandardScaler()

x_train = sc_x.fit_transform(x_train)
x_test = sc_x.transform(x_test)



from sklearn.preprocessing import Normalizer

sc_x= Normalizer()

x_train = sc_x.fit_transform(x_train)
x_test = sc_x.transform(x_test)


