### STATS III ###
# random_forest.R

library(tidyverse)
library(easystats)
library(modelr)
library(janitor)
library(curl)
library(palmerpenguins)

read.csv()

#R is not good through the CRAN repository?
# Bioconductor
#How to install the right packages:
BiocManager::install("")

names(penguins)

#Always start with:
mod1 <- glm(data = penguins,
    formula = body_mass_g~sex+species+flipper_length_mm)

summary(mod1)

check_model(mod1)

#classification modeling -- logical? e.g. predict sex from a set of variables
#"logistic regression"
# logical T/F
#MAKE binary variables out of current variables. Like using mutate to make
#a new column with the data

penguins <- 
penguins %>% 
  mutate(male = case_when(sex=="male" ~ TRUE,
                          sex=="female" ~ FALSE))

mod2 <- glm(data=penguins,
            formula = male ~ 
              (body_mass_g + 
              flipper_length_mm + 
              bill_length_mm) * 
              species,
            family = "binomial")

#family = binomial INSTEAD OF GAUSIAN!!! makes it logistic regression!
summary(mod2)
#instead of this variable adds this, it's LOG ODDS changes

add_predictions(penguins, mod2, type = "response") %>% 
  ggplot(aes(x=body_mass_g,
             y=pred,
             color=species))+
  geom_smooth()

#just a ***logistic*** curve. Hence, logistic regression. The "S-Curve".
#NOTES:
#The THREE tricks for logistic regression::::
#Resposne variable MUST be TRUE false
#Family="binomial"
#type MUST equal "response"

check_model()

# LMER package, mixed something testing

pred <- predict(ranger_model,titanic_imputed[68,]) # look at passsenger 68,
#young first class
pred$predictions


