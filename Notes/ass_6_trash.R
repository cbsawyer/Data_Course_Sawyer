library(tidyverse)
library(gganimate)
library(gifski)
library(janitor)

dfx <- 
read_csv("./Data/BioLog_Plate_Data.csv") %>% 
  clean_names()


dfx1 <- 
dfx %>% 
  pivot_longer(cols = c(hr_24,hr_48,hr_144), 
               names_to = "time_elapsed_hrs", 
               values_to = "abs") #%>% 

dfx1$time_elapsed_hrs <- 
  gsub("hr_","",dfx1$time_elapsed_hrs) %>% 
  as.numeric(dfx1$time_elapsed_hrs)

wtr <- grepl(pattern='Clear_Creek|Waste_Water',
             dfx1$sample_id)

dfx2 <- 
dfx1 %>% 
  mutate(sample_type = ifelse(wtr,"water","soil"))




