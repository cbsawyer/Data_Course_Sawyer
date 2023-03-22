library(modelr)
library(easystats)
library(broom)
library(tidyverse)
library(fitdistrplus)
library(janitor)

df <- read_csv("./Data/GradSchool_Admissions.csv") %>% 
  clean_names()


df <- 
  df %>% 
  mutate(admitted = case_when(admit=="1" ~ TRUE,
                          admit=="0" ~ FALSE))

df$rank=as.factor(df$rank)

glimpse(df)

mod1 = glm(data=df,
           formula=admit~gre)

mod2 = glm(data=df,
           formula=admit~gre + gpa )

mod3 = glm(data=df,
           formula=admit~(gre + gpa) * rank)

mod4 = glm(data=df,
           formula=admit~(gre*gpa) + rank)

mod4 = glm(data=df,
           formula=admit~(gre*gpa) + rank)

#zahn mod  = + + +


summary(mod1)
summary(mod2)
summary(mod3)
summary(mod4)

ggplot(df, aes(x=gre,y=admit)) + 
  geom_point() + 
  geom_smooth(method = "glm") +
  theme_minimal()

rmse(mod1)
rmse(mod2)
rmse(mod3)
rmse(mod4)

compare_performance(mod1,mod2,mod3,mod4) %>% 
  plot

check_model(mod4)

?gather_predictions
gather_predictions(df,mod1,mod2,mod3,mod4)

mod4 <- glm(data=df,
            formula = admitted ~ 
              (gre*gpa + 
                 rank),
            family = "binomial")

add_predictions(df, mod4, type = "response") %>% 
  ggplot(aes(x=gre,
             y=admit,
             color=rank))+
  geom_smooth()

add_predictions(df, mod4, type = "response") %>% 
  ggplot(aes(x=gpa,
             y=admit,
             color=rank))+
  geom_smooth()

ggplot(aes(x=gpa,y=pred,color=rank,group=rank))+
  geom_smooth() +
  labs(title = "GPA Score Predictions",
       caption=paste0("GPA coefficient = ",round(coef(mod)["gpa"],4)))

gpa_plot + gre_plot

#both plots




