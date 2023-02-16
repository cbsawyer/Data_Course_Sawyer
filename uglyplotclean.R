#Ugly plot 

library(tidyverse)
library(plotly)
library(GGally)
library(extrafont)
loadfonts(device = "win", quiet = TRUE) 
library(png)
library(ggimage)
library(ggpubr)
#font_import()

# list.files(pattern = "mushroom",
#            recursive = TRUE,full.names = TRUE,include.dirs = TRUE)

mush <- read.csv("./Data/mushroom_growth.csv")
plaid <- readPNG("./Media/plaidmedia.png")

# media <- system.file(file.path("./Media", "plaid2.png"),
#                         package = "ggpubr")
# ?geom_point
# ?shape
# fonts()

p1 <- 
mush %>% 
  ggplot(aes(x=Nitrogen,
             y=GrowthRate,
             color=as.character(Temperature),
             label="label",
             angle=80))+
  background_image(plaid)+
  geom_point(size=15,shape=9)+
  geom_jitter(width = 10,
              height = 10,
              show.legend = TRUE)+
  geom_smooth(method= "lm")+
  theme(axis.title = element_text(size = 13,
                                  hjust = 0.5,
                                  vjust = 0.4,
                                  color = "DarkBlue",
                                  angle = 5,
                                  family = "Algerian",
                                  face = "bold")) +
  labs(x="this is a serious graphical representation of mushrooms, ",
       y="speed of GROWTH per unit of time",
       color="how hot or cold it is, perhaps",
       title="Fungi and there gorwth speed measurement 
       recordings are listed on this graph below",
       subtitle = "as ive descrIbed above, this graph shows below what the
       growth measurements are for mushrooms in a 100% pure nitrogen 
       neivonrment in the vaccuum of space i think",
       caption = "i dont know what this text box is, please change this to ")+
  scale_color_manual(values=c("Purple","Yellow")) 

p2 <- 
p1 +
  theme(plot.title = element_text(family="Impact",
                             face = "italic", 
                             angle = 177,
                             hjust = 0.7,
                             vjust = 0.4,
                             color = "gold",
                             size = 13),
        # legend.background = element_rect,
        legend.text = element_text(size=25,
                                   family = "Arial",
                                   color="red"),
        legend.title = element_text(size=13,
                                    family = "Kunstler Script",
                                    color="green",
                                    face="bold"),
        plot.subtitle = element_text(family = "Webdings",
                                     color = "black",
                                     face="bold"),
        axis.text = element_text(family = "Comic Sans MS",
                                 size=15,
                                 vjust = 0.9,
                                 color = "tan"))

url <- "https://e0.pxfuel.com/wallpapers/617/898/desktop-wallpaper-rainbow-plaid-bg-background-pattern-colorful.jpg"

p2 %>% 
  ggbackground(url)

