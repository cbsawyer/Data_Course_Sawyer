#I. 

list.files(pattern = "bird_data",
           full.names = TRUE,
           ignore.case = TRUE,
           recursive = TRUE)

df <- read.csv("./Data/cleaned_bird_data.csv")
df
