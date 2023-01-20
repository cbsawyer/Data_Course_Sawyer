#Assignment 2

#Skip to #4 for assignment answers

#Finding files
list.files()

# recursively (within all sub-directories)
list.files(recursive = TRUE)

#"with a searth pattern
#find all .csv files, recursively in your Data_Course_Sawyer/
csvs <- list.files(pattern = ".csv",
                   recursive = TRUE)

#first value of of the list of csv files
airlines <- csvs[1]
?readLines()

#values in the nth line of the csv file
readLines(airlines, n=3)
airlines <- read.csv(airlines)

#numeric vectors
x <- 1:10
length(x) * 2
#length counts the number of elements in a vector, spits out an integer, that is
#ALSO a vector of length 1
length(5)
#Everything in R is vectorized
# all of its methematical behaviours is vectorized
y <- 2:11
 x + y
 x * y
 x / y
 x^y
 (x^y)^x

#expressions (logical)
class(x > 3)
sum(x > 3)

x >= 3 #Greater than or equal to
x <= 5 #less than or equal to

list.files(pattern="wingspan",
           ignore.case = TRUE,
           recursive = TRUE)

#data frame is just a list where each element is an entire vector
x=1:10
wingspan <- "Data/wingspan_vs_mass.csv" 

wingspan <- read.csv("./Data/wingspan_vs_mass.csv")

wingspan

names(wingspan)

sum(wingspan$mass >= 70)

wingspan$giant <- wingspan$mass >= 70

plot(x=wingspan$wingspan,y=wingspan$mass)

#library(tidyverse) didn't work

#Answers
# 4. 
csv_files <- list.files(path = "Data",
            pattern = ".csv",
            full.names = TRUE)
csv_files

# 5.
length(csv_files)

# 6.
read.csv("Data/wingspan_vs_mass.csv")

df <- read.csv("Data/wingspan_vs_mass.csv")

# 7.
head(df,n=5)

# 8. 
# ^ up carrot means beginning, $ means ending.
# example for ends with .csv = ".csv$"
# example for ends in lowercase t = "t$"
list.files(recursive = TRUE,
           path = "Data",
           pattern = "^b")

# 9. 
b <- list.files(recursive = TRUE,
           path = "Data",
           pattern = "^b",full.names = TRUE)

#just to test comparison, not my answer:
readLines(b[1],n=1)
readLines(b[2],n=1)  
readLines(b[3],n=1)  

#For-loops:
# for (val in sequence)
# {# statement}
# "sequence"=vector,or in our case, object b 
# val=each of its values during the loop
# then, "statement" is evaluated
#         v-->(following functions)
#SO, 
#for (i in b), 
#[functions] (readLines? head? print?)
#for = in the case of, i=value 
# b = the object "b" (a list of files)
#therefore...: what?
#lets figure it out

?readLines
?print
?head
?letters

#FINALLY!!!
#So for value in something...
#           e.g. for *file* in list of files
# print (show me text) of 
#Readlines in that *file*, where n=1 (on the first line)
#Then, once it's done with the first file,
# It circulates back to the top to go to the next file 
# to perform those functions

for(i in b) {print(readLines(i,n=1))}

# 10.
# If by "all csv files" you mean all those in the Data dir (like b), then:

csv_files #(had to edit list.files function to include full.names=TRUE)

for (i in csv_files) {print(readLines(i,n=1))}

#If by "all csv files" you mean all those recursively in Data_Course_Sawyer:

csvs

for (i in csvs) {print(readLines(i,n=1))}