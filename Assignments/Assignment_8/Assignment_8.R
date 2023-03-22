### Assignment #8 ###

library(modelr)
library(easystats)
library(broom)
library(tidyverse)
library(fitdistrplus)
library(janitor)

### Part 1 ###

mg <- 
read.csv("./mushroom_growth.csv") %>% 
  clean_names()

glimpse(mg)

### Part 2 ###

ggplot(mg, aes(x=temperature,
               y=growth_rate)) + 
  geom_point() + 
  geom_smooth() +
  theme_minimal()

ggplot(mg, aes(x=nitrogen,
               y=growth_rate)) + 
  geom_point() + 
  geom_smooth() +
  theme_minimal()

ggplot(mg, aes(x=temperature,
               y=growth_rate,
               color=humidity)) + 
  geom_point() + 
  geom_smooth() +
  theme_minimal()

ggplot(mg, aes(x=light,
               y=growth_rate,
               color=temperature)) + 
  geom_point() + 
  geom_smooth() +
  theme_minimal()

ggplot(mg, aes(x=species,
               y=growth_rate,
               color=temperature)) + 
  geom_point() + 
  geom_smooth() +
  theme_minimal()

ggplot(mg, aes(x=nitrogen,
               y=growth_rate,
               color=temperature)) + 
  geom_point() + 
  geom_smooth() +
  theme_minimal()+
  facet_wrap(~species)

ggplot(mg, aes(x=nitrogen,
               y=growth_rate,
               color=light)) + 
  geom_point() + 
  geom_smooth() +
  theme_minimal()+
  facet_wrap(~species)

mg$species %>% unique()
mg$temperature %>% unique()

### Part 3 ###

mod1 = glm(data=mg,
          formula=growth_rate ~ temperature )

mod2 = glm(data=mg,
          formula=growth_rate ~ temperature + humidity)

mod3 = glm(data=mg,
          formula=growth_rate ~ temperature + humidity + light + nitrogen)

mod4 = glm(data=mg,
          formula=growth_rate ~ nitrogen * temperature + humidity +light )

mod5 = glm(data=mg,
           formula=growth_rate ~ nitrogen * light + humidity + light )

mod6 = glm(data=mg,
           formula=growth_rate ~ temperature + humidity + light)

### Part 4 ###

summary(mod1)
summary(mod2)
summary(mod3)
summary(mod4)
summary(mod5)
summary(mod6)

rmse(mod1)
rmse(mod2)
rmse(mod3)
rmse(mod4)
rmse(mod5)
rmse(mod6)

### Part 5 ### 

compare_performance(df,mod1,mod2,mod3,mod4,mod5) %>% plot

step <- 
  MASS::stepAIC(mod4)

step$formula
# I actually like my mod 4 better, cause it has lower rmse and includes N
# which seems to have an effect

check_model(mod4)
check_model(mod6)

#Choosing mod4
mod4

### Part 6 ###
# K so gonna use add_pred even though I've completely forgotten what I'm
# doing here

no1 <- 
add_predictions(mg, mod4) %>% 
  ggplot(aes(x=nitrogen,
             y=growth_rate,
             color=temperature))+
  geom_point()+
  geom_smooth() + 
  facet_wrap(~species)

#nope, just looks normal. Lemme do this other one and compare

no2 <- 
mg %>% 
ggplot(aes(x=nitrogen,
           y=growth_rate,
           color=temperature))+
  geom_point()+
  geom_smooth() + 
  facet_wrap(~species)

no1 + no2

?predict
?add_predictions

#K then nvm, I'm just gonna manually make a new df with some pretend values

mg$hum %>% unique

hum <- 
  as.factor(c("Low","High","Low","High","Low","High","Low",
              "High","Low","High","Low","High","Low","Low","High"))

hypo <- 
data.frame(species=c("P.cornucopiae","P.cornucopiae","P.ostreotus","P.ostreotus",
           "P.cornucopiae","P.cornucopiae","P.ostreotus","P.ostreotus",
           "P.cornucopiae","P.cornucopiae","P.ostreotus","P.ostreotus",
           "P.cornucopiae","P.cornucopiae","P.cornucopiae"),
           light=c(0,0,0,0,0,10,10,10,10,10,20,20,20,20,20),
           nitrogen=c(0,0,5,10,20,35,40,45,30,20,10,20,25,15,10),
           temperature=c(20,20,20,25,25,25,20,20,20,25,25,25,20,20,25),
           humidity=hum,
           type="hypothetical")

hypo1 <- 
add_predictions(hypo, mod4, var="growth_rate")

mg$type="actual"

?full_join

joint <- 
  full_join(mg,hypo1,keep=FALSE)

joint$species %>% unique

head(joint)

# Solid, guess I'm set. Looks good, let's plot

### Part 7 ###

joint %>% 
  ggplot(aes(x=nitrogen,
             y=growth_rate))+
  geom_point(aes(color=type))+
  geom_smooth() + 
  theme_minimal()+
  scale_colour_manual(values = c("red", "green","blue"))+
  facet_wrap(~species)

#Nice, shows the predicted points, the normal points, colors them, diff sets by
#species, off of the *most* continuous variable, nitrogen, I like it.

#convert to plain text:
# Upload responses to the following as a numbered plaintext document to Canvas:
#  1.  Are any of your predicted response values from your best model 
#scientifically meaningless? Explain.
# all of them are technically scientifically meaningless given that a 
# model only helps represents a data set, any predictions there after are
# by definition "a guess made upon an estimate" and aren't useful.


#  2. In your plots, did you find any non-linear relationships? Do a bit of 
#research online and give a link to at least one resource explaining how to 
#deal with modeling non-linear relationships in R.
#Yes indeed, I was looking at nitrogen amounts as an independent variable
# https://data-flair.training/blogs/r-nonlinear-regression/


#  3. Write the code you would use to model the data found in 
#“/Data/non_linear_relationship.csv” with a linear model (there are a few ways 
#of doing this)

# Just... just a normal linear model? For non-linear data?
# I think I just misunderstand what you mean by model the data with a linear
# model, unless you just mean like we've always been doing?
# Are we just like... covering non-linear models later?
# Anyway, here's wonderwall:

nlr <- 
read.csv("./non_linear_relationship.csv") %>% 
  clean_names()

ggplot(nlr, aes(x= predictor ,
               y=response)) + 
  geom_point() + 
  geom_smooth() +
  theme_minimal()

modx = glm(data=nlr,
           formula=response ~ predictor)

summary(modx)
