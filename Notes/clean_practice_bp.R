library(tidyverse)
library(janitor)
library(readxl)


join?
  
df <-   
read_excel("./messy_bp.xlsx", skip = 2) %>% 
  clean_names() 

df[1,8] <- "bp1"
df[1,9] <- "hr1"
df[1,10] <- "bp2"
df[1,11] <- "hr2"
df[1,12] <- "bp3"
df[1,13] <- "hr3"

  
colnames(df) <- df[1,]
df <- df[-1, ] 

df1 <- 
df %>% 
  separate(col = bp1,into = c("systolic1","diastolic1"), convert = TRUE) %>% 
  separate(col = bp2,into = c("systolic2","diastolic2"), convert = TRUE) %>% 
  separate(col = bp3,into = c("systolic3","diastolic3"), convert = TRUE) %>% 
  clean_names() 

mutate(date)
  as.Date(with(df1,paste(year_birth,month_of_birth,day_birth),paste(,sep="-")),
          "%Y/%m/%d")

?as.Date

?paste


  unite(df = "date",sep = "/")


?unite


  full_join(c(df$month_of_birth,df$day_birth,year_birth)
?full_join()


colnames(df)

separate(columntosplit,
         #            into = c("newcol1","newcol2"),
         #            convert = TRUE)
?select

?skip


mutate()

library(tidyverse)
library(janitor)
library(readxl)

df <-   
  read_excel("./messy_bp.xlsx", skip = 3) %>% 
  clean_names() 

names(df)

df$pat_id <- seq_along(df$pat_id)

See how zahn did it

Made new data frames for blood pressure to pivot longer


PATID IS THE COMMON COLUMN names

so you can join the new DF

