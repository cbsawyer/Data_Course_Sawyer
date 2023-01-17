# Week 2 File paths etc
getwd()
list.files(recursive = TRUE)
list.files(path = "Data/",
           pattern = ".csv",
           full.names = TRUE)
list.files(path = "Data",
  pattern = "wingspan",
           full.names = TRUE)
list.files(pattern = "wingspan")
path <- list.files(recursive = TRUE, pattern = "Wingspan_vs",ignore.case = TRUE,full.names = TRUE)
path
wingspan <- read.csv(path)
wingspan
m <- wingspan$mass
v <- wingspan$velocity
s <- wingspan$variety
max(m)
min(m)
mean(m)
summary(m)
cumsum(m)
plot(cumsum(m))
plot(m)
sort(m)
plot(sort(m))

plot(w,m)
plot(x=wingspan$wingspan,
     y=wingspan$mass)
cor(x=wingspan$wingspan,
    y=wingspan$mass)

