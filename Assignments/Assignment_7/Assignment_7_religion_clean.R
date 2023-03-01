# Import the Assignment_7/Utah_Religions_by_County.csv data set
# 
# Clean it up into “tidy” shape
# 
# Explore the cleaned data set with a series of figures 
#  (I want to see you exploring the data set)
# 
# Address the questions:
#   
# 1.“Does population of a county correlate with the proportion of any specific 
#  religious group in that county?”
# 2.“Does proportion of any specific religion in a given county correlate with 
#  the proportion of non-religious people?”
# 3.Just stick to figures and maybe correlation indices…no need for statistical 
#  tests yet
# 
# Add comment lines that show your thought processes _____________

library(tidyverse)
library(janitor)

religions <- 
  read.csv("./Utah_Religions_by_County.csv") %>% 
  clean_names()

religions %>% view

# Step 1: Tidy
names(religions)
# after visualizing, wondering if it would be useful to convert the proportion
# values to number values fromt he population.
# Guessing the episcopal church values with e-00 values are characters
class(religions$episcopal_church)
#nope, looks like its ok.

df <- 
religions %>% 
  pivot_longer(cols=-c(county,pop_2010,religious),
               values_to = "proportion",
               names_to = "religion")


#Q1: Does the pop of a county correlate with religious proportion:

df %>% 
ggplot(aes(x=pop_2010,
           y=proportion,
       color=religion))+
  geom_point()+
  geom_smooth(method=glm)+
  coord_cartesian(ylim=c(0,0.3))
  
?coord_cartesian

#  facet_wrap(~religion)
#removed that because I like the comparison

#There isn't much correlation between population and religion.
#When zooming in, there /could/ be a correlation for non-religious and catholic
# with population having a negative effect on the proportion of non-religious
# and population having a positive effect on catholic proportions,
#but this is based on only 3 data points at the higher populations.
#thus: possible correlation, need more data.

#Q2: Does proportion of any specific religion in a given county correlate with 
#  the proportion of non-religious people

df$religion
df %>% 
  
?mutate()
#maybe add a new column for 1-religious to make the non-religious again?
#or maybe just base it off of religious proportion and revert it?

df %>% 
  ggplot(aes(x=reorder(county,religious),
             y=proportion,
             color=religion))+
  geom_point()+
  geom_smooth()


mod <- 
  glm(data=df,
      formula = proportion ~ pop_2010)

summary(mod)


