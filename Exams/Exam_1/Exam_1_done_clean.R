### EXAM 1 JUST CODE ###
# No context included here. ONLY the code needed for each exam part.
#See "./Exam_1_done_workshop.R" for context-included code.
library(tidyverse)

# Part 1
df <- read.csv("./cleaned_covid_data.csv")

#Part 2
a <- grepl(df$Province_State,pattern='^A')
s <- split(df, a)
A_states <- s$`TRUE`

#Part 3
A_states %>% 
  ggplot(aes(x=as.Date(Last_Update),
             y=Deaths))+
  geom_point(size=0.6)+
  facet_wrap(~Province_State,
             scales="free")+
  geom_smooth(se=FALSE)

#Part 4
state_max_fatality_rate <- 
  df %>% 
  group_by(Province_State) %>% 
  summarize(Maximum_Fatality_Ratio=max(Case_Fatality_Ratio,na.rm=TRUE)) %>% 
  arrange(desc(Maximum_Fatality_Ratio)) 

#Part 5
state_max_fatality_rate %>% 
  ggplot(aes(x=reorder(Province_State,-Maximum_Fatality_Ratio),
             y=Maximum_Fatality_Ratio))+
  geom_col()+
  theme(axis.text.x=element_text(angle=90))

#Part 6
df %>% 
  group_by(Last_Update) %>% 
  summarize(csd=cumsum(Deaths)) %>% 
  ggplot(aes(x=as.Date(Last_Update),
             y=csd))+
  geom_col()

