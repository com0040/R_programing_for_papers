# 데이터 불러오기
DATA = read.csv("상대 경로 설정/HR_comma_sep.csv")

# 연습문제 1
# time_spend_company 6보다 크다면 'Expert', 3~5이면 'Middle', 나머지는 'New'
DATA$Work_period = ifelse(DATA$time_spend_company >= 6, 'Expert', ifelse(DATA$time_spend_company >=3, 'Middle', 'New'))

# 연습문제 2
# average_montly_hours
summary(DATA$average_montly_hours)
DATA$Working_Time = ifelse(DATA$average_montly_hours > 245.0, 'Very Busy',
                           ifelse(DATA$average_montly_hours > 200.0, 'Busy',
                                  ifelse(DATA$average_montly_hours > 156.0, 'Free', 'Very Free')))

# 연습문제 3
example3 = subset(DATA, (Work_period == 'Middle') & (Working_Time == 'Busy') | (Working_Time == 'Very Busy'))
head(example3)

# 연습문제 4
example4 = ddply(DATA, # example4라는 새로운 데이터셋을 생성
                 c('Work_period','Working_Time'), summarise, # Work_period, Working_Time 별로 요약값들을 계산
                 M_projects = mean(number_project),
                 M_satisfaction_Level = mean(satisfaction_level),
                 M_last_evaluation = mean(last_evaluation))

example4

head(DATA)

# 연습문제 5
DATA$time_spend_company = as.factor(DATA$time_spend_company)
ggplot(DATA, aes(x = left)) + geom_bar(aes(fill = time_spend_company)) + labs(fill = "근속년수") + xlab("이직 여부") + ylab("")


ggplot(DATA, aes(x = satisfaction_level)) + geom_density(aes(fill = left), alpha = I(0.4)) + labs(fill = "이직여부") + xlab("근무 만족도") + ylab("")