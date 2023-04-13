final_abandoned_roads

df <- read_csv("./taxa_list.csv")

df$taxa_messy <- 
  gsub("[()]","",df$taxa_messy)

df$taxa_messy <- 
  df$taxa_messy %>%
  str_remove("> ") 

df <- 
  separate(df,col=taxa_messy,into = c("taxa_fasta","type"),sep=' ',convert=FALSE)

df$type <- as.factor(df$type)
class(df$type)

#need to conserve the fasta format for analysis


str_replace("(","")


gsub("[()]","",df$taxa_messy)

df$taxa_messy <- gsub("[()]","",df$taxa_messy)

df <- 
  separate(df,col=taxa_messy,into = c("taxa_fasta","type"),sep=' ',convert=FALSE)



?str_remove

#project idea, factor in the champion as factors?


#didn't end up doing manual bootstraps
bs <- bootstrap.pml(cox1, bs=100, optNni=TRUE,
                    control = pml.control(trace = 0))

#Breaks bootstraps:
  stbs <- bootstrap.pml(fit_mt, bs=500, optNni=TRUE,
                        control = pml.control(trace = 0))
