#####final_working

### Prep Step ###
library(tidyverse)
library(janitor)
library(bio3d)
library(BiocManager)
library(phangorn)

##BiocManager::install("msa")

### Step 1. ###
##Read in the data 

df <- 
  read_csv("./taxa_list_new_csv.csv") %>% 
  clean_names()

View(df)

### Step 2. ###
##Clean Up the data

#duplicate fasta format name column and manipulate one
df$taxa <- 
  gsub("> ",">",df$taxa)

df$taxa_name_fasta=df$taxa

#The "\xa0" is a stand in for the ? square box "replacement" character
df$full_name <- 
  gsub("\xa0"," ",df$full_name)

df$gene <- 
  gsub("\xa0"," ",df$gene)

df$taxa <- 
  gsub("[()]","",df$taxa)

df$taxa <- 
  df$taxa %>%
  str_remove(">") 

df <- 
  separate(df,col=taxa,into = c("taxa_genus","sig_type"),sep=' ',convert=FALSE)

df$sig_type <- as.factor(df$sig_type)

view(df)

### Step 3. ###
##FASTA importing from list of GenBank numbers
#Get the compiled AA fasta file

###### - file manipulation
#get.seq(df$cox1_genbank,"cox1_all.fasta")
###### 

fst <- 
  read.fasta("./cox1_all.fasta")

### Step 4. ###
##align with msa

###### - file manipulation
# seqaln(fst, id=df$taxa_genus, exefile="msa", 
#        outfile="align1.fasta", protein=TRUE, seqgroup=FALSE, 
#        refine=FALSE, verbose=FALSE)  
######

#file made: "align1.fasta"
#Now it's aligned in that fasta
#Now I need to get it into Phydat format for analysis

cox1 <- read.phyDat("./align1.fasta",
                    format = "fasta",
                    type = "AA")
class(cox1)

### Step 5. ###
## model test for best fit
#model test to see which model best fits the data to use for phylogeny

###### runtime ~ 2 hr
#mod <- modelTest(cox1)
#
#write.csv(mod,file="model_test_cox1.csv",quote=FALSE,col.names=TRUE)
###### - file manipulation

mod <- 
  read_csv("./model_test_cox1.csv")

# I want the model that has the best value for both BIC and AIC overall. 
#so I'm going to sum them, divide by 2, and choose the lowest value
# ^ What this dumbass means to say is the minimum average. 

mod$fit <- ((mod$BIC+mod$AIC)/2)

#Show best model based on min value of that new column
c(as.character(mod[mod$fit == min(mod$fit),2]),as.character(min(mod$fit)))

#maybe thinking about making that a cute function
# Best model: LG+G(4)

### Step 7. ###
##Make the ML tree(s)
#I've got the model to calculate the ML, I've got the algined fasta
#so its time to grow a tree

####### - Runtime ~ 1 hr 15min
# fitLG <- pml_bb(cox1, model="LG+G(4)")
#
# saveRDS(fitLG, file="fitlg.rds")
####### - file manipulation

fitLG <- 
  read_rds("fitlg.rds")

#looking into the pml generation, and it looks like they default to "ultrafast
#bootstrapping", which is pretty complicated. so I thought I'd compare
#the bs values from a standard 100bs valueI know to the UF bootstrap values.
#Ultrafast bootstrapping:"https://academic.oup.com/mbe/article/30/5/1188/997508"

####### runtime ~ 1 hr
## Setting up standard bootstrapping
# bs <- bootstrap.pml(fitLG, bs=100, optNni=TRUE,
#                     control = pml.control(trace = 0))
# 
# saveRDS(bs, file="bs.rds")
####### - file manipulation

bs <- 
  read_rds("bs.rds")

### Step 8. ###
#plotting ultrafast BS vs standard BS to compare:
#First step is ALWAYS: "Root your tree"
#In this case: Archaea
#Root
root <- 
  root(fitLG$tree,outgroup="Archaea",resolve.root=TRUE)

###Troubles rooting

#plot the UF
ufbsplot<- 
  plotBS(root, p = .5, type="p", digits=2, main="Ultrafast BS")

#Assign standard bs values 
stdbs_tree <- plotBS(fitLG$tree, bs, type = "n")

#plot the STD
stdbsplot <- 
  plotBS(root, bs, p = 50, type="p", main="Standard BS")

###### - file manipulation
# Now from phy to tree: (newick format)
# write.tree(fitLG$tree, "cox1_ufsb_nwk.tree")
# 
# write.tree(stdbs_tree, "cox1_stdbs_nwk.tree")
######

uf <-   
  read.tree("cox1_ufsb_nwk.tree")

std <- 
  read.tree("cox1_stdbs_nwk.tree")

### Step 9. ###
## Convert data into R Markdown!

