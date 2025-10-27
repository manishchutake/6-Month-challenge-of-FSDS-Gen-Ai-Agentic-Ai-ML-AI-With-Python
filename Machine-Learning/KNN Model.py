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



# training the knn model in knn training set

from sklearn.neighbors import KNeighborsClassifier
classifier = KNeighborsClassifier()
classifier.fit(x_train, y_train)

# predicting the test set results 

y_pred = classifier.predict(x_test)

#confusion mATRICS
from sklearn.metrics import confusion_matrix
cm = confusion_matrix(y_test, y_pred)
print(cm)

#ACCURACY SCORE
from sklearn.metrics import accuracy_score
ac = accuracy_score(y_test, y_pred)
print(ac)



#this is to classification report

from sklearn.metrics import classification_report
cr = classification_report(y_test, y_pred)
cr

bias = classifier.score(x_train,y_train)
bias

variance = classifier.score(x_test,y_test)
variance


















