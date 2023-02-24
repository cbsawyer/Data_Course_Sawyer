library(tidyverse)
library(janitor)

#janitor::clean_names()

df <- read.csv("./Data/Bird_Measurements.csv") %>% 
  clean_names() %>%  #from janitor package %>% 
  select(-ends_with("_n")) 


df %>% 
  select(-ends_with("_n")) %>% 
  names


male <- 
df %>% 
  select(starts_with("m_"),
         species_number,
         species_name,
         english_name,
         clutch_size,
         egg_mass,
         mating_system,
         family) %>% 
  mutate(sex="male")

unsexed <- 
  df %>% 
  select(starts_with("unsexed_"),
         species_number,
         species_name,
         english_name,
         clutch_size,
         egg_mass,
         mating_system,
         family) %>% 
  mutate(sex="unsexed")

female <- 
  df %>% 
  select(starts_with("f_"),
         species_number,
         species_name,
         english_name,
         clutch_size,
         egg_mass,
         mating_system,
         family) %>% 
  mutate(sex="female")


names(female) <- 
names(female) %>% 
  str_remove("^f_")

names(unsexed) <- 
  names(unsexed) %>% 
  str_remove("^unsexed_")

names(male) <- 
  names(male) %>% 
  str_remove("^m_")

#pivot_longer()

clean <- 
male %>% 
full_join(female) %>% 
  full_join(unsexed) %>% 
  mutate(family=as.factor(family),
         mating_system=as.factor(mating_system),
         species_number=as.factor(species_number))

clean %>% 
  filter(!is.na(mating_system)) %>% 
  ggplot(aes(x=mating_system,y=bill))+
  geom_boxplot()

clean %>% 
  filter(english_name=="Ostrich")

clean

library(skimr)

df <- skim(clean) %>% 
  as.data.frame()

complete_enough <- 
  df %>% 
  filter(complete_rate>0.25)





#filter, select, pivot wider, pivot longer, T/F statements.




#SnakeCase vs camel_case
