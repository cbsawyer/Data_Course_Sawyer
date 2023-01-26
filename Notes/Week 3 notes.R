#Week 3 notes
class(p)

#x=1
#vs
#x <- 1

as.numeric(x)+1

as.character(123)+1

y <- c(1:10, "One")

#NA = not applicable, missing data

class(10)
length(10)
rep(10:15,30)
rep(10:15,each=30)
seq(0,10,length.out=30)

levels(b)
?levels

x <- factor(letters)
z <- rep(x,each=50)
length(z)


class(x)
length(x)
levels(x)
levels(z)
z[1300]

#if you perform levels on a vector, and you see
#levels of letters, you're dealing with a letter
#VECTOR

z[1300]
c(z[1300],"A")
z
#z is stored as the 26th level
as.character(z)
as.numeric(z)

#! means not
1==5

mtcars
mtcars$mpg
length(
  mtcars$mpg)
#dim=number of rows, and number of columns
dim(mtcars)
mtcars[1,] 
mtcars[1:3,]
mtcars[,1:3]
mtcars[1:3,1:3]

mtcars[1|3,1|3]
rc135c <- c(1,3)
mtcars[c(1,3),c(1,3,5)]
mtcars[rc135c,rc135c]

head(mtcars)
mtcars$mpg>21
class(mtcars$mpg>21)
mtcars[mtcars$mpg>21,]

mtcars$name <- row.names(mtcars)
mtcars$name
mtcars$newcolumn <- 1:32
mtcars$newcolumn
dim(mtcars)

mtcars[33,] <- as.character(1:13)
#reload data:
data("mtcars")
mtcars

1:10

#for WHATEVER inwhatever range of values
#first time, yourmom will equal the FIRST value in range of values (1:10)
for (yourmom in 1:10) {
  print(yourmom+5)
}

fordad <- for (yourdad in letters) {
  print(paste("your dad = ",yourdad))
}

myfiles <- list.files("Data",
           pattern=".csv",
           full.names=TRUE)


for(i in myfiles) {
  print(readLines(i,n=3))
  
  
  
}



for(i in myfiles) {
  print(read.csv(i))
}

for (i in myfiles) {print(readLines(i)[3])
}

mtcars

#See Data/RectaPractice.R for:
  #Write.csv , df$newcolumn , str(df) structure of , as.numeric , 

#to load a package if its installed:
library(tidyverse)

#now at the top of every doc, library(tidyverse)