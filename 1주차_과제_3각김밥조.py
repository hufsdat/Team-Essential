# -*- coding: utf-8 -*-
"""1주차 과제_3각김밥조.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1NLFNfoUUSRlaEzEHkq7SKcXDQKbumDl2

# 1주차 Essential Team 과제

1.크기가 10인 Null 벡터를 생성하고 7번째 값을 5로 바꾸어 출력하시오.
"""

import numpy as np

num = np.zeros(10)
num[6] = 5

print(num)

"""2. 랜덤 값을 보유한 3x3x3 array를 생성하시오."""

arr = np.random.rand(3, 3, 3)
print(arr)

"""3. 다음과 같은 데이터가 주어졌을 때 bmi((몸무게/키^2) * 10000)를 구하고 각각에 대해 23을 넘으면 ‘비만’을, 18이하면 ‘저체중’을 그 사이일 때는 ‘정상’ 출력하시오.


Height = [175, 156, 184, 169, 177, 160] 

Weight = [68, 70, 74, 53, 56, 78, 35]
"""

Height = [175, 156, 184, 169, 177, 160, 154]
Weight = [68, 70, 74, 53, 56, 78, 35]

def bmi_check(bmi):
  if (bmi<=18):
    print(bmi, "저체중")
  elif (bmi<=23.0):
    print(bmi, "정상")
  else:
    print(bmi, "비만")


for i in range(len(Height)):
  h = Height[i]
  w = Weight[i]
  bmi = (w/(h*h))*10000
  bmi_check(round(bmi, 2))

"""4. 아래와 같은 데이터를 dataframe으로 변환하고 sex 컬럼을 추가하시오."""

Data = {'age' : [23, 56, 25, 11, 34],
'name' : ['가연', '영준', '재석', '호동', '미영'],
'height' : [156, 188, 175, 180, 157]}

import pandas as pd
Data_frame = pd.DataFrame(Data)

Sex = ['female', 'male', 'male', 'female', 'male']
Data_frame['Sex'] = Sex

Data_frame

"""5. 0에서 100보다 작은 수 8개를 무작위로 선택하여 각각의 값에 10을 곱한 후 price라는 Numpy 배 열에 저정한다. 그 후 price 배열을 cars라는 데이터프레임에 저장하여 출력하시오.

"""

import random
sample = random.sample(range(0, 100), 8)

for i in range(len(sample)):
  sample[i] *= 10

price = np.array(sample)

cars = pd.DataFrame(price, columns=['price'])
cars

"""6. 위 문제에서 ‘저급’, ‘중급’, ‘고급’을 가진 level 배열을 생성한 후 price값이 300이하는 저급, 800이상 은 고급, 나머지는 중급으로 분류하여 데이터프레임을 출력하시오."""

condlist = [
(cars['price']>=800),
(cars['price']<800) & (cars['price']>300),
(cars['price']<=300)]

choicelist = ['고급','중급','저급']

cars['level'] = np.select(condlist, choicelist)
cars