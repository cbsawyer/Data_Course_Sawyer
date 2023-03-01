### Assignment 7 ###
# + Import the 4 related datasets 
# + Combine the data sets appropriately to investigate whether departure delay 
# was correlated with snowfall amount
# +   You will need to think carefully about column names
# + Plot average departure delays by state over time
# + Plot average departure delays by airline over time
# + Plot effect of snowfall on departure *and* arrival delays

library(tidyverse)
library(janitor)

airlines <- 
read.csv("./airlines.csv") %>% 
  clean_names()

airports <- 
  read.csv("./airports.csv") %>% 
  clean_names()

janflights <- 
  read.csv("./jan_flights.csv") %>% 
  clean_names()

jansnowfall <- 
  read.csv("./Jan_snowfall.csv") %>% 
  clean_names()

#Part 1: departure delay and snowfall

airlines
names(janflights)

#useful columns:
jf <- 
janflights %>% 
select(cols=year,
              month,
              day,
              airline,
              departure_delay,
              origin_airport,
              destination_airport)

