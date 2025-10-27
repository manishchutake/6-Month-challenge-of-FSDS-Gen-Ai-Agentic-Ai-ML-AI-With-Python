import numpy as np 
import matplotlib.pyplot as plt
import pandas as pd

dataset = pd.read_csv(r"/Users/manishuxuid/Desktop/FSDS/Practise / KNN & Naive Byes/logit classification.csv")



x = dataset.iloc[:,[2, 3]].values
y = dataset.iloc[:, -1].values

# spliting the dataset into train and test split

from sklearn.model_selection import train_test_split
x_train, x_test,y_train, y_test = train_test_split(x, y, test_size = 0.20, random_state = 0)

# feature scaling

from sklearn.preprocessing import StandardScaler
sc = StandardScaler()
x_train = sc.fit_transform(x_train)
x_test = sc.transform(x_test) 

# training the Naive Bayes model in  training set
from sklearn.naive_bayes import GaussianNB
classifier = GaussianNB()
classifier.fit(x_train, y_train)


# predicting the test set results 

y_pred = classifier.predict(x_test)

#confusion matrics
from sklearn.metrics import confusion_matrix
cm = confusion_matrix(y_test, y_pred)
print(cm)

#ACCURACY SCORE
from sklearn.metrics import accuracy_score
ac = accuracy_score(y_test, y_pred)
print(ac)



bias = classifier.score(x_train,y_train)
bias

# bernouli navive base = 0.825, minmaxscaler = 0.725, without scale = 0.725

# Gausian naive base = 0.9125 ,MINMAXSCAALER = 0.9125,WITHOUT SCALE (# to feature scale) =0.925,with normalizer = 0.725

# #multinomial naive base( it wont considered negative vaalue with standard scaler doesnot support with minmaxscaler
#= 0.7250, with normalizer = 0.7250)









