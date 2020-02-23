setwd("/Users/username/directory")

library("ggplot2")
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

# Set plotting theme to blank
theme_set(theme_bw())


Correlation <- read.csv("ASV-Reads_Family.csv", header = TRUE, sep=",")
corrplot <- ggscatter(Correlation, x = "ReadsRetained", y = "ASVs", color = "#00AFBB", size = 2,
			add = "reg.line",
			add.params = list(color = "black", size = 0.5)) +
			geom_point(color = "black", shape = 21, size = 2) +
			stat_cor(aes(color = ASVs,
			label =paste(..rr.label.., p.label,
			cut(..p.., 
                                              breaks = c(-Inf, 0.0001, 0.001, 0.01, 0.05, Inf),
                                              labels = c("'****'", "'***'", "'**'", "'*'", "'ns'")), 
                            sep = "~")), method = "pearson") +
            yscale("log10", .format = FALSE) +
            xscale("log10", .format = FALSE) +
			#scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
	       # labels = trans_format("log10", math_format(10^.x))) +
		   # scale_y_log10(breaks = trans_breaks("log10", function(x) 10^x), 
		    #labels = trans_format("log10", math_format(10^.x))) +
		    theme(axis.title.y = element_text(face = "bold", size = 14)) +  # adjusts the title of y axis
			theme(axis.title.x = element_text(face = "bold", size = 14)) + # adjusts the title of x axis
			theme(axis.text.y = element_text(angle = 0, hjust = 0, size = 14)) + # adjusts text of y axis
			theme(axis.text.x = element_text(angle = 0, hjust = 0.5, size = 14)) + # adjusts text of x axis
			#theme(legend.title = element_blank()) +
			theme(legend.position = "none") +
			ylab("ASVs") + # add the title on y axis
			xlab("Reads Retained") + # add the title on x axis
			theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) # removes the gridlines

corrplot			
corrplot <- annotate_figure(corrplot,
			fig.lab = "A",
			fig.lab.pos = "top.left",
			fig.lab.size = 14,
			fig.lab.face = "bold")
corrplot			
ggsave("Figure_2A.tiff", width = 6, height = 4, dpi = 300) # save graphic

boxplot1 <- ggplot(Correlation, aes(x = FeedingGroup, y = ASVs)) +
			geom_boxplot(fill = "#00AFBB") +
			#annotate("text", x = Inf, y = Inf, label = "C", size = 4, fontface = "bold", vjust=1, hjust=1) +
			yscale("log10", .format = FALSE) +
			scale_x_discrete(breaks = c("1A", "1B", "2A", "2B"),
								labels = c("1A", "1B", "2A", "2B")) +
			theme(axis.title.y = element_text(face = "bold", size = 14)) +  # adjusts the title of y axis
			theme(axis.title.x = element_text(face = "bold", size = 14)) + # adjusts the title of x axis
			theme(axis.text.y = element_text(angle = 0, hjust = 1, vjust = 0.5,size = 14)) + # adjusts text of y axis
			theme(axis.text.x = element_text(angle = 0, hjust = 0.5, size = 14)) + # adjusts text of x axis
			#theme(legend.title = element_blank()) +
			#theme(legend.position = "top") +
			ylab("ASVs") + # add the title on y axis
			xlab("Feeding Group") + # add the title on x axis
			theme(axis.line = element_line(color = "black"),
					panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
					panel.border = element_blank(), panel.background = element_blank()) # removes the gridlines
boxplot1
boxplot1a <- boxplot1 + annotate(geom="text", x=1.2, y=150, label="Kruskal-Wallis, p = 0.12 ns",
              color="black")
boxplot1a  

boxplot1a <- annotate_figure(boxplot1a,
			fig.lab = "B",
			fig.lab.pos = "top.left",
			fig.lab.size = 14,
			fig.lab.face = "bold")
boxplot1a
ggsave("Figure_2B.tiff", width = 6, height = 4, dpi = 300) # save graphic

boxplot2 <- ggplot(Correlation, aes(x = Family, y = ASVs)) +
			geom_boxplot(fill = "#00AFBB") +
			#annotate("text", x = Inf, y = Inf, label = "D", size = 4, fontface = "bold", vjust=1, hjust=1) +
			yscale("log10", .format = FALSE) +
			#scale_x_discrete(breaks = c("1A", "1B", "2A", "2B"),
				#				labels = c("1A", "1B", "2A", "2B")) +
			theme(axis.title.y = element_text(face = "bold", size = 12)) +  # adjusts the title of y axis
			theme(axis.title.x = element_text(face = "bold", size = 12)) + # adjusts the title of x axis
			theme(axis.text.y = element_text(angle = 0, hjust = 1, vjust = 0.5,size = 11)) + # adjusts text of y axis
			theme(axis.text.x = element_text(angle = 50, hjust = 1.01, vjust = 1.05, size = 11)) + # adjusts text of x axis
			theme(legend.title = element_blank()) +
			#theme(legend.position = "top") +
			ylab("ASVs") + # add the title on y axis
			xlab("Nematode Families") + # add the title on x axis
			theme(axis.line = element_line(color = "black"),
					panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
					panel.border = element_blank(), panel.background = element_blank()) # removes the gridlines
boxplot2
boxplot2a <- boxplot2  + annotate(geom="text", x=3, y=150, label="Kruskal-Wallis, p = 0.001***",
              color="black")
boxplot2a  

boxplot2a <- annotate_figure(boxplot2a,
			fig.lab = "C",
			fig.lab.pos = "top.left",
			fig.lab.size = 14,
			fig.lab.face = "bold")
boxplot2a

ggsave("Figure_2C.tiff", width = 10, height = 5, dpi = 300) # save graphic

ggarrange(corrplot, boxplot1a, boxplot2a, ncol = 2, nrow = 2, labels = c("A", "B", "C"), heights = c(1.8, 2.5), align = c("hv"))
ggsave("Figure_2.tiff", width = 12, height = 10, dpi = 300) # save graphic

#Non-parametric one-way ANOVA - Kruskal-Wallis rank sum test by Family/Feeding Group - ASV only
kt_asv <- read.csv("ASV-Reads_Family.csv", header = TRUE, sep=",")
kruskal.test(LogASVs ~ Family, data = kt_asv) # KW-test by family
kruskal.test(LogASVs ~ FeedingGroup, data = kt_asv) # KW-test by feeding group
parwise_asv <- pairwise.wilcox.test(kt_asv$LogASVs, kt_asv$Family,
                 p.adjust.method = "BH")
write.table(parwise_asv[["p.value"]], file="parwise_asv.csv", sep=",")

#Non-parametric one-way ANOVA - Kruskal-Wallis rank sum test by Family/Feeding Group - OTU only
kt_otu <- read.csv("OTU-Reads-Only_Family.csv", header = TRUE, sep=",")
kruskal.test(LogASVsOTUs ~ Family, data = kt_otu)
kruskal.test(LogASVsOTUs ~ FeedingGroup, data = kt_otu)
parwise_otu <- pairwise.wilcox.test(kt_otu$LogASVsOTUs, kt_otu$Family,
                 p.adjust.method = "BH")
write.table(parwise_otu[["p.value"]], file="output.csv", sep=",")