### EXAM 2 ###

library(tidyverse)
library(easystats)
library(modelr)
library(janitor)
library(curl)

## Part 1 ##  Read it in

df <- 
read.csv("./unicef-u5mr.csv") %>% 
  clean_names()

## Part 2 ##  Tidy it up

glimpse(df)
#ohhhhhhhhh my lord what a shit mess
names(df)

?select

df <- 
select(df,!region)

df1 <- 
df %>%
  pivot_longer(cols = -c(country_name,continent), 
               names_to = "year", 
               values_to = "value")

colnames(df1)[1] <- "country"

df1$year <- 
  gsub("u5mr_","",df1$year) %>% 
  as.numeric(df1$year)

names(df1)
df1$country_name %>% unique


df1 <- 
select(df1,year, continent, country, value) %>% 
  na.omit()


