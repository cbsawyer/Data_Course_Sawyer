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
#nope, looks like it should be ok.

df <- 
religions %>% 
  pivot_longer(cols=-c(county,pop_2010,religious),
               values_to = "proportion",
               names_to = "religion")

### Q1: Does the pop of a county correlate with religious proportion:

df %>% 
ggplot(aes(x=pop_2010,
           y=proportion,
       color=religion))+
  geom_point()+
  geom_smooth(method=glm)

#to zoom in
#+
#  coord_cartesian(ylim=c(0,0.3))
  
#?coord_cartesian

#  facet_wrap(~religion)
#removed that because I like the comparison

#There isn't much correlation between population and religion.
# When zooming in, there /could/ be a correlation for non-religious and catholic
# with population having a negative effect on the proportion of non-religious
# and population having a positive effect on catholic proportions,
#but this is based on only 3 data points at the higher populations.
#thus: possible correlation, need more data, even still, very small with huge 
#error

### Q2: Does proportion of any specific religion in a given county correlate with 
#  the proportion of non-religious people
#?pivot_wider

#probably could pivot wider, but eh
# 
# df1 <- 
# df %>% 
# pivot_wider(df)

df$religion

df1 <- 
df %>% 
  mutate(invreligious = 1-religious)

#maybe add a new column for 1-religious to make the non-religious again?
#or maybe just base it off of religious proportion and revert it?

class(df1$invreligious)

plot1 <- 
df1 %>% 
  ggplot(aes(x=reorder(county,invreligious),
             y=proportion,
             color=religion))+
  geom_point()+
  labs(y="Proportion of Religion",
       color="Religion")+
  theme(axis.text.x = element_text(angle = 90))

plot2 <- 
df1 %>% 
  ggplot(aes(x=invreligious,
             y=proportion,
             color=religion))+
  geom_point()+
  geom_smooth()+
  labs(y="Proportion of Religion",
       color="Religion")

#+
  # scale_x_discrete(
  #   breaks=c(dfy$invreligious),
  #   labels=dfy$county)

plot1
plot2
# K, so what I HAVE is pretty okay, counties in order of increasing 
#non-religious value, showing value of individual proportions of religion per
#point.
# What I WANT is more viewable data, showing the counties spaces across the 
#x-axis based on their non-religious value.

df2 <- 
df1 %>% 
  mutate(propvsnon = proportion/invreligious) 

df2$county <-  
  gsub(pattern=" County",replacement="",df1$county,ignore.case=TRUE)

df3 <- df2[!grepl("non_religious", df2$religion),]

plot3 <- 
df3 %>% 
  ggplot(aes(x=reorder(county,invreligious),
             y=propvsnon,
             color=religion))+
  geom_point()+
  geom_smooth()+
  labs(y="Proportion / Non-Religious",
       color="Religion",
       x="County by Increasing Non-religious Proportion")+
  theme(axis.text.x = element_text(angle = 90))

df2$county %>% unique

dfx <- 
  data.frame(df1$county,df1$invreligious) %>% 
  rename("county"=df1.county,"invreligious"=df1.invreligious) %>% 
  group_by(county, invreligious) %>%
  summarise() 

dfx$county <-  
  gsub(pattern=" County",replacement="",dfx$county,ignore.case=TRUE)

dfy <- dfx[order(dfx$invreligious),]

#Yeah nah, I give up: In the end, yeah. It looks like there is correlation, where as non-religious
#value increases, LDS proportions go down. Other religion proportions stay
#pretty out of the way