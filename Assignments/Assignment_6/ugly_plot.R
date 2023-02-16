### UGLY plot contest submission ###

library(tidyverse)
library(plotly)
library(GGally)
library(deldir)
library(voronoiTreemap)


#df2 <- (ExampleGDP)
# gdpex <- read.csv("./gdpex.csv")
# df3 <- gdpex[,2:7]

gdpexnew <- read.csv("./gdpexnew.csv")
df <- gdpexnew[,2:7]

#knitr::kable(head(ExampleGDP,3))


# vt_input_from_df(df2,scaleToPerc=FALSE)
# gdp_json <- vt_export_json(vt_input_from_df(ExampleGDP))

vt_input_from_df(df,scaleToPerc=FALSE)
gdp_json <- vt_export_json(vt_input_from_df(df))

vt_d3(gdp_json, legend = TRUE, footer = "State/Province", title = "noooo")+
  labs(title = "Bub")

?vt_export_json

?vt_d3()

#write.csv(ExampleGDP,file="gdpex.csv")

getw


list.files(pattern = "gdpex",
           recursive = TRUE,full.names = TRUE,include.dirs = TRUE)
getwd("./gdpex.csv",)
"./gdpex.csv"


ggplot(aes())+
  geom_