
# R을 활용한 데이터 전처리와, <<<굉장히 간단한>>> 확인 방법

>>> 7번

# 데이터 소환
setwd('경로')
data <- read.csv('Iris.csv')


# 데이터가 깔끔(Tidy)한지 확인
head(data)
summary(data)

data %>% duplicated()  # 중복값(모든 열/변수에 대해 같은 값을 갖는 행) 확인하기.
data %>% distinct()

#
par(mfrow=c(2,2))
plot(data$SepalLengthCm)
plot(data$SepalWidthCm)
plot(data$PetalLengthCm)
plot(data$PetalWidthCm)

#
par(mfrow=c(1,2))
plot(data$SepalLengthCm~data$SepalWidthCm, main="Iris With Sepal", xlab = 'Width', ylab='Length', col='red')
plot(data$PetalLengthCm~data$PetalWidthCm, main="Iris with Petal", xlab = 'Width', ylab='Length', col='blue')


>>> 8번

(View()함수 이용)

setwd('경로')
metro <- read.csv('seoulmetro.csv', fileEncoding = 'euc-kr')
View(metro) <- R 창으로 엑셀 화면과 유사한 화면을 출력할 수 있음

#
metroseoulst <- metro[metro$역명 == '서울역',]
# View(metroseoulst)   <- metro에 저장된 'seoulmetro.csv' 파일에서 '서울역' 출력

# SeoulMetroLine
SeoulMetroLine <- metro[metro$호선 == '1',]
View(SeoulMetroLine)   <- metro에 저장된 'seoulmetro.csv' 파일에서 '1'호선 출력


# SMLN(SeoulMetroLineNorth)
SMLN <- metro[metro$호선=='1' & metro$구분=='상선',]
View(SMLN)   <- metro에 저장된 'seoulmetro.csv' 파일에서 '상선'이면서 '1'호선 출력

# SMLN을 또다른 방식으로도 할 수 있음.
install.packages('dplyr')
library(dplyr)
metro %>%
  filter(호선=='1' & 구분=='상선') %>%
  View()

##### ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ #####

# 데이터프레임에서 행 분리
mystation <- metro[metro$구분=='상선' & metro$호선=='1' & metro$역명=='서울역',]
head(mystation)

mystationE <- subset(mystation, select=-c(연번,조사일자,호선,역번호,역명,구분))
mystationE
str(mystationE)

rownames(mystationE) = c('평일','토요일','일요일')
mystationE
str(mystationE)
# View(mystationE)

MST = t(mystationE)
str(MST)
head(MST)

##### ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ #####

par(mfrow=c(2,2))
plot(MST[,c(1)])
plot(MST[,c(2)])
plot(MST[,c(3)])

par(mfrow=c(2,2))
plot(MST[,c(1)], type='o', lwd=2, col='black', xlab = '시간', ylab='혼잡도(%)', main='서울역 상행선 평일 혼잡도')
plot(MST[,c(2)], type='o', lwd=2, col='blue', xlab = '시간', ylab='혼잡도(%)', main='서울역 상행선 토요일 혼잡도')
plot(MST[,c(3)], type='o', lwd=2, col='red', xlab = '시간', ylab='혼잡도(%)', main='서울역 상행선 일요일 혼잡도')

# plot : 기초적인 그래프 그리기 메소드
# par(mfrow=c(k1,k2)) : k1 x k2 형태의 그래프 출력. 예컨대 (2,2)이라면 하나의 화면을 4개로 분할하여 총 4가지의 그래프 출력 가능 (4개 안 채워도 상관 없음)
# type : 그래프의 형태
# lwd : 실선의 굵기
# col : 그래프의 색상
# xlab : x축의 대표명 설정
# ylab : y축의 대표명 설정
# main : 전체 그래프의 이름 설정

##### ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ #####

install.packages('ggplot2')
library(ggplot2)
# ㄴ ggplot 등을 이용한 구체적인 시각화 부터는 다음에 하겠습니다,,,,,
