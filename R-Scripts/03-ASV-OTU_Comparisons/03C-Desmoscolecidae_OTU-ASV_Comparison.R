library(ggplot2)
library(scales)
library(dplyr)
library(tidyr)

### Import DADA2 Nem Samples ###
### First Change working Directory ### 
setwd("../DADA_SeparatedSample/")

Sample_01 <- read.table("nem28.tsv", sep = "\t", header = T)
Sample_02 <- read.table("nem31.tsv", sep = "\t", header = T)
Sample_03 <- read.table("nem35.tsv", sep = "\t", header = T)
Sample_04 <- read.table("nem43.tsv", sep = "\t", header = T)
Sample_05 <- read.table("nem44.tsv", sep = "\t", header = T)
Sample_06 <- read.table("nem45.tsv", sep = "\t", header = T)
Sample_07 <- read.table("nem46.tsv", sep = "\t", header = T)
Sample_08 <- read.table("nem50.tsv", sep = "\t", header = T)
Sample_09 <- read.table("nem84.tsv", sep = "\t", header = T)
Sample_10 <- read.table("nem85.tsv", sep = "\t", header = T)
Sample_11 <- read.table("nem86.tsv", sep = "\t", header = T)
Sample_12 <- read.table("nem87.tsv", sep = "\t", header = T)
Sample_13 <- read.table("nem88.tsv", sep = "\t", header = T)
Sample_14 <- read.table("nem103.tsv", sep = "\t", header = T)
Sample_15 <- read.table("nem136.tsv", sep = "\t", header = T)
Sample_16 <- read.table("nem196.tsv", sep = "\t", header = T)
Sample_17 <- read.table("nem234.tsv", sep = "\t", header = T)
Sample_18 <- read.table("nem235.tsv", sep = "\t", header = T)
Sample_19 <- read.table("nem244.tsv", sep = "\t", header = T)
Sample_20 <- read.table("nem245.tsv", sep = "\t", header = T)
Sample_21 <- read.table("nem249.tsv", sep = "\t", header = T)
Sample_22 <- read.table("nem254.tsv", sep = "\t", header = T)
Sample_23 <- read.table("nem256.tsv", sep = "\t", header = T)
Sample_24 <- read.table("nem257.tsv", sep = "\t", header = T)
Sample_25 <- read.table("nem273.tsv", sep = "\t", header = T)
Sample_26 <- read.table("nem277.tsv", sep = "\t", header = T)
Sample_27 <- read.table("nem279.tsv", sep = "\t", header = T)
Sample_28 <- read.table("nem282.tsv", sep = "\t", header = T)
Sample_29 <- read.table("nem283.tsv", sep = "\t", header = T)
Sample_30 <- read.table("nem291.tsv", sep = "\t", header = T)

### Add Species Column to each Sample ###
Sample_01$Species <- "Desmoscolex Sp9"
Sample_02$Species <- "Desmoscolex Sp3"
Sample_03$Species <- "Desmoscolex Sp9"
Sample_04$Species <- "Desmoscolex Sp12"
Sample_05$Species <- "Desmoscolex Sp3"
Sample_06$Species <- "Desmoscolex Sp1"
Sample_07$Species <- "Desmoscolex Sp11"
Sample_08$Species <- "Desmoscolex Sp9"
Sample_09$Species <- "Desmoscolex Sp11"
Sample_10$Species <- "Desmoscolex Sp11"
Sample_11$Species <- "Desmoscolex Sp8"
Sample_12$Species <- "Desmoscolex Sp5"
Sample_13$Species <- "Desmoscolex Sp5"
Sample_14$Species <- "Desmoscolex Sp2"
Sample_15$Species <- "Desmoscolex Sp6"
Sample_16$Species <- "Desmoscolex Sp10"
Sample_17$Species <- "Desmoscolex Sp9"
Sample_18$Species <- "Desmoscolex Sp3"
Sample_19$Species <- "Desmoscolex Sp4"
Sample_20$Species <- "Desmoscolex Sp11"
Sample_21$Species <- "Desmoscolex Sp9"
Sample_22$Species <- "Desmoscolex Sp4"
Sample_23$Species <- "Desmoscolex Sp9"
Sample_24$Species <- "Desmoscolex Sp7"
Sample_25$Species <- "Desmoscolex Sp11"
Sample_26$Species <- "Desmoscolex Sp11"
Sample_27$Species <- "Desmoscolex Sp11"
Sample_28$Species <- "Desmoscolex Sp11"
Sample_29$Species <- "Desmoscolex Sp11"
Sample_30$Species <- "Desmoscolex Sp5"

DADA2Files <- grep("Sample", names(.GlobalEnv), value=TRUE)
List_DADA2Files<-do.call("list",mget(DADA2Files))

for(i in DADA2Files){
  List_DADA2Files[[i]]["Method"] <- "DADA2"
}

DF_DADA2 <- bind_rows(List_DADA2Files, .id = "ImportSample")

### Import DADA2 Nem Samples ###
### First Change working Directory ### 
setwd("../VSearch_SeparatedSample/")

Sample_01 <- read.table("nem28.tsv", sep = "\t", header = T)
Sample_02 <- read.table("nem31.tsv", sep = "\t", header = T)
Sample_03 <- read.table("nem35.tsv", sep = "\t", header = T)
Sample_04 <- read.table("nem43.tsv", sep = "\t", header = T)
Sample_05 <- read.table("nem44.tsv", sep = "\t", header = T)
Sample_06 <- read.table("nem45.tsv", sep = "\t", header = T)
Sample_07 <- read.table("nem46.tsv", sep = "\t", header = T)
Sample_08 <- read.table("nem50.tsv", sep = "\t", header = T)
Sample_09 <- read.table("nem84.tsv", sep = "\t", header = T)
Sample_10 <- read.table("nem85.tsv", sep = "\t", header = T)
Sample_11 <- read.table("nem86.tsv", sep = "\t", header = T)
Sample_12 <- read.table("nem87.tsv", sep = "\t", header = T)
Sample_13 <- read.table("nem88.tsv", sep = "\t", header = T)
Sample_14 <- read.table("nem103.tsv", sep = "\t", header = T)
Sample_15 <- read.table("nem136.tsv", sep = "\t", header = T)
Sample_16 <- read.table("nem196.tsv", sep = "\t", header = T)
Sample_17 <- read.table("nem234.tsv", sep = "\t", header = T)
Sample_18 <- read.table("nem235.tsv", sep = "\t", header = T)
Sample_19 <- read.table("nem244.tsv", sep = "\t", header = T)
Sample_20 <- read.table("nem245.tsv", sep = "\t", header = T)
Sample_21 <- read.table("nem249.tsv", sep = "\t", header = T)
Sample_22 <- read.table("nem254.tsv", sep = "\t", header = T)
Sample_23 <- read.table("nem256.tsv", sep = "\t", header = T)
Sample_24 <- read.table("nem257.tsv", sep = "\t", header = T)
Sample_25 <- read.table("nem273.tsv", sep = "\t", header = T)
Sample_26 <- read.table("nem277.tsv", sep = "\t", header = T)
Sample_27 <- read.table("nem279.tsv", sep = "\t", header = T)
Sample_28 <- read.table("nem282.tsv", sep = "\t", header = T)
Sample_29 <- read.table("nem283.tsv", sep = "\t", header = T)
Sample_30 <- read.table("nem291.tsv", sep = "\t", header = T)

### Add Species Column to each Sample ###
Sample_01$Species <- "Desmoscolex Sp9"
Sample_02$Species <- "Desmoscolex Sp3"
Sample_03$Species <- "Desmoscolex Sp9"
Sample_04$Species <- "Desmoscolex Sp12"
Sample_05$Species <- "Desmoscolex Sp3"
Sample_06$Species <- "Desmoscolex Sp1"
Sample_07$Species <- "Desmoscolex Sp11"
Sample_08$Species <- "Desmoscolex Sp9"
Sample_09$Species <- "Desmoscolex Sp11"
Sample_10$Species <- "Desmoscolex Sp11"
Sample_11$Species <- "Desmoscolex Sp8"
Sample_12$Species <- "Desmoscolex Sp5"
Sample_13$Species <- "Desmoscolex Sp5"
Sample_14$Species <- "Desmoscolex Sp2"
Sample_15$Species <- "Desmoscolex Sp6"
Sample_16$Species <- "Desmoscolex Sp10"
Sample_17$Species <- "Desmoscolex Sp9"
Sample_18$Species <- "Desmoscolex Sp3"
Sample_19$Species <- "Desmoscolex Sp4"
Sample_20$Species <- "Desmoscolex Sp11"
Sample_21$Species <- "Desmoscolex Sp9"
Sample_22$Species <- "Desmoscolex Sp4"
Sample_23$Species <- "Desmoscolex Sp9"
Sample_24$Species <- "Desmoscolex Sp7"
Sample_25$Species <- "Desmoscolex Sp11"
Sample_26$Species <- "Desmoscolex Sp11"
Sample_27$Species <- "Desmoscolex Sp11"
Sample_28$Species <- "Desmoscolex Sp11"
Sample_29$Species <- "Desmoscolex Sp11"
Sample_30$Species <- "Desmoscolex Sp5"


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
species_labels <- c(expression(paste(italic("Desmoscolex "),"sp1")),
                    expression(paste(italic("Desmoscolex "),"sp10")),
                    expression(paste(italic("Desmoscolex "),"sp11")),
                    expression(paste(italic("Desmoscolex "),"sp12")),
                    expression(paste(italic("Desmoscolex "),"sp2")),
                    expression(paste(italic("Desmoscolex "),"sp3")),
                    expression(paste(italic("Desmoscolex "),"sp4")),
                    expression(paste(italic("Desmoscolex "),"sp5")),
                    expression(paste(italic("Desmoscolex "),"sp6")),
                    expression(paste(italic("Desmoscolex "),"sp7")),
                    expression(paste(italic("Desmoscolex "),"sp8")),
                    expression(paste(italic("Desmoscolex "),"sp9")))

### Plot using GGPLOT ### 
PLOT_Desmoscolecidae <- Final_DF %>% ggplot() +
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

PLOT_Desmoscolecidae <- PLOT_Desmoscolecidae + theme(panel.background = element_blank(),  panel.grid = element_blank(), axis.ticks = element_blank(), legend.text.align = 0,
                                                     axis.text = element_blank(), axis.title = element_blank(), panel.border = element_blank(), plot.margin = unit(c(1,0.5,1,1), "cm"),
                                                     plot.title = element_text(hjust = 0.5), legend.key = element_rect(fill = "transparent", colour = "transparent"), legend.title.align = 0.5)
PLOT_Desmoscolecidae

ggsave("../Comparing_OTUs_ASVs/Desmoscolecidae_OTU_Corresponding_ASV.tiff", width = 16, height = 10, dpi = 300)


