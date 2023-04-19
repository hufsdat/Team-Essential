>>> 7번 시각화
Iris 데이터
head(iris)
install.packages('ggplot2')
library(ggplot2)
ggplot(iris, aes(Sepal.Length, Sepal.Width)) + geom_point(aes(colour = Species))
ggplot(iris, aes(Petal.Length, Petal.Width)) + geom_point(aes(colour = Species))





>>> 8번 시각화

---
title: "예제 8번"
output: html_document
date: "2023-04-12"
---

```{r, error = T}

library(dplyr)
library(tidyr)
library(ggplot2)

# 데이터 불러오기
subway1 <- read.csv("subway_line1.csv")


# 데이터를 long format으로 변환하기
subway_long <- subway1 %>% 
  gather(key = "time", value = "minutes")

# 시간 변수 추출
subway_long$time <- gsub("X", "", subway_long$time) # "X" 제거
subway_long$time <- gsub("시", ":", subway_long$time) # "시"를 ":"로 대체
subway_long$time <- gsub("분", "", subway_long$time) # "분" 제거

# 박스플롯 그리기
ggplot(subway_long, aes(x = time, y = minutes)) +
  geom_boxplot(fill = "#69b3a2", color = "black") +
  xlab("Time") +
  ylab("Minutes") +
  ggtitle("Subway Line 1 Time Boxplot") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))

```
```{r, error = T}

# 데이터 불러오기
subway2 <- read.csv("subway_line2.csv")

# 데이터를 long format으로 변환하기
subway_long <- subway2 %>% 
  gather(key = "time", value = "minutes")

# 시간 변수 추출
subway_long$time <- gsub("X", "", subway_long$time) # "X" 제거
subway_long$time <- gsub("시", ":", subway_long$time) # "시"를 ":"로 대체
subway_long$time <- gsub("분", "", subway_long$time) # "분" 제거

# 박스플롯 그리기
ggplot(subway_long, aes(x = time, y = minutes)) +
  geom_boxplot(fill = "#69b3a2", color = "black") +
  xlab("Time") +
  ylab("Minutes") +
  ggtitle("Subway Line 2 Time Boxplot") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))
```

```{r, error = T}
# 데이터 불러오기
subway3 <- read.csv("subway_line3.csv")

# 데이터를 long format으로 변환하기
subway_long <- subway3 %>% 
  gather(key = "time", value = "minutes")

# 시간 변수 추출
subway_long$time <- gsub("X", "", subway_long$time) # "X" 제거
subway_long$time <- gsub("시", ":", subway_long$time) # "시"를 ":"로 대체
subway_long$time <- gsub("분", "", subway_long$time) # "분" 제거

# 박스플롯 그리기
ggplot(subway_long, aes(x = time, y = minutes)) +
  geom_boxplot(fill = "#69b3a2", color = "black") +
  xlab("Time") +
  ylab("Minutes") +
  ggtitle("Subway Line 3 Time Boxplot") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))
```

```{r, error = T}

# 데이터 불러오기
subway4 <- read.csv("subway_line4.csv")

# 데이터를 long format으로 변환하기
subway_long <- subway4 %>% 
  gather(key = "time", value = "minutes")

# 시간 변수 추출
subway_long$time <- gsub("X", "", subway_long$time) # "X" 제거
subway_long$time <- gsub("시", ":", subway_long$time) # "시"를 ":"로 대체
subway_long$time <- gsub("분", "", subway_long$time) # "분" 제거

# 박스플롯 그리기
ggplot(subway_long, aes(x = time, y = minutes)) +
  geom_boxplot(fill = "#69b3a2", color = "black") +
  xlab("Time") +
  ylab("Minutes") +
  ggtitle("Subway Line 4 Time Boxplot") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))

```
```{r, error = T}


# 데이터 불러오기
subway5 <- read.csv("subway_line5.csv")

# 데이터를 long format으로 변환하기
subway_long <- subway5 %>% 
  gather(key = "time", value = "minutes")

# 시간 변수 추출
subway_long$time <- gsub("X", "", subway_long$time) # "X" 제거
subway_long$time <- gsub("시", ":", subway_long$time) # "시"를 ":"로 대체
subway_long$time <- gsub("분", "", subway_long$time) # "분" 제거

# 박스플롯 그리기
ggplot(subway_long, aes(x = time, y = minutes)) +
  geom_boxplot(fill = "#69b3a2", color = "black") +
  xlab("Time") +
  ylab("Minutes") +
  ggtitle("Subway Line 5 Time Boxplot") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))

```
```{r, error = T}


# 데이터 불러오기
subway6 <- read.csv("subway_line6.csv")

# 데이터를 long format으로 변환하기
subway_long <- subway6 %>% 
  gather(key = "time", value = "minutes")

# 시간 변수 추출
subway_long$time <- gsub("X", "", subway_long$time) # "X" 제거
subway_long$time <- gsub("시", ":", subway_long$time) # "시"를 ":"로 대체
subway_long$time <- gsub("분", "", subway_long$time) # "분" 제거

# 박스플롯 그리기
ggplot(subway_long, aes(x = time, y = minutes)) +
  geom_boxplot(fill = "#69b3a2", color = "black") +
  xlab("Time") +
  ylab("Minutes") +
  ggtitle("Subway Line 6 Time Boxplot") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))

```

```{r, error = T}


# 데이터 불러오기
subway7 <- read.csv("subway_line7.csv")

# 데이터를 long format으로 변환하기
subway_long <- subway7 %>% 
  gather(key = "time", value = "minutes")

# 시간 변수 추출
subway_long$time <- gsub("X", "", subway_long$time) # "X" 제거
subway_long$time <- gsub("시", ":", subway_long$time) # "시"를 ":"로 대체
subway_long$time <- gsub("분", "", subway_long$time) # "분" 제거

# 박스플롯 그리기
ggplot(subway_long, aes(x = time, y = minutes)) +
  geom_boxplot(fill = "#69b3a2", color = "black") +
  xlab("Time") +
  ylab("Minutes") +
  ggtitle("Subway Line 7 Time Boxplot") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))

```

```{r, error = T}

# 데이터 불러오기
subway8 <- read.csv("subway_line8.csv")

# 데이터를 long format으로 변환하기
subway_long <- subway8 %>% 
  gather(key = "time", value = "minutes")

# 시간 변수 추출
subway_long$time <- gsub("X", "", subway_long$time) # "X" 제거
subway_long$time <- gsub("시", ":", subway_long$time) # "시"를 ":"로 대체
subway_long$time <- gsub("분", "", subway_long$time) # "분" 제거

# 박스플롯 그리기
ggplot(subway_long, aes(x = time, y = minutes)) +
  geom_boxplot(fill = "#69b3a2", color = "black") +
  xlab("Time") +
  ylab("Minutes") +
  ggtitle("Subway Line 8 Time Boxplot") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))
```
