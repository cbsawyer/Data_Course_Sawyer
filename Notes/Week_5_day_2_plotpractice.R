### Week 5 day 2 2/9 ###
Plotting help

#geom_image() ONLY WORKS FOR GEOM POINT

Add picture to gg plot

library(tidyverse)
library(ggimage)
library(palmerpenguins)
library(ggpubr)
library(png)
library(gganimate)
library(plotly)
#others, try ggmap, rgdal, 


# can pin url like
# url <- "BANOTBUNOAETBVABEBALOEANTBAET.URLHERE"

png <- png::readPNG("./Media/carrot.png")


penguins %>% 
  ggplot(aes(x=flipper_length_mm,
             y=body_mass_g))+
  geom_point()+
  #geom_image(aes(image="./Media/carrot.png"))
  background_image(png)

df2 <- 
data.frame(species=c("Adelie","Chinstrap","Gentoo"),
           body_mass_g=rep(2e05,3))



penguins %>% 
  ggplot(aes(x=species,
             y=body_mass_g))+
  geom_col(color="Red")+
  geom_image(data=df2,aes(image="./Media/carrot.png",size=.15))
#SHOULD work??? doesn't?

p <-  penguins %>% 
  ggplot(aes(x=species,y=body_mass_g))+
  geom_col()


p+
  transition_time(year)+
  labs(title= "Year: {frame_time}")

ggplotly(p)

#word line?
penguins %>% 
  ggplot()+
  aes(
    x=flipper_length_mm,
    y=body_mass_g,
    label="which lineis this going to be",
    angle=60,
    color="Red",
  )
#something else here


penguins$chunky <- penguins$body_mass_g>5000 

penguins %>% 
  ggplot()+
  aes(
    x=flipper_length_mm,
    y=body_mass_g,
    label="which lineis this going to be",
    angle=60,
    color=chunky)+
  geom_point() +
  geom_hline(yintercept=5000,color="Red",linetype=2)+
  annotate("text",x=150,y=5100,label="Chunky",color="Red")+
  labs(color="CHUNKY")+
  scale_color_manual(values=c("Black","Red"))+
  theme(legend.title = element_text(angle=180,size=14,face="bold"),
        legend.text = element_text(angle=20))

list.files(pattern="Biolog",
           ignore.case = TRUE,
           recursive = TRUE)
  

#Also: 

 


