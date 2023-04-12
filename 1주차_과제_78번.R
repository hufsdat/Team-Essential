# 0.패키지 라이브러리 
#install.packages("dplyr")
library(dplyr)
library(ggplot2)

# 1. 결측치 확인
sum(is.na(iris))

# 2. 데이터 분포 확인 
str(iris)

# 3. 품종 확인 
setosa<- filter(iris, Species=="setosa")
head(setosa)

versicolor<- filter(iris, Species=="versicolor")
head(versicolor)

virginica<- filter(iris, Species=="virginica")
head(virginica)

# 4. 품종별 시각화
ggplot(setosa, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point(color = "red") +
  labs(title = "Species of setosa",
       x = "Sepal Length",
       y = "Sepal Width")

ggplot(versicolor, aes(x = Petal.Length, y = Petal.Width, color = Species)) +
  geom_point(color ="green") +
  labs(title = "Species of versicolor",
       x = "Petal Length",
       y = "Petal Width",
       )

ggplot(virginica, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point(color = "blue") +
  labs(title = "Species of virginica",
       x = "Sepal Length",
       y = "Sepal Width")
       
ggplot()+
  geom_point(data=iris, aes(x=Sepal.Length,y=Sepal.Width,color=Species))+
  theme(legend.position = 'top')



# 데이터 불러오기
data(mtcars)

# 데이터 전처리하기
# 1. 결측치 확인
sum(is.na(mtcars)) # 결과: 0 (결측치 없음)

# 2. 열 이름 바꾸기
colnames(mtcars) <- c("모델명", "실린더수", "배기량", "마력", "차체중", 
                      "전속비", "0-60mph 가속시간", "4분음주 달린거리", "카반율", "기어수", "소비연비")

# 3. 문자열 처리하기
mtcars$모델명 <- str_replace_all(mtcars$모델명, "-", " ")

# 4. 수치 데이터 처리하기

# cc를 인치로 변환
mtcars$배기량 <- mtcars$배기량 / 61.0237  
# kW를 hp로 변환
mtcars$마력 <- mtcars$마력 / 1.34102 
# kg를 lb로 변환
mtcars$차체중 <- mtcars$차체중 / 2.20462 
# 변속비를 4단으로 표시
mtcars$전속비 <- mtcars$전속비 / 4.11  
# mpg를 km/l로 변환
mtcars$소비연비 <- mtcars$소비연비 * 1.60934 / 3.78541  


# 5. 필요한 열 선택하기
mtcars_select <- mtcars[, c("모델명", "실린더수", "배기량", "마력", "차체중", "카반율", "기어수", "소비연비")]

# 6. 데이터 정렬하기
mtcars_sorted <- mtcars_select[order(mtcars_select$소비연비, decreasing = TRUE), ]

# 연비와 마력의 관계 시각화
ggplot(data = mtcars_sorted, aes(x = 마력, y = 소비연비)) +
  geom_point(size = 4, color = "#2E9FDF") +
  labs(x = "(hp)", y = "fuel efficiency")
  theme_bw()

# 연비와 마력의 관계 시각화
ggplot(data = mtcars_sorted, aes(x = 마력, y = 차체중)) +
    geom_point(size = 4, color = "#009900") +
    labs(x = "(hp)", y = "weight")
  theme_bw()

