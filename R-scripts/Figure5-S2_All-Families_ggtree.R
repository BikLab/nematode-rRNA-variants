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

# Step 1 - Loading data
tree <- read.tree("RAxML_bipartitions_ML_rooted.tree") # important tree based on nematode ASV sequence
NemDom <-read.csv("All_families_NemDom-new.csv") # important metadata
Label <- read.csv("All_families_labels-new.csv") # important metadata
ASVAbundance <- read.csv("All_families_ASVs-new.csv") # important metadata


# Step 2 - plot a simple tree

pnode <- ggtree(tree, size= 0.5, branch.length="none") + # figure node number for specific annotations
		 geom_text2(aes(label = node))
pnode		 
p <- ggtree(tree, size=1.5, branch.length="none") +
	geom_tiplab(size=3, color= "black", fontface="italic", hjust=-0.05, geom = "text") +
	geom_label2(aes(subset = !is.na(is.numeric(label)) & as.numeric(label) > 70, label=round(as.numeric(label))), size = 2) +
	geom_cladelabel(191, "Comesomatidae", offset=15, barsize=2, angle=90, offset.text=1.5, hjust=0.5, fontsize=3) + 
	geom_cladelabel(166, "Chromadoridae", offset=15, barsize=2, angle=90, offset.text=1.5, hjust=0.5, fontsize=3) + 
	geom_cladelabel(138, "Desmoscolecidae", offset=15, barsize=2, angle=90, offset.text=1.5, hjust=0.5, fontsize=3) + 
	geom_cladelabel(241, "Oxystominidae", offset=15, barsize=2, angle=90, offset.text=1.5, hjust=0.5, fontsize=3) +
	geom_hilight(node=191, fill="#1B9E77", alpha=0.3, extend = -0.5) +
	geom_hilight(node=166, fill="#D95F02", alpha=0.3, extend = -0.5) +
	geom_hilight(node=138, fill="#7570B3", alpha=0.3, extend = -0.5) +
	geom_hilight(node=241, fill="#E7298A", alpha=0.3, extend = -0.5)
p

p1 <- facet_plot(p + xlim_tree(30), panel = "Relative Abundance ASVs", data = ASVAbundance,
				 geom = geom_barh,
                 mapping = aes(x = Abundance, fill = ASV),
                 width = 0.9, stat="identity")
p1

p2 <- p1 + scale_fill_viridis(discrete = TRUE) +
  theme_tree2() + guides(colour = guide_legend(override.aes = list(size=4),ncol=2))
p2

p3 <- p2 %<+% NemDom + geom_tippoint(aes(color=Taxonomy, shape=Taxonomy, x=x+14), size= 3) +
	scale_color_manual(values=c(A= '#999999', C= '#E69F00', B= '#56B4E9'))
p3

p4 <- facet_plot(p + xlim_tree(30), panel = "Taxonomy", data = ASVAbundance,
				 geom = geom_barh,
				 mapping = aes(x = Abundance, fill = Taxonomy),
				 width = 0.9, stat = "identity" )
p4

p5 <- p4 + scale_fill_manual(values=c(NemID= '#999999', OtherEuk= '#E69F00', OtherNem= '#56B4E9')) +
  theme_tree2()
p5

p6 <- facet_labeller(p3, c(Tree="Phylogeny - Main Nematode Families", bar="RA% ASVs")) %>% facet_widths(c(Tree = 2))
p6
ggsave("Fig_3A_ASV-test.tiff", width = 8, height = 30, dpi = 300) # save graphic

p7 <- facet_labeller(p5, c(Tree="Phylogeny - Main Nematode Families", bar="Taxonomy")) %>% facet_widths(c(Tree = 2))
p7
ggsave("Fig_3B_Taxonomy.tiff", width = 8, height = 30, dpi = 300) # save graphic