### Assignment_6 ###
#dat <- read_csv("../../Data/BioLog_Plate_Data.csv")
#Tidy data:
# 1. Each VARIABLE forms a COLUMN
# 2. Each OBSERVATION forms a ROW
# 3. Each type of observational data forms a TABLE
# 4. Every cell is a single value

### PART 1 ###

#Note, I did this assignment before we talked in class about cleaning. 
#So some things might be diff. 
#If this is opened via the "Assignment_6" r project itself, some file paths may
#differ from this version, including 
#"./Assignments/Assignment_6/BioLog_Plate_Data_dirty.csv", having added "dirty"
#to the new location's file name.

library(tidyverse)
library(gganimate)
library(gifski)
library(janitor)

df <- 
read.csv("./Data/BioLog_Plate_Data.csv") %>% 
  clean_names()

names(df)

#Variables: 
# Sample, 
# Rep(?),
# Dilution, 
# Substrate ,
#Time(hours)
# (Adding sample type: water/soil)

#observations: abs. That's it.

#so, for clean, here's the setup: Columns, 
# Sample Type (After), 
# Sample ID,
# Repetition,
# Dilution,
#Time elapsed(hours)
# Substrate

# #For rows,
#1 abs value per row

#So for 24 hr, 48 hr, and 144 hr, it should be a TIME column, with 
#24 hr
#48hr
#144hr as separate rows within that column, SO
#see pivot

dfp <- 
df %>% 
pivot_longer(cols = c(hr_24,hr_48,hr_144), 
             names_to = "time_elapsed_hrs", 
             values_to = "abs")

dfp$time_elapsed_hrs <- 
  gsub("hr_","",dfp$time_elapsed_hrs) %>% 
  as.numeric(dfp$time_elapsed_hrs)

dfp

#So: Check:
# 1. Each VARIABLE forms a COLUMN: TRUE
# 2. Each OBSERVATION forms a ROW: TRUE
# 3. Each type of observational data forms a TABLE: TRUE
# 4. Every cell is a single value: TRUE
#therefore: #Tidy data: TRUE NICE

### PART 2 ####
#Creates a new column specifying whether a sample is from soil or water

#samp <- c("Clear_Creek","Waste_Water","Soil_1","Soil_2")
# ?call
# ?rbind
# ?grepl
# ?mutate
# dfp %>% 
#   mutate("sample.type", 
#          ifelse("Clear_Creek"|"Waste_Water",'soil','water'))

wtr <- grepl(pattern='Clear_Creek|Waste_Water',
             dfp$sample_id)

dfp <- 
dfp %>% 
  mutate(sample_type = ifelse(wtr,"water","soil"))

dfp

### Part 3 ###
#Generates a plot that matches this one (note just plotting dilution == 0.1)

dfp0.1 <- dfp[dfp$dilution==0.1,]

plot0.1 <- 
dfp0.1 %>% 
  ggplot(aes(x=time_elapsed_hrs,
         y=abs,
         color=as.factor(dfp0.1$sample_type)))+
  geom_smooth(se=FALSE)+
  facet_wrap(~dfp0.1$substrate)+
  theme_minimal()+
  scale_color_manual(values=c("#f7766e","#00bfc4"))+
  theme(text = element_text(size=10), 
        legend.title = element_text(size=10),
        axis.title = element_text(size=10),
        title = element_text(size=10))+
  labs(x="Time",
       y="Absorbance",
       color="Type",
       title = "Just dilution 0.1")

plot0.1

# ggsave("plot0_1.png",
#        plot=last_plot(),
#        path = "./",
#        width = 3600,
#        height=1800,
#        units = "px")

#Now THAT is almost if not an EXACT match~

### PART 4 ###
dfpia <- filter(dfp,dfp$substrate=="Itaconic Acid")

dff <- 
dfpia %>% 
  group_by(sample_id,
           dilution,
           substrate,
           time_elapsed_hrs) %>% 
  summarize(Mean_absorbance=mean(abs))


dffplot <- 
dff %>% 
ggplot(aes(x=time_elapsed_hrs,
           y=Mean_absorbance,
           color=sample_id))+
  geom_line()+
  facet_wrap(~dilution)+
  theme_minimal()+
  labs(x="Time",
       color="Sample ID")+
  transition_reveal(time_elapsed_hrs)
  
animate(dffplot,
        fps=5,
        duration=10,
        rewind=FALSE)
# 
# anim_save("mean_abs_anim_plot_dcs.gif",
#           animation = last_animation(),
#           path = "./")
#  

## GRAVEYARD ##
#   transition_states(time_elapsed_hrs,
#                   transition_length = 10,
#                   state_length = 0.2,
#                   wrap = TRUE)
# animate(dff %>% 
#           ggplot(aes(x=time_elapsed_hrs,
#                      y=Mean_absorbance,
#                      color=Sample.ID))+
#           geom_line()+
#           facet_wrap(~Dilution)+
#           theme_minimal()+
#           labs(x="Time",
#                color="Sample ID"),
#         fps=5,duration=10)
# dffplot+
#   transition_states(Sample.ID,
#                     transition_length = 10,
#                     state_length = 0.2,
#                     wrap = TRUE)