### 
#3/16/23

library(tidyverse)
library(janitor)
library(modelr)
library(easystats)
library(palmerpenguins)

names(penguins)

#linear reg for body mass in penguins
mod <- glm(data = penguins,
            formula = body_mass_g ~ 
             sex* species * island +
             flipper_length_mm+
             bill_depth_mm+
             bill_length_mm)

df <- 
add_predictions(penguins,mod)

#How far off from reality? residuals? need easystats -- PERFORMANCE 

df <- 
add_residuals(df,mod)

performance(mod)
#view the RMSE, shows how far off we are. 

names(penguins)

new_penguin <- data.frame(sex="male",
           species="Gentoo",
           island="Biscoe",
           bill_length_mm=1000,
           bill_depth_mm=1000,
           flipper_length_mm=1)

add_predictions(new_penguin,model=mod)

df$body_mass_g %>% max(na.rm=TRUE)
df$bill_length_mm %>% max(na.rm=TRUE)
# 
# This is way far outside the data set. If you ahve a model, it's only good within
# its scope'

# CROSS-VAILADTION! - set aside some data, and use it to cross check, and test 
# the model later once its created, and trained on the rest of the data
# testing data set gets set aside (~20%) till the end

set.seed(68)

rsq_mod2 <- c()
for (i in 1:1000) {
testing <- sample(1:nrow(penguins),size = round(nrow(penguins)*0.2))
test <- 
penguins[testing,]
train <- 
  penguins[-testing,]
mod2 <- glm(data = train,
            formula=mod$formula)
rsq_mod2[i] <- rsquare(mod2,test)
}

mean(rsq_mod2)

data.frame(value=rsq_mod2) %>% 
  ggplot(aes(x=value))+
  geom_density()+
  geom_vline(xintercept = mean(rsq_mod2), linetype=2, color="red")


performance(mod)
performance(mod2)

add_residuals(test,mod2) %>% 
  pluck("resid") %>%
  .^2 %>% 
  mean(na.rm=TRUE) %>% 
  sqrt()

#LOADING PACKAGES MATTERS
#rmse(mod)
performance::rmse(mod)
#usually rmse is larger

#?rmse()
#add_predictions()

rsquare(mod2,test)
rsquare(mod,penguins)

add_residuals(test,mod2) %>% 
  pluck("resid") %>%
  .^2 %>% 
  mean(na.rm=TRUE) %>% 
  sqrt()

performance(mod2)
performance(mod)

# im so confused
# R2 value SHOULD go down
# the closer the R2 values are to eachother, the better the fit is without
# being overfit
#RMSE is higher than the training means BAD
# 
#rmse is used for a model about what it's seen'
#the long list of code(above) is used for new data

#"trained  ageneralized linear model, cross trained it, etc.
#check model also helps...

# superforloops for this stuff: tidymodels
# pretty weird, built for python lovers
# good for split level cross validation

#split testing set into 2

#soon rmarkdown, which is automated reporting

#x_validation
# 

# 







