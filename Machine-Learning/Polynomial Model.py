import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

dataset = pd.read_csv(r"/Users/manishuxuid/Desktop/FSDS/FSDS Notes/Octomber Classes Notes/6 oct/emp_sal.csv")


X = dataset.iloc[:,1:2].values

Y = dataset.iloc[:,2].values



from sklearn.linear_model import LinearRegression
lin_reg = LinearRegression()
lin_reg.fit(X, Y)

#linear regression model


plt.scatter(X, Y, color = 'red')
plt.plot(X, lin_reg.predict(X), color = 'blue')
plt.title('Linear Regression graph')
plt.xlabel('Position Level')
plt.ylabel('Salary')
plt.show()


from sklearn.preprocessing import PolynomialFeatures
poly_reg = PolynomialFeatures(degree = 5)
X_poly = poly_reg.fit_transform(X)


poly_reg.fit(X_poly,Y)

#linearRegression with second degree because of pply
lin_reg_2 = LinearRegression()
lin_reg_2.fit(X_poly,Y)

#POLY MODEL

plt.scatter(X, Y, color = 'red')
plt.plot(X, lin_reg_2.predict(poly_reg.fit_transform(X)),color ='blue')
plt.title("Truth of Bluff(polynomial Regression")
plt.xlabel('Position Level')
plt.ylabel('Salary')
plt.show()

#Linear Regression Model Prediction
lin_model_pred = lin_reg.predict([[6.5]])
lin_model_pred

#Polynomial Model Prediction
poly_model_pred = lin_reg_2.predict(poly_reg.fit_transform([[6.5]]))
poly_model_pred








