#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

dataset = pd.read_csv(r"/Users/manishuxuid/Desktop/FSDS/Practise /Non Linear Regression-Polynomial/emp_sal.csv")

x = dataset.iloc[:,1:2].values

y = dataset.iloc[:,2].values


from sklearn.linear_model import LinearRegression
lin_reg = LinearRegression()
lin_reg.fit(x, y)


# Linear Regression Visualization

plt.scatter(x, y, color = "red")
plt.plot(x, lin_reg.predict(x), color  = "blue")
plt.title("Linear Regression graph")
plt.xlabel("Position Level")
plt.ylabel("Salary")
plt.show()




from sklearn.preprocessing import PolynomialFeatures
poly_reg = PolynomialFeatures(degree =5) #increase degree or less previous no gegree
x_poly = poly_reg.fit_transform(x)

poly_reg.fit(x_poly, y)

# again linear model build with2nd degree
lin_reg_2 = LinearRegression()
lin_reg_2.fit(x_poly, y)


#  PolyLinear Regression Visulaization

plt.scatter(x, y, color = "red")
plt.plot(x, lin_reg_2.predict(poly_reg.fit_transform(x)), color  = "blue")
plt.title("Truth or Bluff(Polynomial Regression)")
plt.xlabel("Position Level")
plt.ylabel("Salary")
plt.show()


# Prediction

lin_model_pred= lin_reg.predict([[6.5]])
lin_model_pred

poly_model_pred = lin_reg_2.predict(poly_reg.fit_transform([[6.5]]))

poly_model_pred




# Polynomial Model

# linear regression -for 6.5 level model prediction

# poly model 2 - 189

# poly model 3 - 133

# poly model 4 - 158

# poly model 5 - 174


# SVR MODEL


from sklearn.svm import SVR
svr_model = SVR()
svr_model.fit(x, y)
svr_model_pred= svr_model.predict([[6.5]])
print(svr_model_pred)


# we can compare because of that simple  linear and polynomial linear



# KNN Regression Model

from sklearn.neighbors import KNeighborsRegressor

knn_model = KNeighborsRegressor(n_neighbors=5, weights= "distance", algorithm= "brute", p= 2)
knn_model.fit(x, y)

knn_model_pred= knn_model.predict([[6.5]])
print(knn_model_pred)


# Decision tree model

from sklearn.tree import DecisionTreeRegressor

dt_model = DecisionTreeRegressor()

dt_model.fit(x, y)

dt_model_pred= dt_model.predict([[6.5]])
print(dt_model_pred)


# Random forest

from sklearn.ensemble import RandomForestRegressor
rf_model = RandomForestRegressor(n_estimators = 23,random_state = 0)

rf_model.fit(x, y)


rf_model_pred = rf_model.predict([[6.5]])

print(rf_model_pred)

















