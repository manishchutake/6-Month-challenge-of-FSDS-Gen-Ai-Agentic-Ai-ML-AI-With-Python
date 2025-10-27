import numpy as np 
import matplotlib.pyplot as plt
import pandas as pd

dataset = pd.read_csv("/Users/manishuxuid/Desktop/FSDS/Practise /Logistic and SVM/logit classification.csv")
x = dataset.iloc[:,[2, 3]].values

y  = dataset.iloc[:,-1].values


from sklearn.model_selection import train_test_split
x_train, x_test, y_train, y_test= train_test_split(x, y, test_size = 0.25, random_state = 0)


from sklearn.preprocessing import StandardScaler

sc = StandardScaler()
x_train = sc.fit_transform(x_train)
x_test = sc.transform(x_test)



# building the logistic model

from sklearn.linear_model import LogisticRegression

classifier = LogisticRegression()
classifier.fit(x_train, y_train)

y_pred = classifier.predict(x_test)

# confusion matrix

from sklearn.metrics import confusion_matrix
cm = confusion_matrix(y_test, y_pred)
print(cm)


# so tp = 65, tn = 24, fp = 3, fn = 8


# model accuracy  = tp+tn/total = 65+24/100 = 89%

# accuracy score

from sklearn.metrics import accuracy_score
ac = accuracy_score(y_test, y_pred)
print(ac)

#.89 = 89%

# classification report

from sklearn.metrics import classification_report
cr = classification_report(y_test, y_pred)
print(cr)

# bias score

bias = classifier.score(x_train, y_train)
print(bias)

# variance score


variance = classifier.score(x_test, y_test)
print(variance)


# model prediction on future data or unseen data

dataset1 = pd.read_csv(r"/Users/manishuxuid/Desktop/FSDS/Practise /Logistic and SVM/final1.csv")
d2 = dataset1.copy()

dataset1=dataset1.iloc[:, [3, 4]].values

from sklearn.preprocessing import StandardScaler
sc = StandardScaler()

M = sc.fit_transform(dataset1)

y_pred1 = pd.DataFrame()

d2["y_pred1"] = classifier.predict(M)

d2.to_csv("final1.csv")

import os
os.getcwd()

# SVM(Support vector machine)

from sklearn.svm import SVC
classifier_svm = SVC()
classifier_svm.fit(x_train, y_train)

y_pred_svm = classifier_svm.predict(x_test)




# confusion matrix
from sklearn.metrics import confusion_matrix
cm = confusion_matrix(y_test, y_pred)
print(cm)



















