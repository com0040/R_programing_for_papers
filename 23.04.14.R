# HR(인사관리) 데이터를 통한 R 연습
getwd() # 작업 경로 확인

# 데이터 불러오기
DATA = read.csv('C:/Users/NDL/Desktop/수업자료/HR_comma_sep.csv')

# salary mid 그리고 부서가 sales 
# 조건에 맞는 다음의 직원들을 sales_man 이라는 변수에 넣어주세요
sales_man = subset(DATA, salary == 'medium'& sales =='sales')

# 집계된 데이터를 생성
install.packages('plyr')
library('plyr')

ss = ddply(DATA,
           c('sales','salary'), summarise, # sales와 salary별로 요약값 계산
           M_SF = round(mean(satisfaction_level),2),
           COUNT = length(sales),
           M_WH = round(mean(average_montly_hours),2)
           )

# 히트맵 그리기
ggplot(ss) + geom_tile(aes(x = sales, y = salary, fill = M_WH)) +
  scale_fill_gradientn(colours = c('white','red'), values = c(0,0.8,1))

# 데이터 요약해보기
summary(DATA$salary)
DATA$salary = as.factor(DATA$salary)
summary(DATA$salary)
summary(DATA$satisfaction_level)

DATA2 = read.csv('C:/Users/NDL/Desktop/수업자료/HR_comma_sep.csv')
summary(DATA2$salary)








# 연습문제 1
DATA$Work_period = ifelse(DATA$time_spend_company > 6,'Expert', ifelse(DATA$time_spend_company > 3, 'Middle', 'New'))


# 연습문제 2
summary(DATA$average_montly_hours)# 백분위 확인용

DATA$Working_time = ifelse(DATA$average_montly_hours < 156,'Very Free', 
   ifelse(DATA$average_montly_hours < 200, 'Middle',
   ifelse(DATA$average_montly_hours < 201,'Busy', 'Very Busy')))

# 연습문제 3
Working_hard = subset(DATA, (Work_period == 'Middle') & 
                        (Working_time == 'Busy')|
                        (Working_time == 'Very Busy')
                        )
# 연습문제 4
NEW = ddply(DATA, 
            c('Work_period','Working_time'), summarise,
            M_projects = mean(number_project),
            M_satisfaction_level = mean(satisfaction_level),
            M_last_evaluation = mean(last_evaluation)
            )


# 연습문제 5
DATA2$Work_period2 = ifelse(DATA2$time_spend_company == 2,'2', 
    ifelse(DATA$time_spend_company == 3, '3',
    ifelse(DATA$time_spend_company == 4, '4',
    ifelse(DATA$time_spend_company == 5, '5',
    ifelse(DATA$time_spend_company == 6, '6',
    ifelse(DATA$time_spend_company == 7, '7',
    ifelse(DATA$time_spend_company == 8, '8',
    ifelse(DATA$time_spend_company == 10, '10','10'
    ))))))))
ggplot(DATA2, aes(x = left))  +geom_bar(aes(fill = Work_period2)) +
  labs(fill = '근속년수') + xlab('이직 여부') + ylab('') 

DATA$time_spend_company = as.factor(DATA$time_spend_company)
DATA$left = as.factor(DATA$left)
ggplot(DATA, aes(x = left))  +geom_bar(aes(fill = time_spend_company)) 
+ labs(fill = '근속년수') + xlab('이직 여부') + ylab('') 

ggplot(DATA, aes(x = satisfaction_level))  +geom_density(aes(fill = left),
  alpha = I(0.4)) + labs(fill = '이직 여부') + xlab('근속년수') + ylab('')


