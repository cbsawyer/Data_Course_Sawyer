#Dr. Zahn's Week 4 day 1 R processes
# playing with ggplot ####
library(tidyverse)
# install.packages("palmerpenguins") # get a new data set
library(palmerpenguins)
# install.packages("GGally")
library(GGally)

penguins %>% names()

# find your outcome variables
#           flipper_length_mm

# what predictor variables?
#           island, species, sex, year

penguins$year %>% unique()

ggpairs(penguins)

?ggplot

penguins %>% # data to use
  ggplot(aes(y=flipper_length_mm,
             x=island,
             fill=species)) + # set 'global' mapping # which variables to which aspects of the plot
  geom_violin()

penguins$sex %>% unique()

 
p <- 
penguins[!is.na(penguins$sex),] %>% 
  ggplot(aes(x=flipper_length_mm,fill=species)) +
  geom_density(alpha=.5) +
  facet_wrap(~sex*island)
class(p)
# data
# how to map variables (column names) to parts of a plot
# what to draw?
# facets?
# scales?
# customize theme


p +
  theme_bw()



# make a plot of body_mass_g with some x axis
names(penguins)
penguins[!is.na(penguins$sex),] %>% 
  ggplot(aes(x=flipper_length_mm,y=body_mass_g,color=sex)) +
  geom_point(size=3,alpha=.1) +
  geom_smooth(method="lm",se=FALSE) +
  facet_wrap(~species) +
  theme_void()
?geom_point


p <- 
penguins %>% 
  ggplot(aes(x=bill_length_mm,
             y=body_mass_g,
             alpha=species,
             color=species)) +
  geom_point(alpha=.25) +
  # geom_line(size=1,aes(linetype=sex),color="black")
  geom_smooth(method="lm",se=FALSE) +
  theme_minimal() +
  theme(axis.title = element_text(face = "bold")) +
  labs(x="Bill Length (mm)",
       y="Body Mass (g)",
       color="Species",
       title="Penguin body mass, obviously...",
       subtitle = "whatever. just stop now",
       caption = "Data from palmerpenguins R package") +
  scale_color_manual(values=c("#fc0dbc","#ba9120","Red"))


