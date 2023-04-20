# -*- coding: utf-8 -*-
"""팀4_1차_과제

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1dQbKrKTwDiIigmAj8W9KvwUQ_vt82WoZ
"""

# 1
import numpy as np
Z = np.zeros(10)
Z[6] = 5
print(Z)

# 2
import numpy as np

a = np.random.random((3,3,3))
print(a)

# 3
Height = [175, 156, 184, 169, 177, 160, 154]
Weight = [68, 70, 74, 53, 56, 78, 35]

for i in range(len(Height)):
  bmi = (Weight[i] / Height[i] **2) * 10000
  if bmi > 23:
    print(f"Height: {Height[i]}, Weight: {Weight[i]}, BMI: {bmi:.1f}, 체중 상태: 비만")
  elif bmi <= 18:
    print(f"Height: {Height[i]}, Weight: {Weight[i]}, BMI: {bmi:.1f}, 체중 상태: 정상")
  else:
    print(f"Height: {Height[i]}, Weight: {Weight[i]}, BMI: {bmi:.1f}, 체중 상태: 저체중")

# 4
import pandas as pd
Data = {'age' : [23, 56, 25, 11, 34],
        'name' : ['가연', '영준', '재석', '호동', '미영'],
        'height' : [156, 188, 175, 180, 157]}
Sex = ['female', 'male', 'male', 'female', 'male']

df = pd.DataFrame(Data)
df['Sex'] = Sex

print(df)

import pandas as pd
import numpy as np

n=np.random.randint(0,100,8)

price=n*10
cars=pd.DataFrame({'price':price})
print(cars)

# 6
level = np.where(price <= 300, '저급', np.where(price >= 800, '고급', '중급'))

# 데이터프레임 생성
cars = pd.DataFrame({'Price': price, 'Level': level})

# 데이터프레임 출력
print(cars)

# 7
from sklearn.datasets import load_iris
import pandas as pd
iris = load_iris()



# 기존 데이터
print("기존 데이터")
irisDf = pd.DataFrame(data = iris.data, columns = iris.feature_names)
irisDf['target'] = iris.target
irisDf['target'] = irisDf['target'].map({0: "setosa", 1: "versicolor", 2: "virginica"})
print(irisDf)



# 결측치 확인
print("결측치 확인")
import pandas as pd
df = pd.DataFrame(iris.data)
print(df.isnull())



# 평균
print(f"평균: {irisDf.mean()}")
# 분산
print(f"분산: {irisDf.var()}")



# 표준화
print("표준화")
from sklearn.preprocessing import StandardScaler

x = iris.data
scaler = StandardScaler()
x_scaled = scaler.fit_transform(x)
print(x_scaled[:5])



# 정규화
from sklearn.preprocessing import MinMaxScaler
x, y = iris.data, iris.target

sc = MinMaxScaler()
xNorm = sc.fit_transform(x)

print("정규화 데이터")
irisNDf = pd.DataFrame(data = xNorm, columns = iris.feature_names)
irisNDf['target'] = iris.target
irisNDf['target'] = irisNDf['target'].map({0: "setosa", 1: "versicolor", 2: "virginica"})
print(irisNDf)

# 8
import pandas as pd
dfcsv = pd.read_csv('/content/drive/MyDrive/Colab Notebooks/data/서울교통공사_지하철혼잡도정보_20211231.csv', encoding ='cp949')

# 전체데이터출력
print('-----전체데이터출력-----')
print(dfcsv)

dfcsv = dfcsv.replace({'호선' : 15}, 5)
dfcsv = dfcsv.replace({'호선' : 13}, 2)
dfcsv = dfcsv.replace({'호선' : 14}, 2)

print("-----전체데이터-호선오류수정-----")
print(dfcsv)



# 결측치 확인
print("------결측치 확인------")
print(dfcsv.isnull().sum())

# 연변, ... 삭제
dfall = dfcsv.drop(['연번', '호선','역번호','구분', '조사일자', '역명'], axis=1)

print("-----통계값-----")
# 수치형 데이터의 통계값 추출(개수, 평균, 표준편차, 최솟값, 제 1사분위값, 중앙값, 중위값, 제 3분위값, 최댓값)
print(dfall.describe())



# ——————— 1호선
print("----- 1호선 -----")
df1 = dfcsv[dfcsv['호선']==1]
print(df1)



# 연번, … 삭제
df1 = df1.drop(['연번','호선','역번호','구분', '조사일자', '역명'], axis=1)

# 수치형 데이터의 통계값 추출(개수, 평균, 표준편차, 최솟값, 제 1사분위값, 중앙값, 중위값, 제 3분위값, 최댓값)
print(df1.describe())
