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

### Part III ### Plot u5mr over time

df1$continent <- as.factor(df1$continent)

class(df1$continent)

df1$continent %>% unique()

plot1 <- 
df1 %>% 
  ggplot(aes(x=year, y=value,group=country))+
  geom_line()+
  facet_wrap(~continent)
  

# Okay, so sawtooth means I forgot something
# Ah, didn't group by country
# group? Group worked just fine
# Matches the image on the instructions. Solid.

### Part IV ### Save as plot

#ggsave

# ggsave("SAWYER_Plot_1.png",
#        path = "./",
#        width = 3600,
#        height=1800,
#        units = "px")

### Part V ### Create another plot that shows the mean U5MR for all the 
# countries within a given continent at each year (20 pts)

# When the question asks "for all the countries" I got caught up in trying to 
# group by country. After FAR too long, I just sat back and asked, "so what are
# we trying to actually DO?"
# And realized we're just grouping by year.

df2 <- 
  df1 %>% 
  group_by(year,continent) %>% 
  summarize(mean_u5mr=mean(value))


plot2 <- 
df2 %>% 
  ggplot(aes(x=year, y=mean_u5mr,color=continent))+
  geom_line(linewidth=2)

#"Good enough is better than perfect" -Zahn 2023
#And that's good enough.

### Part VI ### save plot

# ggsave("SAWYER_Plot_2.png",
#        path = "./",
#        width = 3600,
#        height=1800,
#        units = "px")

### Part VII ### Create 3 models of u5mr
# - mod1 should account for only Year
# - mod2 should account for Year and Continent
# - mod3 should account for Year, Continent, and their interaction term

mod1 <- glm(data=df1,
            formula=value ~ year)

mod2 <- glm(data=df1,
            formula=value ~ year + continent)

# mod3 <- glm(data=df1,
#             formula=value ~ year * continent * country)
