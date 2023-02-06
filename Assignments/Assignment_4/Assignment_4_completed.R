### Assignment 4###
library(tidyverse)
library(GGally)
library(ggplot2)
library(ggmsa)
library(BiocManager)

# install.packages(ggmsa)
# install.packages("BiocManager")
# BiocManager::install("ggmsa")

list.files(pattern = "big_cat",
           recursive=TRUE)

df <- read.csv("Assignments/Assignment_4/big_cat_data_example.csv")

# df %>% 
#   ggplot(aes(x=Sequence,
#              y=Species
#                ))
#   ggmsa(df)


?ggplot2

?ggmsa

# ggmsa(df)
# ?ggmsa
# 
# ggmsa(df, start=1, end = )

#Yo I'm just gonna be honest, pretty sure this isn't
#Gonna work. I don't know if these results can be
#plotted. Gonna try adding a running sum for number of mutations
#instead.

df$cumsum <- cumsum(df$mutations.from.original.sequence)

df$cumsum

df$species

explot <- df %>% 
  ggplot(aes(y=as.numeric(cumsum),
             x=as.character(species)
             ))+
  geom_point()

class(df$mutations.from.original.sequence)  

#OKAY SO ANYWAY, my final project results are gonnna be more like a phylogeny,
#but I don't really know how to set that up starting with the alignment. 
#I created a cumsum column to make a basic plot from, but my results are gonna
#be more complicated than that, I think. The "expected result" here is that as
#evolutionary species descend, more mutations are made over time, deviating from 
#the oldest common ancestor.
explot

#ggsave(explot,
       # filename="Assignment_4_plot.png",
       # path="./Assignments/Assignment_4",
       # height=6,
       # width=6)




