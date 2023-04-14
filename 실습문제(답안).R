# Question 1
myfunc = function(a,b)
{
  if (a>b) {print(paste(a,">",b))}
  else if (a<b) {print(paste(a,"<",b))}
  else {print(paste(a,"=",b))}
}
















# Question 2
myfunc = function(a)
{
  for (i in 1:a)
  {
    print(paste(a,"x",i,"=",a*i))
  }
}

# Question 3
comp = function(a,b)
{
  if (a>b) {result = ">"}
  else if (a<b) {result = "<"}
  else {result = "="}
}

myfunc = function(d1,d2)
{
  # 두 데이터의 통계량
  stat_d1 = c(mean(d1), sd(d1), sum(d1), length(d1))
  stat_d1 = round(stat_d1, 2) 
  stat_d2 = c(mean(d2), sd(d2), sum(d2), length(d2))
  stat_d2 = round(stat_d2, 2)
  vs = 1:4
  for (i in 1:4)
  {
    vs[i] = comp(stat_d1[i], stat_d2[i])
  }
  summary = data.frame(stat_d1, vs, stat_d2,
                        row.names = c("mean", "sd", "sum", "N"))
  names(summary) = c(substitute(d1), " ", substitute(d2))
  summary
}


# Question 4
sequence = 10
length = 5

for (i in 1:length){
  sequence[i+1] = sequence[i]*2
}


# Question 5
data = 1:100
a = 24.5

order(abs(data-a))[1]
