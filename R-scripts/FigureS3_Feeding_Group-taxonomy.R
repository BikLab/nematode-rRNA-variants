setwd("/Users/user/directory")

library("devtools")
library("ggplot2")
library("ggpubr")
library("ggthemes")
library("extrafont")
library("plyr")
library("scales")
library("ggpubr")
library("gridExtra")
library("ggstance")
library("dplyr")
library("car")
library("FSA")
library("rcompanion")
library("ggsignif")


# Set plotting theme to blank
theme_set(theme_bw())

#important all data and by feeding groups
feeding_group_all <- read.csv("feeding_group_all.csv", header = TRUE, sep=",")
feeding_group_all$logAbundance <- log(feeding_group_all$Abundance) #log transformation of Abundance

feeding_group_1A <- read.csv("feeding_group_1A.csv", header = TRUE, sep=",")
feeding_group_1A$logAbundance <- log(feeding_group_1A$Abundance) #log transformation of Abundance

feeding_group_1B <- read.csv("feeding_group_1B.csv", header = TRUE, sep=",")
feeding_group_1B$logAbundance <- log(feeding_group_1B$Abundance) #log transformation of Abundance

feeding_group_2A <- read.csv("feeding_group_2A.csv", header = TRUE, sep=",")
feeding_group_2A$logAbundance <- log(feeding_group_2A$Abundance) #log transformation of Abundance

feeding_group_2B <- read.csv("feeding_group_2B.csv", header = TRUE, sep=",")
feeding_group_2B$logAbundance <- log(feeding_group_2B$Abundance) #log transformation of Abundance

boxplot <- ggplot(feeding_group_all, aes(x = FG, y = logAbundance, fill = Taxonomy)) +
			geom_boxplot() +
			scale_fill_manual(values=c(NemID= '#999999', OtherEuk= '#E69F00', OtherNem= '#56B4E9')) +
			theme(axis.title.y = element_text(face = "bold", size = 14)) +  # adjusts the title of y axis
			theme(axis.title.x = element_text(face = "bold", size = 14)) + # adjusts the title of x axis
			theme(axis.text.y = element_text(angle = 0, hjust = 1, vjust = 0.5,size = 12)) + # adjusts text of y axis
			theme(axis.text.x = element_text(angle = 0, hjust = 1.01, vjust = 1.05, size = 12)) + # adjusts text of x axis
			#theme(legend.title = element_blank()) +
			#theme(legend.position = "top") +			
			ylab("Log(Number of reads)") + # add the title on y axis
			xlab("Feeding groups") + # add the title on x axis
			theme(axis.line = element_line(color = "black"),
					panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
					panel.border = element_blank(), panel.background = element_blank()) # removes the gridlines
boxplot

my_comparisons_1A <- list( c("NemID", "OtherEuk"), c("NemID", "OtherNem"), c("OtherEuk", "OtherNem") )
compare_means(logAbundance ~ Taxonomy, data = feeding_group_1A, comparisons = my_comparisons_1A, method = "wilcox.test")
boxplot1a <- ggplot(feeding_group_1A, aes(x = Taxonomy, y = logAbundance, fill = Taxonomy)) +
			geom_boxplot() +
			stat_compare_means(method = "kruskal.test", label.x = 0.8, label.y = 20) +
			stat_compare_means(label = "p.signif", method = "wilcox.test", comparisons = my_comparisons_1A) +
			scale_fill_manual(values=c(NemID= '#999999', OtherEuk= '#E69F00', OtherNem= '#56B4E9')) +
			theme(axis.title.y = element_text(face = "bold", size = 14)) +  # adjusts the title of y axis
			theme(axis.title.x = element_text(face = "bold", size = 14)) + # adjusts the title of x axis
			theme(axis.text.y = element_text(angle = 0, hjust = 0.5, vjust = 0.5,size = 12)) + # adjusts text of y axis
			theme(axis.text.x = element_text(angle = 0, hjust = 0.5, vjust = 0.5, size = 12)) + # adjusts text of x axis
			#theme(legend.title = element_blank()) +
			#theme(legend.position = "top") +			
			ylab("Log(Number of reads)") + # add the title on y axis
			xlab("Taxonomy") + # add the title on x axis
			theme(axis.line = element_line(color = "black"),
					panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
					panel.border = element_blank(), panel.background = element_blank()) # removes the gridlines
boxplot1a

#Non-parametric one-way ANOVA - Kruskal-Wallis rank sum test by category
kruskal.test(logAbundance ~ Taxonomy, data = feeding_group_1A)

#pairwise comparisons among categories per feeding group
parwise_asv_1A <- pairwise.wilcox.test(feeding_group_1A$logAbundance, feeding_group_1A$Taxonomy,
                 p.adjust.method = "BH")


boxplot1b <- ggplot(feeding_group_1A, aes(x = Family, y = logAbundance, fill = Taxonomy)) +
			geom_boxplot() +
			ylim(0, 15) +
			scale_fill_manual(values=c(NemID= '#999999', OtherEuk= '#E69F00', OtherNem= '#56B4E9')) +
			theme(axis.title.y = element_text(face = "bold", size = 14)) +  # adjusts the title of y axis
			theme(axis.title.x = element_text(face = "bold", size = 14)) + # adjusts the title of x axis
			theme(axis.text.y = element_text(angle = 0, hjust = 1, vjust = 0.5,size = 12)) + # adjusts text of y axis
			theme(axis.text.x = element_text(angle = 50, hjust = 1.01, vjust = 1.05, size = 12)) + # adjusts text of x axis
			#annotate("text", x = 3.3, y = 11.5, label = "Feeding group 1A", size = 5, fontface = "bold", vjust=1, hjust=1) +
			#theme(legend.title = element_blank()) +
			#theme(legend.position = "top") +			
			ylab("Log(Number of reads)") + # add the title on y axis
			xlab("Nematode family") + # add the title on x axis
			theme(axis.line = element_line(color = "black"),
					panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
					panel.border = element_blank(), panel.background = element_blank()) # removes the gridlines
boxplot1b

my_comparisons_1B <- list( c("NemID", "OtherEuk"), c("NemID", "OtherNem"), c("OtherEuk", "OtherNem") )
compare_means(logAbundance ~ Taxonomy, data = feeding_group_1B, comparisons = my_comparisons_1B, method = "wilcox.test")
boxplot2a <- ggplot(feeding_group_1B, aes(x = Taxonomy, y = logAbundance, fill = Taxonomy)) +
			geom_boxplot() +
			stat_compare_means(method = "kruskal.test", label.x = 0.8, label.y = 20) +
			stat_compare_means(label = "p.signif", method = "wilcox.test", comparisons = my_comparisons_1B) +
			scale_fill_manual(values=c(NemID= '#999999', OtherEuk= '#E69F00', OtherNem= '#56B4E9')) +
			theme(axis.title.y = element_text(face = "bold", size = 14)) +  # adjusts the title of y axis
			theme(axis.title.x = element_text(face = "bold", size = 14)) + # adjusts the title of x axis
			theme(axis.text.y = element_text(angle = 0, hjust = 0.5, vjust = 0.5,size = 12)) + # adjusts text of y axis
			theme(axis.text.x = element_text(angle = 0, hjust = 0.5, vjust = 0.5, size = 12)) + # adjusts text of x axis
			#theme(legend.title = element_blank()) +
			#theme(legend.position = "top") +			
			ylab("Log(Number of reads)") + # add the title on y axis
			xlab("Taxonomy") + # add the title on x axis
			theme(axis.line = element_line(color = "black"),
					panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
					panel.border = element_blank(), panel.background = element_blank()) # removes the gridlines
boxplot2a

#Non-parametric one-way ANOVA - Kruskal-Wallis rank sum test by category
kruskal.test(logAbundance ~ Taxonomy, data = feeding_group_1B)

#pairwise comparisons among categories per feeding group
parwise_asv_1B <- pairwise.wilcox.test(feeding_group_1B$logAbundance, feeding_group_1B$Taxonomy,
                 p.adjust.method = "BH")

boxplot2b <- ggplot(feeding_group_1B, aes(x = Family, y = logAbundance, fill = Taxonomy)) +
			geom_boxplot() +
			ylim(0, 15) +			
			scale_fill_manual(values=c(NemID= '#999999', OtherEuk= '#E69F00', OtherNem= '#56B4E9')) +
			theme(axis.title.y = element_text(face = "bold", size = 14)) +  # adjusts the title of y axis
			theme(axis.title.x = element_text(face = "bold", size = 14)) + # adjusts the title of x axis
			theme(axis.text.y = element_text(angle = 0, hjust = 1, vjust = 0.5,size = 12)) + # adjusts text of y axis
			theme(axis.text.x = element_text(angle = 50, hjust = 1.01, vjust = 1.05, size = 12)) + # adjusts text of x axis
			#annotate("text", x = 2.3, y = 12, label = "Feeding group 1B", size = 5, fontface = "bold", vjust=1, hjust=1) +
			#theme(legend.title = element_blank()) +
			#theme(legend.position = "top") +			
			ylab("Log(Number of reads)") + # add the title on y axis
			xlab("Nematode family") + # add the title on x axis
			theme(axis.line = element_line(color = "black"),
					panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
					panel.border = element_blank(), panel.background = element_blank()) # removes the gridlines
boxplot2b

my_comparisons_2A <- list( c("NemID", "OtherEuk"), c("NemID", "OtherNem"), c("OtherEuk", "OtherNem") )
compare_means(logAbundance ~ Taxonomy, data = feeding_group_2A, comparisons = my_comparisons_2A, method = "wilcox.test")
boxplot3a <- ggplot(feeding_group_2A, aes(x = Taxonomy, y = logAbundance, fill = Taxonomy)) +
			geom_boxplot() +
			stat_compare_means(method = "kruskal.test", label.x = 0.8, label.y = 20) +
			stat_compare_means(label = "p.signif", method = "wilcox.test", comparisons = my_comparisons_2A) +
			scale_fill_manual(values=c(NemID= '#999999', OtherEuk= '#E69F00', OtherNem= '#56B4E9')) +
			theme(axis.title.y = element_text(face = "bold", size = 14)) +  # adjusts the title of y axis
			theme(axis.title.x = element_text(face = "bold", size = 14)) + # adjusts the title of x axis
			theme(axis.text.y = element_text(angle = 0, hjust = 0.5, vjust = 0.5,size = 12)) + # adjusts text of y axis
			theme(axis.text.x = element_text(angle = 0, hjust = 0.5, vjust = 0.5, size = 12)) + # adjusts text of x axis
			#theme(legend.title = element_blank()) +
			#theme(legend.position = "top") +			
			ylab("Log(Number of reads)") + # add the title on y axis
			xlab("Taxonomy") + # add the title on x axis
			theme(axis.line = element_line(color = "black"),
					panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
					panel.border = element_blank(), panel.background = element_blank()) # removes the gridlines
boxplot3a

#Non-parametric one-way ANOVA - Kruskal-Wallis rank sum test by category
kruskal.test(logAbundance ~ Taxonomy, data = feeding_group_2A)

#pairwise comparisons among categories per feeding group
parwise_asv_2A <- pairwise.wilcox.test(feeding_group_2A$logAbundance, feeding_group_2A$Taxonomy,
                 p.adjust.method = "BH")

boxplot3b <- ggplot(feeding_group_2A, aes(x = Family, y = logAbundance, fill = Taxonomy)) +
			geom_boxplot() +
			ylim(0, 15) +
			scale_fill_manual(values=c(NemID= '#999999', OtherEuk= '#E69F00', OtherNem= '#56B4E9')) +
			theme(axis.title.y = element_text(face = "bold", size = 14)) +  # adjusts the title of y axis
			theme(axis.title.x = element_text(face = "bold", size = 14)) + # adjusts the title of x axis
			theme(axis.text.y = element_text(angle = 0, hjust = 1, vjust = 0.5,size = 12)) + # adjusts text of y axis
			theme(axis.text.x = element_text(angle = 50, hjust = 1.01, vjust = 1.05, size = 12)) + # adjusts text of x axis
			#annotate("text", x = 3, y = 16, label = "Feeding group 2A", size = 5, fontface = "bold", vjust=1, hjust=1) +
			#theme(legend.title = element_blank()) +
			#theme(legend.position = "top") +			
			ylab("Log(Number of reads)") + # add the title on y axis
			xlab("Nematode family") + # add the title on x axis
			theme(axis.line = element_line(color = "black"),
					panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
					panel.border = element_blank(), panel.background = element_blank()) # removes the gridlines
boxplot3b

my_comparisons_2B <- list( c("NemID", "OtherEuk"), c("NemID", "OtherNem"), c("OtherEuk", "OtherNem") )
compare_means(logAbundance ~ Taxonomy, data = feeding_group_2B, comparisons = my_comparisons_2B, method = "wilcox.test")
boxplot4a <- ggplot(feeding_group_2B, aes(x = Taxonomy, y = logAbundance, fill = Taxonomy)) +
			geom_boxplot() +
			stat_compare_means(method = "kruskal.test", label.x = 0.8, label.y = 20) +
			stat_compare_means(label = "p.signif", method = "wilcox.test", comparisons = my_comparisons_2B) +
			scale_fill_manual(values=c(NemID= '#999999', OtherEuk= '#E69F00', OtherNem= '#56B4E9')) +
			theme(axis.title.y = element_text(face = "bold", size = 14)) +  # adjusts the title of y axis
			theme(axis.title.x = element_text(face = "bold", size = 14)) + # adjusts the title of x axis
			theme(axis.text.y = element_text(angle = 0, hjust = 0.5, vjust = 0.5,size = 12)) + # adjusts text of y axis
			theme(axis.text.x = element_text(angle = 0, hjust = 0.5, vjust = 0.5, size = 12)) + # adjusts text of x axis
			#theme(legend.title = element_blank()) +
			#theme(legend.position = "top") +			
			ylab("Log(Number of reads)") + # add the title on y axis
			xlab("Taxonomy") + # add the title on x axis
			theme(axis.line = element_line(color = "black"),
					panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
					panel.border = element_blank(), panel.background = element_blank()) # removes the gridlines
boxplot4a

#Non-parametric one-way ANOVA - Kruskal-Wallis rank sum test by category
kruskal.test(logAbundance ~ Taxonomy, data = feeding_group_2B)

#pairwise comparisons among categories per feeding group
parwise_asv_2B <- pairwise.wilcox.test(feeding_group_2B$logAbundance, feeding_group_2B$Taxonomy,
                 p.adjust.method = "BH")

boxplot4b <- ggplot(feeding_group_2B, aes(x = Family, y = logAbundance, fill = Taxonomy)) +
			geom_boxplot() +
			ylim(0, 15) +
			scale_fill_manual(values=c(NemID= '#999999', OtherEuk= '#E69F00', OtherNem= '#56B4E9')) +
			theme(axis.title.y = element_text(face = "bold", size = 14)) +  # adjusts the title of y axis
			theme(axis.title.x = element_text(face = "bold", size = 14)) + # adjusts the title of x axis
			theme(axis.text.y = element_text(angle = 0, hjust = 1, vjust = 0.5,size = 12)) + # adjusts text of y axis
			theme(axis.text.x = element_text(angle = 50, hjust = 1.01, vjust = 1.05, size = 12)) + # adjusts text of x axis
			#annotate("text", x = 2.5, y = 13, label = "Feeding group 2B", size = 4, fontface = "bold", vjust=1, hjust=1) +
			#theme(legend.title = element_blank()) +
			#theme(legend.position = "top") +			
			ylab("Log(Number of reads)") + # add the title on y axis
			xlab("Nematode family") + # add the title on x axis
			theme(axis.line = element_line(color = "black"),
					panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
					panel.border = element_blank(), panel.background = element_blank()) # removes the gridlines
boxplot4b

ggarrange(boxplot1b, boxplot1a, boxplot2b, boxplot2a, boxplot3b, boxplot3a, boxplot4b, boxplot4a, ncol =2, nrow = 4,labels = c("A", "B", "C", "D", "E", "F", "G", "H"), common.legend = TRUE, legend = "bottom")
ggsave("Figure_S3.tiff", width = 8, height = 18, dpi = 300) # save graphic

##########