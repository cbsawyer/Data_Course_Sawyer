#RectaPractice

list.files(pattern = "rectangles",
           recursive=TRUE)

df <- read.csv("Data/rectangles.csv")


dim(df)

#input at end
df[63,2]=as.numeric("231")

df$area <- as.numeric(df$length)*
            as.numeric(df$width)

dim(df)

df

df[63,2]

#Bro
#sneaky bitch

df[63,2]=231

df

class(df[63,2])

df[63,2]=as.numeric("231")

df

#ORRRRR INSTEAD

str(df)

df$width <- as.numeric(df$width)

#NA is msising data. No interpretation of data.
#Ooops... I did a fraud

write.csv(df,"./Data/rectangles_clean.csv")

