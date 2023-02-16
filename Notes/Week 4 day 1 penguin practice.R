library(tidyverse)




install.packages("palmerpenguins")
library(palmerpenguins)

palmerpenguins::penguins

penguins %>% names()
# 
# Find your outcome variables
#   flipper_length_mm
#   
# What predictor variables?
#     island,species, sex, year

penguins

library()

install.packages("GGally")

library(GGally)

#"::" is from GG ally, use ggpairs


GGally::ggpairs(penguins)

?ggplot

penguins %>% 
  ggplot(aes(y=flipper_length_mm,
             x=island,
             fill=species)) + #set 'global' mapping # which variables to which aspects of the plot
  geom_violin()

penguins$sex %>% unique()

p <- 
penguins[!is.na(penguins$sex),] %>% 
  ggplot(aes(x=flipper_length_mm, 
             fill=species)) +
  geom_density(alpha=0.5)+
  facet_wrap(~sex*island)

class(p)

p

p+
  theme_bw()


#data
#how to map variables (column names) to parts of a plot
#what to draw
#facets
#scales
#customize theme


#make a plot of body_mass_g with some x axis

ggplot

head(penguins)

penguins %>% 
  ggplot(aes(x=bill_depth_mm,
             y=body_mass_g,
             color=species))+
  geom_boxplot() + 
#  facet_wrap(~island)

penguins %>% 
  ggplot(aes(x=bill_length_mm,
             y=body_mass_g,
             size=flipper_length_mm,
             color=species)) +
  geom_point(alpha=.25) +
#  geom_line(size=1,aes(linetype=sex),color="black")
  geom_smooth(method="lm",se=FALSE)
  
p+
  
  
penguins %>% 
  ggplot(aes(x=bill_length_mm,
             y=body_mass_g,
             color=species))+
  geom_point(alpha=.25)+
  geom_smooth(method="lm")+
  theme_minimal()+
  theme(axis.title = element_text(face = "bold")) +
  labs(x="Bill Length (mm)",
       y="Body Mass (g)",
       color="Species",
       title="Penguin Body Mass, duh",
       subtitle = "Booyah",
       caption = "palmerpenguins data set") +
  scale_color_manual(values=c("Pink","Mustard","Red"))

#See uploaded week 4 day 1 thing on teams I think
