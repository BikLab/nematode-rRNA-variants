setwd("/Users/username/directory")  # sets working directory
library(ggplot2) # to generate graphics
library(cowplot) # allows to split graphics into panels with plot_grid (not been used here)
library(ggpubr)  # allows to split graphics into panels with ggarrange
library(scales) # allows scale transformation to log, including labels

theme_set(theme_bw()) # sets white background for all graphics

#read orginal biomtable, raw read counts
desmoscolecidae_asv <- read.table(file = 'DADA2_BiomTable_Desmoscolecidae.tsv', sep = '\t', header = TRUE)

comesomatidae_asv <- read.table(file = 'DADA2_BiomTable_Comesomatidae.tsv', sep = '\t', header = TRUE)

chromadoridae_asv <- read.table(file = 'DADA2_BiomTable_Chromadoridae.tsv', sep = '\t', header = TRUE)

oxystominidae_asv <- read.table(file = 'DADA2_BiomTable_Oxystominidae.tsv', sep = '\t', header = TRUE)

#sort all columns independently, i.e. rank ASVs in decreasing order
desmoscolecidae_asv_sorted <- apply(desmoscolecidae_asv, 2, sort, decreasing=T)

comesomatidae_asv_sorted <- apply(comesomatidae_asv, 2, sort, decreasing=T)

chromadoridae_asv_sorted <- apply(chromadoridae_asv, 2, sort, decreasing=T)

oxystominidae_asv_sorted <- apply(oxystominidae_asv, 2, sort, decreasing=T)

#export new sorted object as txt
write.table(desmoscolecidae_asv_sorted,
			"/Users/tiagopereira/Dropbox/ENv-DNA-Paper/desmoscolecidae_asv_sorted.txt",
			sep='\t')
write.table(comesomatidae_asv_sorted,
			"/Users/tiagopereira/Dropbox/ENv-DNA-Paper/comesomatidae_asv_sorted.txt",
			sep='\t')
write.table(chromadoridae_asv_sorted,
			"/Users/tiagopereira/Dropbox/ENv-DNA-Paper/chromadoridae_asv_sorted.txt",
			sep='\t')
write.table(oxystominidae_asv_sorted,
			"/Users/tiagopereira/Dropbox/ENv-DNA-Paper/oxystominidae_asv_sorted.txt",
			sep='\t')
			
# All sorted nematode family tables should be combined into one table having columns: number of ASVs, their mean number of reads and the adjusted mean (+1), and their respective nematode family
 
allfamilies <- read.csv("all_families_asv_sorted.csv", header = TRUE, sep=",") # reads new table with ranked values for ASVs. The mean number was adjust to x + 1, so log transformation is not negative
allfamilies_plot <- ggplot(allfamilies, aes(x=Ranked_ASV, y=Adjust_Mean, color = Family, shape = Family)) +
	yscale("log10", .format = FALSE) +
    xscale("log10", .format = FALSE) +
	#scale_y_log10(breaks = trans_breaks("log10", function(x) 10^x),
     #         labels = trans_format("log10", math_format(10^.x))) +
	#scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
     #         labels = trans_format("log10", math_format(10^.x))) +
    geom_point(size=2) +
    scale_color_brewer(palette = "Dark2") +
    theme(axis.title.y = element_text(face = "bold", size = 14)) +  # adjusts the title of y axis
	theme(axis.title.x = element_text(face = "bold", size = 14)) + # adjusts the title of x axis
	theme(axis.text.y = element_text(angle = 0, hjust = 1, size = 12)) + # adjusts text of y axis
	theme(axis.text.x = element_text(angle = 0, hjust = 1, size = 12)) + # adjusts text of x axis
	ylab("Number of reads") + # add the title on y axis
	xlab("Ranked ASV") + # add the title on x axis
	theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) + # removes the gridlines
	#theme(legend.position =  "none")
	theme(legend.title = element_text(size = 14, face = "bold"), legend.title.align = 0.5)
	#ggtitle("Chromadoridae") + # add the title on graphic
	#theme(plot.title = element_text(hjust = 0.5, face = "bold", size =12)) +
allfamilies_plot
allfamilies_plot <- annotate_figure(allfamilies_plot,
			fig.lab = "A",
			fig.lab.pos = "top.left",
			fig.lab.size = 14,
			fig.lab.face = "bold")
allfamilies_plot
ggsave("Figure_3A_allfamilies_Ranked-ASV.tiff", width = 7, height = 5, dpi = 300) # save graphic

### examples from single nematodes################
# From the sorted tables, individual nematodes (2 per family) were selected for this example
ind_asv_rank <- read.csv("ind_asv_rank_new.csv", header = TRUE, sep=",")
ind_asv_rank_plot <- ggplot(ind_asv_rank, aes(x=Ranked_ASV, y=Abundance, colour = Family)) +
	yscale("log10", .format = FALSE) +
    xscale("log10", .format = FALSE) +
 	#scale_y_log10(breaks = trans_breaks("log10", function(x) 10^x),
     #       labels = trans_format("log10", math_format(10^.x))) +
	#scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
     #       labels = trans_format("log10", math_format(10^.x))) +
    geom_point(aes(shape=Sample), size=2) +
    scale_shape_manual(values=c(19, 17, 15, 3, 25, 8, 23, 4))+
    scale_color_brewer(palette = "Dark2") +    
    theme(axis.title.y = element_text(face = "bold", size = 12)) +  # adjusts the title of y axis
	theme(axis.title.x = element_text(face = "bold", size = 12)) + # adjusts the title of x axis
	theme(axis.text.y = element_text(angle = 0, hjust = 1, size = 11)) + # adjusts text of y axis
	theme(axis.text.x = element_text(angle = 0, hjust = 1, size = 11)) + # adjusts text of x axis
	ylab("Number of reads") + # add the title on y axis
	xlab("Ranked ASV") + # add the title on x axis
	theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) + # removes the gridlines
	theme(legend.title = element_text(size = 14, face = "bold"), legend.title.align = 0.5)
#	guides (color = FALSE)

ind_asv_rank_plot <- annotate_figure(ind_asv_rank_plot,
			fig.lab = "B",
			fig.lab.pos = "top.left",
			fig.lab.size = 14,
			fig.lab.face = "bold")
ind_asv_rank_plot
ggsave("Figure_3B_ind_Ranked-ASV.tiff", width = 7, height = 5, dpi = 300) # save graphic