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

#Interaction = "*"

mod3 <- glm(data=df1,
            formula=value ~ year * continent)

### Part VIII ### Compare model performance

pred <- 
  gather_predictions(df1,mod1,mod2,mod3)

pred %>% 
  ggplot(aes(x=year, y=pred, color = continent)) +
  geom_smooth(method=glm) +
  facet_wrap(~model)

compare_performance(mod1,mod2,mod3) %>% plot

# check_model(mod1)
# check_model(mod2)
# check_model(mod3)

summary(mod1)
summary(mod2)
summary(mod3)

# Compare performance shows mod 3 as a pretty clear winner among all 
# categories, and it also shows the most predictive structure when
# plotting its predictions.

### Bonus ###
#Well, based off of mod3:

df2 <- data.frame(country ="Ecuador",year=2020,continent="Americas")

predict(mod3,df2)

# so -10.58018 as opposed to the reality: 13 
# Off by 23 isn't like... AWFUL.... right.......?

mod4 <- glm(data=df1,
            formula=value ~ year + (country * continent))

predict(mod4,df2)

#K well that is actually a little closer than -10, so I'm gonna call that a win.
# After all, "Good enough is better than perfect" -Zahn




