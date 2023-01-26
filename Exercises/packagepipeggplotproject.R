library(tidyverse)

df <- read_csv("Data/rectangles.csv")

glimpse(df)

#pipe operator
mean(df$length)
#ALSO: ctrl + shft + m
df$length%>%
  mean() %>% 
  length() %>% 
  class()
# %>% nextfunction affects previous function's 
#output
#Output of LHS becomes first argument to RHS
#function

df %>% 
  names() %>% 
  nchar()
#"take our data frame, give me the length
  
df %>% names()

#fix width column
df$width <- df$width %>% 
            as.numeric()

# + means new layer
df %>% 
  ggplot(aes(x=length,y=width)) + 
  geom_point() + 
  geom_smooth()

iris %>% names()

iris$Species %>% 
  unique()

iris %>% 
  ggplot(aes(x=Species,y=Petal.Length,color=Species)) + 
  geom_boxplot() + 
  geom_jitter(width = .1,alpha=0.25)

#Boxplot gives median, 5 number summary, q1 to q3, error bars
#good plot--ish

#takeaways
# %>% pipe in, geometric layers, library tools, etc

iris %>% 
  ggplot(aes(x=Petal.Length,y=Petal.Width,color=Species)) +
  geom_point(color="black") +
  geom_smooth(method="lm") +
  theme_minimal()

# "#fff6f5" hex codeeee colors