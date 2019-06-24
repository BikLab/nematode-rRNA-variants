library(ggplot2)
library(scales)
library(dplyr)
library(tidyr)

### Import DADA2 Nem Samples ###
### First Change working Directory ### 
setwd("../DADA_SeparatedSample/")

Sample_01 <- read.table("nem18.tsv", sep = "\t", header = T)
Sample_02 <- read.table("nem21.tsv", sep = "\t", header = T)
Sample_03 <- read.table("nem30.tsv", sep = "\t", header = T)
Sample_04 <- read.table("nem39.tsv", sep = "\t", header = T)
Sample_05 <- read.table("nem47.tsv", sep = "\t", header = T)
Sample_06 <- read.table("nem48.tsv", sep = "\t", header = T)
Sample_07 <- read.table("nem68.tsv", sep = "\t", header = T)
Sample_08 <- read.table("nem91.tsv", sep = "\t", header = T)
Sample_09 <- read.table("nem94.tsv", sep = "\t", header = T)
Sample_10 <- read.table("nem141.tsv", sep = "\t", header = T)
Sample_11 <- read.table("nem142.tsv", sep = "\t", header = T)
Sample_12 <- read.table("nem145.tsv", sep = "\t", header = T)
Sample_13 <- read.table("nem146.tsv", sep = "\t", header = T)
Sample_14 <- read.table("nem149.tsv", sep = "\t", header = T)
Sample_15 <- read.table("nem154.tsv", sep = "\t", header = T)
Sample_16 <- read.table("nem160.tsv", sep = "\t", header = T)
Sample_17 <- read.table("nem165.tsv", sep = "\t", header = T)
Sample_18 <- read.table("nem166.tsv", sep = "\t", header = T)
Sample_19 <- read.table("nem178.tsv", sep = "\t", header = T)
Sample_20 <- read.table("nem189.tsv", sep = "\t", header = T)
Sample_21 <- read.table("nem200.tsv", sep = "\t", header = T)
Sample_22 <- read.table("nem201.tsv", sep = "\t", header = T)
Sample_23 <- read.table("nem206.tsv", sep = "\t", header = T)
Sample_24 <- read.table("nem208.tsv", sep = "\t", header = T)
Sample_25 <- read.table("nem212.tsv", sep = "\t", header = T)
Sample_26 <- read.table("nem228.tsv", sep = "\t", header = T)
Sample_27 <- read.table("nem287.tsv", sep = "\t", header = T)

### Add Species Column to each Sample ###
Sample_01$Species <- "Dichromadora Sp"
Sample_02$Species <- "Dichromadora Sp"
Sample_03$Species <- "Dichromadora Sp"
Sample_04$Species <- "Dichromadora Sp"
Sample_05$Species <- "Dichromadora Sp"
Sample_06$Species <- "Dichromadora Sp"
Sample_07$Species <- "Dichromadora Sp"
Sample_08$Species <- "Neochromadora Sp"
Sample_09$Species <- "Chromadoridae Sp1"
Sample_10$Species <- "Dichromadora Sp"
Sample_11$Species <- "Dichromadora Sp"
Sample_12$Species <- "Dichromadora Sp"
Sample_13$Species <- "Dichromadora Sp"
Sample_14$Species <- "Dichromadora Sp"
Sample_15$Species <- "Dichromadora Sp"
Sample_16$Species <- "Chromadoridae Sp2"
Sample_17$Species <- "Dichromadora Sp"
Sample_18$Species <- "Chromadoridae Sp5"
Sample_19$Species <- "Chromadoridae Sp4"
Sample_20$Species <- "Chromadorella Sp3"
Sample_21$Species <- "Chromadoridae Sp3"
Sample_22$Species <- "Chromadorella Sp2"
Sample_23$Species <- "Euchromadora Sp"
Sample_24$Species <- "Euchromadora Sp"
Sample_25$Species <- "Euchromadora Sp"
Sample_26$Species <- "Dichromadora Sp"
Sample_27$Species <- "Chromadorella Sp1"

DADA2Files <- grep("Sample", names(.GlobalEnv), value=TRUE)
List_DADA2Files<-do.call("list",mget(DADA2Files))

for(i in DADA2Files){
  List_DADA2Files[[i]]["Method"] <- "DADA2"
}

DF_DADA2 <- bind_rows(List_DADA2Files, .id = "ImportSample")

### Import DADA2 Nem Samples ###
### First Change working Directory ### 
setwd("../VSearch_SeparatedSample/")

Sample_01 <- read.table("nem18.tsv", sep = "\t", header = T)
Sample_02 <- read.table("nem21.tsv", sep = "\t", header = T)
Sample_03 <- read.table("nem30.tsv", sep = "\t", header = T)
Sample_04 <- read.table("nem39.tsv", sep = "\t", header = T)
Sample_05 <- read.table("nem47.tsv", sep = "\t", header = T)
Sample_06 <- read.table("nem48.tsv", sep = "\t", header = T)
Sample_07 <- read.table("nem68.tsv", sep = "\t", header = T)
Sample_08 <- read.table("nem91.tsv", sep = "\t", header = T)
Sample_09 <- read.table("nem94.tsv", sep = "\t", header = T)
Sample_10 <- read.table("nem141.tsv", sep = "\t", header = T)
Sample_11 <- read.table("nem142.tsv", sep = "\t", header = T)
Sample_12 <- read.table("nem145.tsv", sep = "\t", header = T)
Sample_13 <- read.table("nem146.tsv", sep = "\t", header = T)
Sample_14 <- read.table("nem149.tsv", sep = "\t", header = T)
Sample_15 <- read.table("nem154.tsv", sep = "\t", header = T)
Sample_16 <- read.table("nem160.tsv", sep = "\t", header = T)
Sample_17 <- read.table("nem165.tsv", sep = "\t", header = T)
Sample_18 <- read.table("nem166.tsv", sep = "\t", header = T)
Sample_19 <- read.table("nem178.tsv", sep = "\t", header = T)
Sample_20 <- read.table("nem189.tsv", sep = "\t", header = T)
Sample_21 <- read.table("nem200.tsv", sep = "\t", header = T)
Sample_22 <- read.table("nem201.tsv", sep = "\t", header = T)
Sample_23 <- read.table("nem206.tsv", sep = "\t", header = T)
Sample_24 <- read.table("nem208.tsv", sep = "\t", header = T)
Sample_25 <- read.table("nem212.tsv", sep = "\t", header = T)
Sample_26 <- read.table("nem228.tsv", sep = "\t", header = T)
Sample_27 <- read.table("nem287.tsv", sep = "\t", header = T)

### Add Species Column to each Sample ###
Sample_01$Species <- "Dichromadora Sp"
Sample_02$Species <- "Dichromadora Sp"
Sample_03$Species <- "Dichromadora Sp"
Sample_04$Species <- "Dichromadora Sp"
Sample_05$Species <- "Dichromadora Sp"
Sample_06$Species <- "Dichromadora Sp"
Sample_07$Species <- "Dichromadora Sp"
Sample_08$Species <- "Neochromadora Sp"
Sample_09$Species <- "Chromadoridae Sp1"
Sample_10$Species <- "Dichromadora Sp"
Sample_11$Species <- "Dichromadora Sp"
Sample_12$Species <- "Dichromadora Sp"
Sample_13$Species <- "Dichromadora Sp"
Sample_14$Species <- "Dichromadora Sp"
Sample_15$Species <- "Dichromadora Sp"
Sample_16$Species <- "Chromadoridae Sp2"
Sample_17$Species <- "Dichromadora Sp"
Sample_18$Species <- "Chromadoridae Sp5"
Sample_19$Species <- "Chromadoridae Sp4"
Sample_20$Species <- "Chromadorella Sp3"
Sample_21$Species <- "Chromadoridae Sp3"
Sample_22$Species <- "Chromadorella Sp2"
Sample_23$Species <- "Euchromadora Sp"
Sample_24$Species <- "Euchromadora Sp"
Sample_25$Species <- "Euchromadora Sp"
Sample_26$Species <- "Dichromadora Sp"
Sample_27$Species <- "Chromadorella Sp1"

VSearchFiles <- grep("Sample", names(.GlobalEnv), value=TRUE)
List_VSearchFiles<-do.call("list",mget(VSearchFiles))

for(i in VSearchFiles){
  List_VSearchFiles[[i]]["Method"] <- "VSearch"
}

DF_VSearch <- bind_rows(List_VSearchFiles, .id = "ImportSample")

### Combine Seq and Sample into One Column ###
DF_DADA2$SequenceSamples <- paste(DF_DADA2$Seqs, DF_DADA2$Sample)
DF_VSearch$SequenceSamples <- paste(DF_VSearch$Seqs, DF_VSearch$Sample)

### Round Relative Abundance ###
DF_DADA2$RelAbundance <- round(DF_DADA2$RelAbundance)
DF_VSearch$RelAbundance <- round(DF_VSearch$RelAbundance)

### Merge Table and Remove NAs ###
DADA2_Final <- subset(DF_DADA2, select = c(NewName, RelAbundance, Species, Method, SequenceSamples, Sample))
names(DADA2_Final) <- c("ASV", "DADA2_Abundance", "Species", "DADA2_Method", "SequenceSamples", "Sample")
VSearch_Final <- subset(DF_VSearch, select = c(NewName, RelAbundance, Species, Method, SequenceSamples, Sample))
names(VSearch_Final) <- c("OTU", "VSearch_Abundance", "Species", "VSearch_Method", "SequenceSamples", "Sample")

Final_DF <- merge(DADA2_Final, VSearch_Final, by.x = c("SequenceSamples"), by.y = c("SequenceSamples"), all.x = T, all.y = T)
Final_DF <- as.data.frame(na.omit(Final_DF))

### Species labels with Italicized specise name ###
species_labels <- c(expression(paste(italic("Chromadorella "),"sp1")),
                    expression(paste(italic("Chromadorella "),"sp2")),
                    expression(paste(italic("Chromadorella "),"sp3")),
                    "Chromadoridae sp1", "Chromadoridae sp2", "Chromadoridae sp3", "Chromadoridae sp4", "Chromadoridae sp5", 
                    expression(paste(italic("Dichromadora "),"sp")),
                    expression(paste(italic("Euchromadora "), "sp")))

### Plot using GGPLOT ### 
PLOT_Chromadoridae <- Final_DF %>% ggplot() +
  geom_segment(aes(x= 1, xend= 2, y=VSearch_Abundance, yend=DADA2_Abundance, col=factor(Species.x)), size=0.75, show.legend = T) +
  geom_point(aes(x = 1, y = VSearch_Abundance), size = 2, col = "grey30") +
  geom_point(aes(x = 2, y = DADA2_Abundance), size = 2, col = "grey30") +
  geom_text(aes(label = paste0(VSearch_Abundance, "%"), y = VSearch_Abundance, x = 1 - 0.1), check_overlap = T, size = 3) +
  geom_text(aes(label = paste0(DADA2_Abundance, "%"), y = DADA2_Abundance, x = 2 + 0.1), check_overlap = T, size = 3) +
  geom_vline(xintercept=1, linetype="twodash", size=.5) + 
  scale_color_manual(labels = species_labels,
    values=c('#e6194b', '#3cb44b', '#ffe119', '#4363d8', '#f58231', '#911eb4', '#46f0f0', '#f032e6', '#bcf60c', '#fabebe', '#008080', '#e6beff', '#9a6324', '#fffac8', '#800000', '#aaffc3', '#808000', '#ffd8b1', '#000075', '#808080', '#ffffff', '#000000')) +
  geom_vline(xintercept=2, linetype="twodash", size=.5) +
  geom_text(label="VSearch", x=1, y=-2, hjust=-0.2, size=4, check_overlap = T) +
  geom_text(label="DADA2", x=2, y=-2, hjust=1.2, size=4, check_overlap = T) +
  ylim(1,100) + labs(color='Species') 

PLOT_Chromadoridae <- PLOT_Chromadoridae + theme(panel.background = element_blank(),  panel.grid = element_blank(), axis.ticks = element_blank(), legend.text.align = 0,
                                                                          axis.text = element_blank(), axis.title = element_blank(), panel.border = element_blank(), plot.margin = unit(c(1,0.5,1,1), "cm"),
                                                                          plot.title = element_text(hjust = 0.5), legend.key = element_rect(fill = "transparent", colour = "transparent"), legend.title.align = 0.5)
PLOT_Chromadoridae

### Save File ###
ggsave("../Comparing_OTUs_ASVs/Chromadoridae_OTU_Corresponding_ASV.tiff", width = 16, height = 10, dpi = 300)


