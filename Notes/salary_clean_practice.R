library(tidyverse)
library(janitor)
library(skimr)


df <- 
read_csv("./Data/FacultySalaries_1995.csv") %>% 
  clean_names() %>%
  select(-ends_with("all",ignore.case=TRUE),
         -ends_with("comp",ignore.case=TRUE),
         -ends_with("profs",ignore.case=TRUE),
         -ends_with("instructors",ignore.case=TRUE))

x <- 
df %>% 
  pivot_longer(cols=c(avg_full_prof_salary,
               avg_assoc_prof_salary,
               avg_assist_prof_salary),
               names_to = "rank",
               values_to = "salary")



## How sahn does it

the same!

df <- 
  read_csv("./Data/FacultySalaries_1995.csv") %>% 
  clean_names() %>%
  
df %>% select
  mutate(rank=)
  

x %>% 
  ggplot(aes(x=rank,y=salary,fill=tier))+
  geom_boxplot()
#plot salary (not compensation) by rank (assoc, assist, prof) and tier (univ)
#1 is highest

df %>% 
  select()


#Try ./Data/thatch_ant.csv
