# HR(인사관리) 데이터를 통한 R 연습
getwd() # 작업 경로 확인

# 데이터 불러오기
DATA = read.csv('C:/Users/NDL/Desktop/수업자료/HR_comma_sep.csv')

head(DATA) # 데이터의 상단 부분을 간략히 볼 때 사용

str(DATA) # str 함수를 통해 데이터 타입을 확인

summary(DATA) # 데이터 요약하기 (기초 통계량 확인)

# as 함수를 통해 테이터의 타입 변경
DATA$Work_accident = as.factor(DATA$Work_accident) #
DATA$left = as.factor(DATA$left) #
DATA$promotion_last_5years = as.factor(DATA$promotion_last_5years) #

summary(DATA)

# 패키지 설치하기
install.packages("ggplot2")

# 패키지 불러오기
library(ggplot2)

# Barplot 그려보기
ggplot(DATA, aes(x = salary)) + geom_bar() # x축 : salary, y축 : 집계된 값


