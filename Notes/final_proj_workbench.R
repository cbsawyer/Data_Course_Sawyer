# Final project organization
#
#

library(tidyverse)
library(janitor)
library(bio3d)
# ape 
# DECIPHER
# fangorn
# ggtree

# phytools
# biostrings
# msa
# geiger
# viral datasets command line tool from ncbi

#command line
#seqtk good for counting sequences
#"http://r-eco-evo.blogspot.com.es/2007/09/neighbor-joining-tree-with-ape.html"

#Genes selected
#16
#Cox1 (Cytochrome C Oxidase Subunit 1)

#Given the use of 20 significant taxa provided, an additional 10 samples will
# be randomly selected from the total set of 254 to achieve a total sample 
#number of 30.
# Here are the taxa that exhibited statistically significant differential 
# abundance by E/W of WL:



# sigtaxa <- as.vector(c(
# "Mucilaginibacter","Rhizobium","Sphingomonas","Acinetobacter","Elizabethkingia",
# "Bradyrhizobium","Aureitalea","Rhodospirillum","Arcobacter","Marixanthomonas",
# "Pelagicoccus","Azonexus","Thiogranum", "Bizionia","Paracoccus",
# "Vibrionimonas","Wandonia","Bauldia","Litorimonas","Anderseniella"))

#Random seed selector, to be used for consistency in re-running code:
#seed <- round(runif(1, 1, 2147483647))
set.seed(141372682)


#random selection of other 10 taxa
newtaxa <- round(runif(10, 1, 254))

newtaxa

#alignseqs = alignment
#Phangorn = Tree MAKING
#Viewing tree: ggtree and APE

#DNAStringSet instead of "character" class, diff special things
#shortread: readFasta

#download genome based on genome id in r

# just find nucleotide sequences and then leave it out if not available online

#class(df$taxa_messy)

#new csv file with genbank numbers and such, cleaning up
library(tidyverse)
library(janitor)
library(bio3d)
library(BiocManager)
library(phangorn)

#BiocManager::install("msa")

df <- 
read_csv("./taxa_list_new_csv.csv") %>% 
  clean_names()

df$taxa <- 
  gsub("> ",">",df$taxa)

df$taxa_name_fasta=df$taxa

df$full_name <- 
  gsub("\xa0"," ",df$full_name)

df$gene <- 
  gsub("\xa0"," ",df$gene)

df$full_name[7]

df$taxa <- 
  gsub("[()]","",df$taxa)

df$taxa <- 
  df$taxa %>%
  str_remove(">") 

df <- 
  separate(df,col=taxa,into = c("taxa_genus","sig_type"),sep=' ',convert=FALSE)

df$sig_type <- as.factor(df$sig_type)


#FASTA importing?
#sequinr
#Get the compiled AA fasta file
#get.seq(df$cox1_genbank,"cox1_all.fasta")

#align with msa
?seqaln

fst <- 
read.fasta("./cox1_all.fasta")

class(fst)

seqaln(fst, id=df$taxa_genus, exefile="msa", 
       outfile="align1.fasta", protein=TRUE, seqgroup=FALSE, 
       refine=FALSE, verbose=FALSE)  

#file made: "align1.fasta"

#file path to muscle alignment= "./muscle5.1.win64.exe"

#phangorn::

?read.phyDat

cox1 <- read.phyDat("./align1.fasta",
                    format = "fasta",
                    type = "AA")

#mt <- modelTest(cox1)

?write.csv

class(mt)

#write.csv(mt,file="model_test_cox1.csv",quote=FALSE,col.names=TRUE)

min(mt$BIC)

#First, that mt took ages to generate

mt2 <- 
  read_csv("./model_test_cox1.csv")

# I want the model that has the best value for both BIC and AIC overall. 
#so I'm going to sum them, divide by 2, and choose the lowest value

mt2$fit <- ((mt$BIC+mt$AIC)/2)

#Long run time, but best calculated model to use is:

#with a BIC of and an AICc of 

#Generate new column with half the sum of the BIC and AICc values
for (i in 1:nrow(mt2)) {
  mt2$fit[i] <- (mt2$BIC[i] + mt2$AICc[i])/2
}

#OR

# iris %>% 
#   mutate(newcolumn=())
# 
# iris$newcolumn <- 
# (iris$Petal.Length+iris$Petal.Width)/2

#Show best model based on min value of that new column
mt2[mt2$fit == min(mt2$fit),2]

# for (i in 1:nrow(mt2)) {
#   mt2$fit[i] <- (mt2$BIC[i] + mt2$AICc[i])/2
# }

?pml_bb
?bootstrap.pml
#######
#fitLG <- pml_bb(cox1, model="LG+G(4)")

# saveRDS(fitLG, file="fitlg.rds")
#######

fitLG <- 
  read_rds("fitlg.rds")

#looking into the pml stuff, and it looks like they default to "ultrafast
#bootstrapping", which is pretty complicated. so I thought I'd compare
#the bs values from a standard 100bs value to the ultrafast bootstrap values.
#Ultrafast bootstrapping: "https://academic.oup.com/mbe/article/30/5/1188/997508"

#######
# bs <- bootstrap.pml(fitLG, bs=100, optNni=TRUE,
#                     control = pml.control(trace = 0))
# 
# saveRDS(bs, file="bs.rds")
#######

bs <- 
  read_rds("bs.rds")

#plotting ultrafast BS vs standard BS to compare:

#First step is ALWAYS: "Root your tree"
#In this case: Archaea
#Root
root <- 
  root(fitLG$tree,outgroup="Archaea",resolve.root=TRUE)

ufbsplot<- 
  plotBS(root, p = .5, type="p", digits=2, main="Ultrafast BS")

#Assign standard bs values 
stdbs_tree <- plotBS(fitLG$tree, bs, type = "n")

stdbsplot <- 
  plotBS(root, bs, p = 50, type="p", main="Standard BS")

#Some of the nodes don't have bootstrap values, but apparently they will
#be saved in the newick file

######
#Now from phy to tree: (newick format)
# write.tree(fitLG$tree, "cox1_ufsb_nwk.tree")
# 
# write.tree(stdbs_tree, "cox1_stdbs_nwk.tree")
######


#tree <- pml_bb(primates, model="LG_G(4)",rearrangement="stochastic",)

ufbs_tree <-   
  read.tree("cox1_ufsb_nwk.tree")

stdbs_tree <- 
  read.tree("cox1_stdbs_nwk.tree")

?read.tree
is.rooted(fitLG$tree)
getRoot(fitLG$tree)
?root
class(fitLG$tree)
