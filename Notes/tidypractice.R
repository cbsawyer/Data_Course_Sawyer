library(tidyverse)




# table2
# table3
# table4a
# table4b
# table 5
# 
# #rule 1: every variable a single column
# #rule 2: every observation gets its own row
# 
# pivot_wider(df, 
#             names_from = column to split names from, 
#             values_from = column to split values from)
# 
# table4a %>% 
#   pivot_longer(cols = - insert columns you dont want
#                names_to = column name (new) to combine columns into (names),
#                values_to = column name to combine columns into (values))
# 
# 
# full_join
#   
# table3
# df %>% 
# separate(col = rate (to be sepd),
#          into = c("new column 1", "new column 2"),
#          sep = "separator",
#          convert = TRUE, when converting into number/integer)
# 
# mutate:create new columns based on other columns
# paste0: paste values of 2 columns together
# 
# table5
# df%>% 
#   mutate(newcolumn = paste0(firstcolumn,secondcolumn) %>% 
#            as.numeric()) %>% 
#   select(-c:keepeverythingexcept:(column1, column2)) %>% 
#   separate(columntosplit,
#            into = c("newcol1","newcol2"),
#            convert = TRUE) %>% 
#   select:reorderingcol:(country,newyear,cases,population)
# 
# pivvotlonger
# pivot_wider()
# separate()
# mutate()

df <- read.csv("./Data/wide_income_rent.csv")%>% 
  pivot_longer(cols = -variable,
               names_to = "state",
               values_to = "ir") %>% 
  pivot_wider(names_from = variable,
              values_from = "ir")

df %>% 
  pivot_longer(cols = -variable,
               names_to = "state",
               values_to = "ir") %>% 
  pivot_wider(names_from = variable,
              values_from = "ir")






  


