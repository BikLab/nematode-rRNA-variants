library(ggplot2)
library(scales)
library(dplyr)
library(tidyr)

### Import DADA2 Nem Samples ###
### First Change working Directory ### 
setwd("../DADA_SeparatedSample/")

Sample_01 <- read.table("nem59.tsv", sep = "\t", header = T)
Sample_02 <- read.table("nem71.tsv", sep = "\t", header = T)
Sample_03 <- read.table("nem73.tsv", sep = "\t", header = T)
Sample_04 <- read.table("nem75.tsv", sep = "\t", header = T)
Sample_05 <- read.table("nem117.tsv", sep = "\t", header = T)
Sample_06 <- read.table("nem152.tsv", sep = "\t", header = T)
Sample_07 <- read.table("nem163.tsv", sep = "\t", header = T)
Sample_08 <- read.table("nem192.tsv", sep = "\t", header = T)
Sample_09 <- read.table("nem290.tsv", sep = "\t", header = T)
Sample_10 <- read.table("nem40.tsv", sep = "\t", header = T)
Sample_11 <- read.table("nem54.tsv", sep = "\t", header = T)
Sample_12 <- read.table("nem64.tsv", sep = "\t", header = T)
Sample_13 <- read.table("nem143.tsv", sep = "\t", header = T)
Sample_14 <- read.table("nem150.tsv", sep = "\t", header = T)
Sample_15 <- read.table("nem151.tsv", sep = "\t", header = T)
Sample_16 <- read.table("nem155.tsv", sep = "\t", header = T)
Sample_17 <- read.table("nem164.tsv", sep = "\t", header = T)
Sample_18 <- read.table("nem174.tsv", sep = "\t", header = T)
Sample_19 <- read.table("nem193.tsv", sep = "\t", header = T)
Sample_20 <- read.table("nem219.tsv", sep = "\t", header = T)
Sample_21 <- read.table("nem220.tsv", sep = "\t", header = T)
Sample_22 <- read.table("nem225.tsv", sep = "\t", header = T)
Sample_23 <- read.table("nem26.tsv", sep = "\t", header = T)
Sample_24 <- read.table("nem32.tsv", sep = "\t", header = T)
Sample_25 <- read.table("nem65.tsv", sep = "\t", header = T)
Sample_26 <- read.table("nem66.tsv", sep = "\t", header = T)
Sample_27 <- read.table("nem67.tsv", sep = "\t", header = T)
Sample_28 <- read.table("nem69.tsv", sep = "\t", header = T)
Sample_29 <- read.table("nem70.tsv", sep = "\t", header = T)
Sample_30 <- read.table("nem72.tsv", sep = "\t", header = T)
Sample_31 <- read.table("nem74.tsv", sep = "\t", header = T)
Sample_32 <- read.table("nem78.tsv", sep = "\t", header = T)
Sample_33 <- read.table("nem79.tsv", sep = "\t", header = T)
Sample_34 <- read.table("nem111.tsv", sep = "\t", header = T)
Sample_35 <- read.table("nem144.tsv", sep = "\t", header = T)
Sample_36 <- read.table("nem159.tsv", sep = "\t", header = T)
Sample_37 <- read.table("nem177.tsv", sep = "\t", header = T)
Sample_38 <- read.table("nem191.tsv", sep = "\t", header = T)
Sample_39 <- read.table("nem217.tsv", sep = "\t", header = T)
Sample_40 <- read.table("nem221.tsv", sep = "\t", header = T)
Sample_41 <- read.table("nem222.tsv", sep = "\t", header = T)
Sample_42 <- read.table("nem224.tsv", sep = "\t", header = T)
Sample_43 <- read.table("nem232.tsv", sep = "\t", header = T)
Sample_44 <- read.table("nem239.tsv", sep = "\t", header = T)
Sample_45 <- read.table("nem264.tsv", sep = "\t", header = T)
Sample_46 <- read.table("nem265.tsv", sep = "\t", header = T)
Sample_47 <- read.table("nem267.tsv", sep = "\t", header = T)
Sample_48 <- read.table("nem285.tsv", sep = "\t", header = T)
Sample_49 <- read.table("nem51.tsv", sep = "\t", header = T)
Sample_50 <- read.table("nem56.tsv", sep = "\t", header = T)
Sample_51 <- read.table("nem187.tsv", sep = "\t", header = T)
Sample_52 <- read.table("nem195.tsv", sep = "\t", header = T)


### Add Species Column to each Sample ###
Sample_01$Species <- "Comesomatidae Sp3"
Sample_02$Species <- "Comesomatidae Sp3"
Sample_03$Species <- "Comesomatidae Sp3"
Sample_04$Species <- "Comesomatidae Sp3"
Sample_05$Species <- "Comesomatidae Sp1"
Sample_06$Species <- "Comesomatidae Sp2"
Sample_07$Species <- "Comesomatidae Sp2"
Sample_08$Species <- "Comesomatidae Sp2"
Sample_09$Species <- "Comesomatidae Sp4"
Sample_10$Species <- "Cervonema Sp1"
Sample_11$Species <- "Cervonema Sp2"
Sample_12$Species <- "Cervonema Sp2"
Sample_13$Species <- "Cervonema Sp2"
Sample_14$Species <- "Cervonema Sp2"
Sample_15$Species <- "Cervonema Sp2"
Sample_16$Species <- "Cervonema Sp2"
Sample_17$Species <- "Cervonema Sp2"
Sample_18$Species <- "Cervonema Sp2"
Sample_19$Species <- "Cervonema Sp2"
Sample_20$Species <- "Cervonema Sp2"
Sample_21$Species <- "Cervonema Sp2"
Sample_22$Species <- "Cervonema Sp2"
Sample_23$Species <- "Sabatieria Sp4"
Sample_24$Species <- "Sabatieria Sp4"
Sample_25$Species <- "Sabatieria Sp5"
Sample_26$Species <- "Sabatieria Sp4"
Sample_27$Species <- "Sabatieria Sp5"
Sample_28$Species <- "Sabatieria Sp5"
Sample_29$Species <- "Sabatieria Sp5"
Sample_30$Species <- "Sabatieria Sp5"
Sample_31$Species <- "Sabatieria Sp5"
Sample_32$Species <- "Sabatieria Sp5"
Sample_33$Species <- "Sabatieria Sp5"
Sample_34$Species <- "Sabatieria Sp5"
Sample_35$Species <- "Sabatieria Sp5"
Sample_36$Species <- "Sabatieria Sp1"
Sample_37$Species <- "Sabatieria Sp1"
Sample_38$Species <- "Sabatieria Sp3"
Sample_39$Species <- "Sabatieria Sp4"
Sample_40$Species <- "Sabatieria Sp2"
Sample_41$Species <- "Sabatieria Sp2"
Sample_42$Species <- "Sabatieria Sp2"
Sample_43$Species <- "Sabatieria Sp4"
Sample_44$Species <- "Sabatieria Sp4"
Sample_45$Species <- "Sabatieria Sp5"
Sample_46$Species <- "Sabatieria Sp5"
Sample_47$Species <- "Sabatieria Sp5"
Sample_48$Species <- "Sabatieria Sp5"
Sample_49$Species <- "SetoSabatieria Sp"
Sample_50$Species <- "SetoSabatieria Sp"
Sample_51$Species <- "SetoSabatieria Sp"
Sample_52$Species <- "SetoSabatieria Sp"

DADA2Files <- grep("Sample", names(.GlobalEnv), value=TRUE)
List_DADA2Files<-do.call("list",mget(DADA2Files))

for(i in DADA2Files){
  List_DADA2Files[[i]]["Method"] <- "DADA2"
}

DF_DADA2 <- bind_rows(List_DADA2Files, .id = "ImportSample")

### Import DADA2 Nem Samples ###
### First Change working Directory ### 
setwd("../VSearch_SeparatedSample/")

Sample_01 <- read.table("nem59.tsv", sep = "\t", header = T)
Sample_02 <- read.table("nem71.tsv", sep = "\t", header = T)
Sample_03 <- read.table("nem73.tsv", sep = "\t", header = T)
Sample_04 <- read.table("nem75.tsv", sep = "\t", header = T)
Sample_05 <- read.table("nem117.tsv", sep = "\t", header = T)
Sample_06 <- read.table("nem152.tsv", sep = "\t", header = T)
Sample_07 <- read.table("nem163.tsv", sep = "\t", header = T)
Sample_08 <- read.table("nem192.tsv", sep = "\t", header = T)
Sample_09 <- read.table("nem290.tsv", sep = "\t", header = T)
Sample_10 <- read.table("nem40.tsv", sep = "\t", header = T)
Sample_11 <- read.table("nem54.tsv", sep = "\t", header = T)
Sample_12 <- read.table("nem64.tsv", sep = "\t", header = T)
Sample_13 <- read.table("nem143.tsv", sep = "\t", header = T)
Sample_14 <- read.table("nem150.tsv", sep = "\t", header = T)
Sample_15 <- read.table("nem151.tsv", sep = "\t", header = T)
Sample_16 <- read.table("nem155.tsv", sep = "\t", header = T)
Sample_17 <- read.table("nem164.tsv", sep = "\t", header = T)
Sample_18 <- read.table("nem174.tsv", sep = "\t", header = T)
Sample_19 <- read.table("nem193.tsv", sep = "\t", header = T)
Sample_20 <- read.table("nem219.tsv", sep = "\t", header = T)
Sample_21 <- read.table("nem220.tsv", sep = "\t", header = T)
Sample_22 <- read.table("nem225.tsv", sep = "\t", header = T)
Sample_23 <- read.table("nem26.tsv", sep = "\t", header = T)
Sample_24 <- read.table("nem32.tsv", sep = "\t", header = T)
Sample_25 <- read.table("nem65.tsv", sep = "\t", header = T)
Sample_26 <- read.table("nem66.tsv", sep = "\t", header = T)
Sample_27 <- read.table("nem67.tsv", sep = "\t", header = T)
Sample_28 <- read.table("nem69.tsv", sep = "\t", header = T)
Sample_29 <- read.table("nem70.tsv", sep = "\t", header = T)
Sample_30 <- read.table("nem72.tsv", sep = "\t", header = T)
Sample_31 <- read.table("nem74.tsv", sep = "\t", header = T)
Sample_32 <- read.table("nem78.tsv", sep = "\t", header = T)
Sample_33 <- read.table("nem79.tsv", sep = "\t", header = T)
Sample_34 <- read.table("nem111.tsv", sep = "\t", header = T)
Sample_35 <- read.table("nem144.tsv", sep = "\t", header = T)
Sample_36 <- read.table("nem159.tsv", sep = "\t", header = T)
Sample_37 <- read.table("nem177.tsv", sep = "\t", header = T)
Sample_38 <- read.table("nem191.tsv", sep = "\t", header = T)
Sample_39 <- read.table("nem217.tsv", sep = "\t", header = T)
Sample_40 <- read.table("nem221.tsv", sep = "\t", header = T)
Sample_41 <- read.table("nem222.tsv", sep = "\t", header = T)
Sample_42 <- read.table("nem224.tsv", sep = "\t", header = T)
Sample_43 <- read.table("nem232.tsv", sep = "\t", header = T)
Sample_44 <- read.table("nem239.tsv", sep = "\t", header = T)
Sample_45 <- read.table("nem264.tsv", sep = "\t", header = T)
Sample_46 <- read.table("nem265.tsv", sep = "\t", header = T)
Sample_47 <- read.table("nem267.tsv", sep = "\t", header = T)
Sample_48 <- read.table("nem285.tsv", sep = "\t", header = T)
Sample_49 <- read.table("nem51.tsv", sep = "\t", header = T)
Sample_50 <- read.table("nem56.tsv", sep = "\t", header = T)
Sample_51 <- read.table("nem187.tsv", sep = "\t", header = T)
Sample_52 <- read.table("nem195.tsv", sep = "\t", header = T)


### Add Species Column to each Sample ###
Sample_01$Species <- "Comesomatidae Sp3"
Sample_02$Species <- "Comesomatidae Sp3"
Sample_03$Species <- "Comesomatidae Sp3"
Sample_04$Species <- "Comesomatidae Sp3"
Sample_05$Species <- "Comesomatidae Sp1"
Sample_06$Species <- "Comesomatidae Sp2"
Sample_07$Species <- "Comesomatidae Sp2"
Sample_08$Species <- "Comesomatidae Sp2"
Sample_09$Species <- "Comesomatidae Sp4"
Sample_10$Species <- "Cervonema Sp1"
Sample_11$Species <- "Cervonema Sp2"
Sample_12$Species <- "Cervonema Sp2"
Sample_13$Species <- "Cervonema Sp2"
Sample_14$Species <- "Cervonema Sp2"
Sample_15$Species <- "Cervonema Sp2"
Sample_16$Species <- "Cervonema Sp2"
Sample_17$Species <- "Cervonema Sp2"
Sample_18$Species <- "Cervonema Sp2"
Sample_19$Species <- "Cervonema Sp2"
Sample_20$Species <- "Cervonema Sp2"
Sample_21$Species <- "Cervonema Sp2"
Sample_22$Species <- "Cervonema Sp2"
Sample_23$Species <- "Sabatieria Sp4"
Sample_24$Species <- "Sabatieria Sp4"
Sample_25$Species <- "Sabatieria Sp5"
Sample_26$Species <- "Sabatieria Sp4"
Sample_27$Species <- "Sabatieria Sp5"
Sample_28$Species <- "Sabatieria Sp5"
Sample_29$Species <- "Sabatieria Sp5"
Sample_30$Species <- "Sabatieria Sp5"
Sample_31$Species <- "Sabatieria Sp5"
Sample_32$Species <- "Sabatieria Sp5"
Sample_33$Species <- "Sabatieria Sp5"
Sample_34$Species <- "Sabatieria Sp5"
Sample_35$Species <- "Sabatieria Sp5"
Sample_36$Species <- "Sabatieria Sp1"
Sample_37$Species <- "Sabatieria Sp1"
Sample_38$Species <- "Sabatieria Sp3"
Sample_39$Species <- "Sabatieria Sp4"
Sample_40$Species <- "Sabatieria Sp2"
Sample_41$Species <- "Sabatieria Sp2"
Sample_42$Species <- "Sabatieria Sp2"
Sample_43$Species <- "Sabatieria Sp4"
Sample_44$Species <- "Sabatieria Sp4"
Sample_45$Species <- "Sabatieria Sp5"
Sample_46$Species <- "Sabatieria Sp5"
Sample_47$Species <- "Sabatieria Sp5"
Sample_48$Species <- "Sabatieria Sp5"
Sample_49$Species <- "SetoSabatieria Sp"
Sample_50$Species <- "SetoSabatieria Sp"
Sample_51$Species <- "SetoSabatieria Sp"
Sample_52$Species <- "SetoSabatieria Sp"

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
species_labels <- c(expression(paste(italic("Cervonema "),"sp1")),
                    expression(paste(italic("Cervonema "),"sp2")),
                    "Comesomatidae sp1", "Comesomatidae sp2", "Comesomatidae sp3", "Comesomatidae sp4",
                    expression(paste(italic("Sabatieria "),"sp1")),
                    expression(paste(italic("Sabatieria "),"sp2")),
                    expression(paste(italic("Sabatieria "),"sp3")),
                    expression(paste(italic("Sabatieria "),"sp4")),
                    expression(paste(italic("Sabatieria "),"sp5")),
                    expression(paste(italic("Setosabatieria "),"sp")))
                    
### Plot using GGPLOT ### 
PLOT_Comesomatidae <- Final_DF %>% ggplot() +
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

PLOT_Comesomatidae <- PLOT_Comesomatidae + theme(panel.background = element_blank(),  panel.grid = element_blank(), axis.ticks = element_blank(), legend.text.align = 0,
                                                 axis.text = element_blank(), axis.title = element_blank(), panel.border = element_blank(), plot.margin = unit(c(1,0.5,1,1), "cm"),
                                                 plot.title = element_text(hjust = 0.5), legend.key = element_rect(fill = "transparent", colour = "transparent"), legend.title.align = 0.5)
PLOT_Comesomatidae

### Save File ###
ggsave("../Comparing_OTUs_ASVs/Comesomatidae_OTU_Corresponding_ASV.tiff", width = 16, height = 10, dpi = 300)


