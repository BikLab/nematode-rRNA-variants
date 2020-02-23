setwd("/Users/username/directory")

library("ggplot2")
library("ggthemes")
library("extrafont")
library("plyr")
library("scales")
library("ggpubr")

theme_set(theme_bw())

diverse <- read.csv("diverse-rRNA-variants.csv", header = TRUE, sep=",")

shannon <- ggplot(diverse, aes(x = Family, y = H)) +
			geom_boxplot(fill = "#1B9E77") +
			facet_grid(~ FG, scale= "free_x", drop = TRUE) +
			theme(strip.text.x = element_text(size = 12, color = "black", face = "bold")) +
			theme(axis.title.y = element_text(face = "bold", size = 12)) +  # adjusts the title of y axis
			theme(axis.title.x = element_blank(),
				  axis.text.x = element_blank(),
				  axis.ticks.x=element_blank()) + # remove x-axis labels and tick marks
			theme(axis.text.y = element_text(angle = 0, hjust = 1, vjust = 0.5,size = 11)) + # adjusts text of y axis
			theme(legend.title = element_blank()) +
			#theme(legend.position = "top") +
			ylab("Shannon") + # add the title on y axis
			xlab("Nematode Families") + # add the title on x axis
			theme(legend.title=element_blank()) +
			theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
shannon

shannon <- annotate_figure(shannon,
			fig.lab = "A",
			fig.lab.pos = "top.left",
			fig.lab.size = 14,
			fig.lab.face = "bold")
shannon
ggsave("Figure_3A.tiff", width = 6, height = 2, dpi = 300) # save graphic

richness <- ggplot(diverse, aes(x = Family, y = d)) +
			geom_boxplot(fill = "#D95F02") +
			facet_grid(~ FG, scale= "free_x", drop = TRUE) +
			theme(strip.background = element_blank(), strip.text.x = element_blank()) +
			theme(axis.title.y = element_text(face = "bold", size = 12)) +  # adjusts the title of y axis
			theme(axis.title.x = element_blank(),
				  axis.text.x = element_blank(),
				  axis.ticks.x=element_blank()) + # remove x-axis labels and tick marks
			theme(axis.text.y = element_text(angle = 0, hjust = 1, vjust = 0.5,size = 11)) + # adjusts text of y axis
			theme(legend.title = element_blank()) +
			#theme(legend.position = "top") +
			ylab("Richness") + # add the title on y axis
			xlab("Nematode Families") + # add the title on x axis
			theme(legend.title=element_blank()) +
			theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
richness

richness <- annotate_figure(richness,
			fig.lab = "B",
			fig.lab.pos = "top.left",
			fig.lab.size = 14,
			fig.lab.face = "bold")
richness

ggsave("Figure_3B.tiff", width = 6, height = 2, dpi = 300) # save graphic

simpson <- ggplot(diverse, aes(x = Family, y = Lambda)) +
			geom_boxplot(fill = "#7570B3") +
			facet_grid(~ FG, scale= "free_x", drop = TRUE) +
			theme(strip.background = element_blank(), strip.text.x = element_blank()) +
			theme(axis.title.x = element_text(face = "bold", size = 12)) + # adjusts the title of x axis
			theme(axis.title.y = element_text(face = "bold", size = 12)) +  # adjusts the title of y axis
			theme(axis.text.y = element_text(angle = 0, hjust = 1, vjust = 0.5,size = 11)) + # adjusts text of y axis
			theme(axis.text.x = element_text(angle = 50, hjust = 1.01, vjust = 1.05, size = 11)) + # adjusts text of x axis
			theme(legend.title = element_blank()) +			#theme(legend.position = "top") +
			ylab("Simpson") + # add the title on y axis
			xlab("Nematode Families") + # add the title on x axis
			theme(legend.title=element_blank()) +
			theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
simpson

simpson <- annotate_figure(simpson,
			fig.lab = "C",
			fig.lab.pos = "top.left",
			fig.lab.size = 14,
			fig.lab.face = "bold")
simpson

ggsave("Figure_3C.tiff", width = 6, height = 3, dpi = 300) # save graphic


############ Non-parametric Kruskal-Wallis rank sum test by Family/Feeding Group - ASV only ############ 
kt_diverse_shannon <- read.csv("diverse-rRNA-variants.csv", header = TRUE, sep=",")
kruskal.test(H ~ Family, data = kt_diverse_shannon) # KW-test by family
parwise_asv_shannon <- pairwise.wilcox.test(kt_diverse_shannon$H, kt_diverse_shannon$Family,
                 p.adjust.method = "BH")
write.table(parwise_asv_shannon[["p.value"]], file="parwise_asv_shannon.csv", sep=",")
kruskal.test(H ~ FG, data = kt_diverse_shannon) # KW-test by feeding group

kt_diverse_richness <- read.csv("diverse-rRNA-variants.csv", header = TRUE, sep=",")
kruskal.test(d ~ Family, data = kt_diverse_richness) # KW-test by family
parwise_asv_richness <- pairwise.wilcox.test(kt_diverse_richness$d, kt_diverse_richness$Family,
                 p.adjust.method = "BH")
write.table(parwise_asv_richness[["p.value"]], file="parwise_asv_richness.csv", sep=",")
kruskal.test(d ~ FG, data = kt_diverse_richness) # KW-test by feeding group

kt_diverse_simpson <- read.csv("diverse-rRNA-variants.csv", header = TRUE, sep=",")
kruskal.test(Lambda ~ Family, data = kt_diverse_simpson) # KW-test by family
parwise_asv_simpson <- pairwise.wilcox.test(kt_diverse_simpson$Lambda, kt_diverse_simpson$Family,
                 p.adjust.method = "BH")
write.table(parwise_asv_simpson[["p.value"]], file="parwise_asv_simpson.csv", sep=",")
kruskal.test(Lambda ~ FG, data = kt_diverse_simpson) # KW-test by feeding group