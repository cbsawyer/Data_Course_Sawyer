#notes from 2/28/23

 #modeling data

#
#p<0.05 = significant
# 5% of the time, we get the wrong answer

# "fail to reject the null" don't get to say accept the true.

# "type 1 error" failure to detect reality
# "type 2 error" seeing a pattern where there isn't one
# 
#?glm() 
#Generalized linear model

#glm(df,
#    formula=height~sex)

# Variable "x" (predictor) and variable "y" (response) 
#in a tidy data frame
# "~" == "as a function of"

library(tidyverse)
mpg %>% view

names(mpg)
mpg$class %>% unique



#displ == displacement

mpg %>% 
  ggplot(aes(x=displ,
             y=cty,
             color=drv))+
  geom_point()+
  geom_smooth(method = glm)+
  facet_wrap(~cyl)

mod <- 
glm(data=mpg,
    formula = cty ~ displ + cyl + drv)

summary(mod)


formula(mod)


# y=mx+b
# displ being a negative == how much penalty to mpg you get per increase 
#in displacement

df <- data.frame(displ = 1:10,
                 cyl=5,
                 drv="f")

predict(mod,newdata = df)

names(mpg)

?t.test()
# 
# most modeling in here will use glm()
# smaller the deviance residuals, the better they fit to your model line
# "statistical summaries of how far off our model is from the lines"
# coeff: penalties/adjustments and how far off they are

residuals(mod)^2 %>% mean() %>% sqrt()

#"on average, about 2 mpg off of reality"

library(easystats)

# WHILE loop
# while loop!!!!!!!
# while read

# 
# 20 mins late to class
#home price ~ house size + pool
#additive vs interactive models with multiple variables

