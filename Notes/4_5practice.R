# Project questions
# "Lists" in R

library(tidyverse)
library(easystats)
library(roxygen2) #Package for making packages

source("./my_functions.R")

mod1 <- mpg %>%
  glm(data=.,
      formula = cty ~ displ)
mod2 <- mpg %>%
  glm(data=.,
      formula = cty ~ displ + drv)
mod3 <- mpg %>%
  glm(data=.,
      formula = cty ~ displ * drv)
mod4 <- mpg %>%
  glm(data=.,
      formula = cty ~ displ + drv + trans)

mod1$effects

#reports family of function:
mod1$family$family

#List is kinda like vector, but types don't have to be the same

list(item1=c("a","b","c"),
     item2=1:3,
     item3=mpg)

#data frame is a list where every element is named and the same length
mod_list <-
  list(mod1=mod1,
       mod2=mod2,
       mod3=mod3,
       mod4=mod4)

rm(mod1,mod2,mod3,mod4)

for (i in mod_list){
  print(rmse(i))
}
# purrr package (for working with lists....functional programming)

#It will do rmse function on all elements of the list

map(mod_list,rmse)

#output is a list

map(mod_list,rmse) %>% 
  map_chr(rmse)

mod_list %>% 
  map_dbl(rmse)

plot_list <- 
  list(
  p1=ggplot(mpg,aes(x=displ,y=cty))+geom_point(),
  p2=ggplot(mpg,aes(x=displ,y=cty,color=drv))+geom_point()
)

plot_list$p1

mylist

mylist2 <- 
  list(mpg,
       c("a","b","c"))

names(mylist2)

mylist2

#tibble is just a fancy kind of data frame

#get just "year" as a vector from element 1 of my list 2

mylist2[[1]][[4]][81]


words <- "the quick brown fox jumped over the lazy dog"

str_split(words," ")

#working with chr strings, type 
str_

sentences
#convert to lowercase
#get every word by itself as its own element
# remove periods and commas

str_split(words," ")
str_remove("\\.")
str_to_lower())

words <- 
sentences %>% 
  str_remove("\\.") %>% 
  str_remove("\\,") %>% 
  str_remove("\\'") %>% 
  str_to_lower() %>% 
  str_split(" ") %>% 
  unlist()

word_freq <- 
table(words) %>% 
  as.data.frame() %>% 
  arrange(desc(Freq))


#Zahn:

 
#reduce, opposite of map
#if you go back into exam 1, its 800 csv, read in as an ele
#ment of a list and then full joined


c(ty[1:720])


r_med_sq_err <- function(model){
  sqrt(median(residuals(model)^2))
}

class(mod1)=="glm"


r_med_sq_err <- function(model, absolute=FALSE){
  if(sum(class(model)%in%c("glm",'lm'))>0){
    if(absolute==TRUE){
      median(abs(residuals(model)^2))
    }
    sqrt(median(residuals(model)^2))
  } else {
    stop("'model' must be either a glm or lm object.")
  }
}

r_med_sq_err(mod1,absolute=TRUE)

list(mod1,mod2,mod3,mod4) %>% 
  map(r_med_sq_err)

rmse(mod1)

r_med_sq_err(mod1)

?map
?map_dbl
#works for a list
?reduce
#compresses item into 1 thing, starting with the first 2 things
#and pres that product into the next one, and so on
read_csv_ugly <- function(x){read_csv(col_names = FALSE)}


#4/11/2023

day <- 
as.Date("02/11/2021")

day %>% 
  as.POSIXct(format="%m/%d%Y")

#lubridate to help with making date work "smooooth"

