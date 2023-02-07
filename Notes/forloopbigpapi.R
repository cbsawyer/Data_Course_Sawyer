library(tidyverse)
library(palmerpenguins)

penguins

mean(penguins[penguins$species == "Adelie",6], na.rm=TRUE)
#gives mean for 1 species "adelie"

df <- penguins[!is.na(penguins$body_mass_g),]

#GROUP BY BAYBEE

adelie <- penguins[penguins$species == "Adelie",]
chinstrap <- penguins[penguins$species == "Chinstrap",]
gentoo <- penguins[penguins$species == "Gentoo",]

adelie$body_mass_g %>% mean(na.rm=TRUE)
chinstrap$body_mass_g %>% mean(na.rm=TRUE)
gentoo$body_mass_g %>% mean(na.rm=TRUE)

#This WORKS, but eh

means <- numeric()
for (i in unique(penguins$species) %>% as.character()) {
  ss <- penguins[penguins$species == i,]
  means[i] <- ss$body_mass_g %>% mean(na.rm=TRUE)
  ss$body_mass_g %>% mean(na.rm=TRUE) %>% print()
}
  
unique(penguins$species) %>% as.character()

means

#dplyr::
#group_by and summarize are ALWAYS together, little buddies
#arrange
#filter (filters rows!)
#filters even T/F questions on column names!


penguins$sex %>% unique()

install.packages("skimr")

skimr::skim(penguins)

test <- 
penguins %>% 
  filter(!is.na(sex)) %>% 
  group_by(species) %>% 
  summarize(mean_body_mass=mean(body_mass_g,na.rm=TRUE),
            fattest_penguin=max(body_mass_g,na.rm=TRUE)) %>% 
  arrange(desc(fattest_penguin)) %>% 
  ggplot(aes(x=species,
             y=fattest_penguin))+
  geom_col(position="dodge")

test %>% 
  ggplot(aes(x=species,
             y=fattest_penguin,
             fill=sex))+
  geom_col(position="dodge")


levels(test$species)

View(test)

levels(test$species) <- c("Gentoo","Chinstrap","Adelie")

test$species %>% unique()

test$species <- test$species
factor(test$species,levels=c("Gentoo","Chinstrap","Adelie"))

#filter penguins where sex is NOT NA & where penguin body mass > 4000

penguins %>% 
  filter(!is.na(sex) & body_mass_g>4000 & year==2007)
