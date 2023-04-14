# 실습문제 1
myfunc1 = function(a, b) {
  if (a > b) {print(paste(a,'>',b))}
  else if (a < b) {print(paste(a,'<',b))}
  else {print(paste(a,'=',b))}
}
myfunc1(1,3)
myfunc1(112,47)

# 실습문제 2
myfunc2 = function(a) 
  {
  for (i in 1:a){
    print(paste(a, "x",i,"=",a*i))
  }
}

myfunc2(5)

rm(myfunc3) #오류 발생시

# 실습문제 3
data1 <- c(10,23,15,24,15,26)
data2 <- c(15,25,16,17,28,34,15,23,74)

myfunc3 = function(data1,data2) 
{
  M_data = c(round(mean(data1),2),round(mean(data2),2))
  SD_data = c(round(sd(data1),2),round(sd(data2),2))
  SUM_data = c(round(sum(data1),2),round(sum(data2),2))
  N_data = c(length(data1),length(data2))
  
  print(paste('     data1','data2'))
  print(paste('mean', M_data[1], M_data[2]))
  print(paste('sd  ', SD_data[1],  SD_data[2]))
  print(paste('sum ', SUM_data[1], SUM_data[2]))
  print(paste('N   ', N_data[1], N_data[2]))
}

myfunc3(data1,data2)
sd(data1)
