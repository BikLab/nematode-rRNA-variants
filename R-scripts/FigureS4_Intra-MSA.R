setwd("/Users/username/directory")

library("ape")
library("ggplot2")
library ("ggtree")
library("ggstance")
library("ggplotify")
library("treeio")
library("viridis")
library("RColorBrewer")
library("grid")
library("gtable")
library("reshape2")
library("ggrepel")
library("gridExtra")
library("ggpubr")
library("XVector")
library("Biostrings")

# Step 1 - Loading trees by taxa
#tree_Desmo <- read.tree("Desmoscolex_sp9_intra-ASV.tree") # import tree based on nematode ASV sequence
#fasta_Demo <- c("Desmoscolex_sp9_intra-ASV.fas") # import tree based on nematode ASV sequence
#fasta_Demo_var <- c("Desmoscolex_sp9_intra-ASV_variable-sites.fas") # import tree based on nematode ASV sequence
#label_Desmo <- read.csv("Desmoscolex_labels.csv") # import tree based on nematode ASV sequence

# Step 1 - Loading trees by taxa
tree_all <- read.tree("intra-msa-GINSI-ML-rooted.tree") # import tree based on nematode ASV sequence
fasta_all_var <- c("intra-msa-GINSI-variable-sites.fas") # import tree based on nematode ASV sequence
label_all <- read.csv("intra-msa-label.csv") # import tree based on nematode ASV sequence
ASV_Code <- read.csv("ASV_Code.csv") # import tree based on nematode ASV sequence

# Step 2 - Loading msa by taxa
p <- ggtree(tree_all, branch.length="none") +
#	geom_text2(aes(label=node, size=2))
	#geom_tiplab(size=3, color= "black", fontface="italic", hjust=-0.05, geom = "text") +
	geom_label2(aes(subset = !is.na(is.numeric(label)) & as.numeric(label) > 70, label=round(as.numeric(label))), size = 2) +
	#geom_cladelabel(121, "Dichromadora sp.", offset=15, barsize=2, angle=90, offset.text=1.5, hjust=0.5, fontsize=3) + 
	#geom_cladelabel(179, "Desmoscolex sp9", offset=15, barsize=2, angle=90, offset.text=1.5, hjust=0.5, fontsize=3) + 
	#geom_cladelabel(207, "Sabatieria sp5", offset=15, barsize=2, angle=90, offset.text=1.5, hjust=0.5, fontsize=3) + 
	#geom_cladelabel(225, "Thalassoanolaimus sp2", offset=15, barsize=2, angle=90, offset.text=1.5, hjust=0.5, fontsize=3) +
	geom_hilight(node=121, fill="#1B9E77", alpha=0.3, extend = -0.5) +
	geom_hilight(node=179, fill="#D95F02", alpha=0.3, extend = -0.5) +
	geom_hilight(node=207, fill="#7570B3", alpha=0.3, extend = -0.5) +
	geom_hilight(node=225, fill="#E7298A", alpha=0.3, extend = -0.5)
p

p1 <- p %<+% label_all + geom_tiplab(aes(color = Sample), size=4, hjust=-0.08, fontface = "bold") +
	 					 scale_color_viridis(discrete = TRUE) +
	 					 geom_tippoint(aes(shape=ASV_Label, color=ASV_Label), size= 3)
p1

# Step 3 - plot tree and msa

p2 <- msaplot(p1, fasta_all_var, offset= 10, width=2, height=0.7, c("a" = "turquoise", "c" = "maroon", "g" = "mediumpurple1", "t" = "royalblue4", "-" = "light gray", "m" = "yellow", "r" = "orange"), bg_line = TRUE)
p2


p3 <- p2 + theme(legend.position="right") +
	guides(color=FALSE, shape=FALSE)
p3

ggsave("Figure_S4.tiff", width = 20, height = 18, dpi=200)