# YOUR REMAINING HOMEWORK ASSIGNMENT (Fill in with code) ####
library(tidyverse)

# 1.  Get a subset of the "iris" data frame where it's just even-numbered rows

seq(2,150,2) # here's the code to get a list of the even numbers between 2 and 150

iris[seq(2,150,2),]
iris_even <- iris[seq(2,150,2),]
iris_even

# 2.  Create a new object called iris_chr which is a copy of iris, except where every column is a character class
#EVERY column? ok

iris_chr <- as.character(iris)

iris_chr 

dfiris <- as.data.frame(as.character(iris))

dfiris

head(iris)

# ignore plz :
c(as.character(iris$Sepal.Length),
  as.character(iris$Sepal.Width),
  as.character(iris$Petal.Length),
  as.character(iris$Petal.Width),
  as.character(iris$Species)) %>% 
  as.data.frame()

iris_chr

class(iris_chr)


# 3.  Create a new numeric vector object named "Sepal.Area" which is the product of Sepal.Length and Sepal.Width

Sepal.Area <- iris$Sepal.Length*iris$Sepal.Width
Sepal.Area

# 4.  Add Sepal.Area to the iris data frame as a new column

iris$Sepal.Area <- iris$Sepal.Length*iris$Sepal.Width

iris

# 5.  Create a new dataframe that is a subset of iris using only rows where Sepal.Area is greater than 20 
# (name it big_area_iris)

iris$Sepal.Area>=20
iris[iris$Sepal.Area>=20,]
big_area_iris <- iris[iris$Sepal.Area>=20,]

#For me: This means, assign name: "big_area_iris" to where in the file "iris":
#show the rows, whose VALUE in the column, "Sepal.Area" is MORE than 20, for all columns.

# 6.  Upload the last numbered section of this R script (with all answers filled in and tasks completed) 
# to canvas
# I should be able to run your R script and get all the right objects generated
#donezo