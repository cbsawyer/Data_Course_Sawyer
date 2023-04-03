# Final project organization
#
#
#
#project idea, factor in the champion as factors?
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



sigtaxa <- as.vector(c(
"Mucilaginibacter","Rhizobium","Sphingomonas","Acinetobacter","Elizabethkingia",
"Bradyrhizobium","Aureitalea","Rhodospirillum","Arcobacter","Marixanthomonas",
"Pelagicoccus","Azonexus","Thiogranum", "Bizionia","Paracoccus",
"Vibrionimonas","Wandonia","Bauldia","Litorimonas","Anderseniella"))

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


