setwd("/Users/username/directory")

library("ggplot2")
library("ggthemes")
library("extrafont")
library("plyr")
library("scales")
library("ggpubr")

theme_set(theme_bw())

morpho <- read.csv("family-genus-count.csv", header = TRUE, sep=",")
feeding <- read.csv("feeding-count.csv", header = TRUE, sep=",")

p1 <- ggplot(morpho, aes(fill = Rank, x=Family, y=Count)) +
    geom_bar(position = "dodge", stat="identity") +
    scale_fill_manual(values= c("#00AFBB", "#E7B800", "grey50"),
    					  breaks= c("A", "B", "C"),
    					  labels= c("Genera", "Morphospecies", "Individuals"))+
    scale_y_continuous(expand = c(0.01,0.2)) +				  
    theme(axis.title.y = element_text(face = "bold", size = 12)) +  # adjusts the title of y axis
	theme(axis.title.x = element_text(face = "bold", size = 12)) + # adjusts the title of x axis
	theme(axis.text.y = element_text(angle = 0, hjust = 1, size = 11)) + # adjusts text of y axis
	theme(axis.text.x = element_text(angle = 50, hjust = 1.01, vjust = 1.05, size = 11)) + # adjusts text of x axis
	ylab("Total Number") + # add the title on y axis
	xlab("Nematode Families") + # add the title on x axis
	#labs(fill = "Levels") + # change legend title
	theme(legend.position = c(0.88, 0.8)) + # add legend within the box with coordinates
	theme(legend.title=element_blank()) +
	theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) # removes the gridlines
p1

p1 <- annotate_figure(p1,
			fig.lab = "A",
			fig.lab.pos = "top.left",
			fig.lab.size = 14,
			fig.lab.face = "bold")
p1			
ggsave("Figure_S1A.tiff", width = 6, height = 4, dpi = 300) # save graphic

p2 <- ggplot() +
	geom_bar(data = feeding, aes(x= TrophicGroup, y= Counts), stat="identity", fill = "#00AFBB", position ="dodge", width= 0.5) +
	geom_bar(data = feeding, aes(x= TrophicGroup, y= RA), stat="identity", fill = "#00AFBB", position ="dodge", width= 0.5) +
    scale_x_discrete(name = "Feeding Groups") +
    scale_y_continuous(name = "Number of specimens", expand = c(0.01,0.2),
    		sec.axis = sec_axis(~ . *100/257, name = "Relative abundance",
    			labels = function(b) {paste0(round(b), "%")})) +
    theme(axis.title.y = element_text(face = "bold", size = 12)) +  # adjusts the title of y axis
	theme(axis.title.x = element_text(face = "bold", size = 12)) + # adjusts the title of x axis
	theme(axis.text.y = element_text(angle = 0, hjust = 1, size = 12)) + # adjusts text of y axis
	theme(axis.text.x = element_text(angle = 0, hjust = 0.5, vjust = 1, size = 12)) + # adjusts text of x axis
	#ylab("Number of specimens") + # add the title on y axis
	#xlab("Feeding Groups") + # add the title on x axis
	#labs(fill = "Levels") + # change legend title
	theme(legend.position = c(0.85, 0.85)) + # add legend within the box with coordinates
	theme(legend.title=element_blank()) +
	theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) # removes the gridlines
p2

p2 <- annotate_figure(p2,
			fig.lab = "B",
			fig.lab.pos = "top.left",
			fig.lab.size = 14,
			fig.lab.face = "bold")
p2			
ggsave("Figure_S1B.tiff", width = 6, height = 4, dpi = 300) # save graphic

ggarrange(p1, p2)				 
ggsave("Figure_S1A-B.tiff", width = 12, height = 6, dpi = 300) # save graphic
