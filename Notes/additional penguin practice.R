library(tidyverse)

library(palmerpenguins)

p <- penguins %>% 
  ggplot(aes(y=flipper_length_mm,
             x=island,
             fill=species)) +
  geom_boxplot()


#ggsave("./my_penguin_plot.png",width=12,height = 2, dpi=150)

p2 <- p +
  labs(x="Island",
       y="Flipper Length (mm)",
       )+
  theme(axis.text.x = element_text(angle = 90,
                                   hjust = 1,
                                   vjust = 0.3, face = "italic"),
        axis.text.y = element_text(size=20,
                                   angle=180,
                                   face="bold",
                                   color="Pink"),
        plot.background = element_rect(color = "orange",
                                       fill = "blue",
                                       linewidth = 15),
        panel.grid.major.x = element_line(color="orange",
                                          linetype = 4,
                                          lineend = 'round',
                                          linewidth = 6,
                                          ))

#facets are strip.background = element_rect(fill='pink',color='white')

ggsave(p2,filename="./uglyplot.png",height=6,width=6)

p2

p2 + 
  scale_fill_manual(values = c("black","white","purple"))+
  #scale_y_reverse()+
  #scale_y_log10() +
  #coord_polar()+
  coord_polar()+
  #coord_flip()
  #coord_cartesian(ylim = c(1000,3000))+
  theme(strip.text = element_text(face = "bold",
                                  size=12),
        legend.text = element_text(face = 'italic',
                                   color='darkred',
                                   ),
        legend.background = element_rect(fill="pink"),
        legend.position = 'bottom',
        legend.title = element_text("Species"),
        axis.title = element_text(angle=60)
        )

library(ggimage)

install.packages("ggimage")

penguins %>% 
  ggplot(aes(x=body_mass_g,
             y=flipper_length_mm,
             fill=species))+
             image
###### GOT CONFUSSSSSED HERE ###                    
               "./Media/carrot.png")+
  #geom_boxplot()
           geom_image()
  
  geom_pokemon()

?geom_pokemon
  
  

