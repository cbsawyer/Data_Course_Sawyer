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

for (i in b) {
print(colMeans(b[i, c(2)])) 
}

i2 <- []

readLines(b, 
          n=-1
          )

list.files(wd)

getwd()

colMeans(b)

bas <- list.files(pattern="basil",
           recursive = TRUE,
           full.names=TRUE,
           ignore.case = TRUE)

bas

basl <- readLines(bas)

grep(bas, pattern="A")

ttt <- grep(pattern="ttt", basl,
      ignore.case = TRUE)

ttt

readLines(bas)

readLines(bas,
          n=-1,
          skip=1,
          )

readLines(bas,
          n=-1)[testnum]

baschr <- (readLines(bas,
          n=-1)[4:(length(basl))])

combn(baschr,
      4L)

## NICE!!!! ##

baslen <- length(basl)

length(basl)

testnum=4:163

infnum=9999999

length(bas)


?readLines

length(grep(pattern='^C|^G',
     basl))

length(grep(pattern='^C',
     basl))


length(grep(pattern='^C|^G|^A',
            basl))


length(grep(pattern = '^C|^G|^A|^T',
            basl))

length(basl)

length(ttt)

oppttt <- (length(basl)-length(ttt))

baschr

csvs

pf <- "Data/practice_data_1.csv"

p <- read.csv(pf)

p

pf

for (k in p$k) {print(mean(p$k))

}

mean(p$x)

mean(p$y)

mean(p$z)

colMeans(p$x|p$y|p$z)

colMeans(as.numeric(p))
         
colMeans(p,
    na.rm = FALSE,
    dims = 1)

