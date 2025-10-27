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
poly_reg = PolynomialFeatures(degree =5) #increase degree or less previous no degree
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

















