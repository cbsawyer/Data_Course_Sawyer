#stats 2
library(tidyverse)
library(easystats)
library(MASS)

mpg %>% names

mod1 <- glm(data=mpg,
            formula=cty~class)

#additive -- all have same slope
mod2 <- glm(data=mpg,
            formula=cty~class+displ)

#interactive -- each creates an individual slope
mod3 <- glm(data=mpg,
            formula=cty~class*displ)

mod4 <- glm(data=mpg,
            formula=cty~class*displ*cyl)

mod5 <- glm(data=mpg,
            formula=cty~class*displ*cyl*drv)

summary(mod1)
summary(mod2)
summary(mod3)
summary(mod4)
summary(mod5)

mpg$class %>% unique

mpg %>% 
  filter(class=="compact") %>% 
  pluck("cty") %>% 
  mean()

# mean residual squa
# root mean square error

#lower mse value is "better"
rmse(mod1)
rmse(mod2)
rmse(mod3)
rmse(mod4)
rmse(mod5)

#feed a bunch of models
compare_performance(mod1,mod2,mod3,mod4,mod5) %>% 
  plot

step <- 
MASS::stepAIC(mod5)
#magic bullet

step$formula

mod6 <- glm(data=mpg,
            formula=step$formula)

summary(mod6) 

compare_performance(mod1,mod2,mod3,mod4,mod5,mod6) %>% plot


#GREAT WAY OF VISUALIZING!!!!!
check_model(mod6)

#By here, understand additive and multiplicative
#multiplicative ALLOWS dependence between variables

mpg %>% 
  ggplot(aes(x=displ,
             y=cty,
             color=factor(cyl)))+
  geom_smooth(method="glm")

# allows dependence on cyl, i guess


#syringonium_bacteria




