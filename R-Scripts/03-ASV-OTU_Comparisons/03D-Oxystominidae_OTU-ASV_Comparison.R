library(ggplot2)
library(scales)
library(dplyr)
library(tidyr)

### Import DADA2 Nem Samples ###
### First Change working Directory ### 
setwd("../DADA_SeparatedSample/")

Sample_01 <- read.table("nem27.tsv", sep = "\t", header = T)
Sample_02 <- read.table("nem194.tsv", sep = "\t", header = T)
Sample_03 <- read.table("nem280.tsv", sep = "\t", header = T)
Sample_04 <- read.table("nem22.tsv", sep = "\t", header = T)
Sample_05 <- read.table("nem41.tsv", sep = "\t", header = T)
Sample_06 <- read.table("nem52.tsv", sep = "\t", header = T)
Sample_07 <- read.table("nem55.tsv", sep = "\t", header = T)
Sample_08 <- read.table("nem157.tsv", sep = "\t", header = T)
Sample_09 <- read.table("nem172.tsv", sep = "\t", header = T)
Sample_10 <- read.table("nem215.tsv", sep = "\t", header = T)
Sample_11 <- read.table("nem229.tsv", sep = "\t", header = T)
Sample_12 <- read.table("nem233.tsv", sep = "\t", header = T)
Sample_13 <- read.table("nem237.tsv", sep = "\t", header = T)
Sample_14 <- read.table("nem240.tsv", sep = "\t", header = T)
Sample_15 <- read.table("nem243.tsv", sep = "\t", header = T)
Sample_16 <- read.table("nem246.tsv", sep = "\t", header = T)
Sample_17 <- read.table("nem258.tsv", sep = "\t", header = T)
Sample_18 <- read.table("nem271.tsv", sep = "\t", header = T)
Sample_19 <- read.table("nem286.tsv", sep = "\t", header = T)
Sample_20 <- read.table("nem288.tsv", sep = "\t", header = T)
Sample_21 <- read.table("nem116.tsv", sep = "\t", header = T)
Sample_22 <- read.table("nem76.tsv", sep = "\t", header = T)
Sample_23 <- read.table("nem81.tsv", sep = "\t", header = T)
Sample_24 <- read.table("nem19.tsv", sep = "\t", header = T)
Sample_25 <- read.table("nem25.tsv", sep = "\t", header = T)
Sample_26 <- read.table("nem33.tsv", sep = "\t", header = T)
Sample_27 <- read.table("nem37.tsv", sep = "\t", header = T)
Sample_28 <- read.table("nem238.tsv", sep = "\t", header = T)
Sample_29 <- read.table("nem242.tsv", sep = "\t", header = T)

### Add Species Column to each Sample ###
Sample_01$Species <- "Oxystominidae Sp1"
Sample_02$Species <- "Oxystominidae Sp2"
Sample_03$Species <- "Oxystominidae Sp3"
Sample_04$Species <- "Halalaimus Sp5"
Sample_05$Species <- "Halalaimus Sp5"
Sample_06$Species <- "Halalaimus Sp3"
Sample_07$Species <- "Halalaimus Sp8"
Sample_08$Species <- "Halalaimus Sp2"
Sample_09$Species <- "Halalaimus Sp4"
Sample_10$Species <- "Halalaimus Sp6"
Sample_11$Species <- "Halalaimus Sp7"
Sample_12$Species <- "Halalaimus Sp5"
Sample_13$Species <- "Halalaimus Sp6"
Sample_14$Species <- "Halalaimus Sp4"
Sample_15$Species <- "Halalaimus Sp8"
Sample_16$Species <- "Halalaimus Sp5"
Sample_17$Species <- "Halalaimus Sp8"
Sample_18$Species <- "Halalaimus Sp1"
Sample_19$Species <- "Halalaimus Sp4"
Sample_20$Species <- "Halalaimus Sp4"
Sample_21$Species <- "Litinium Sp"
Sample_22$Species <- "Oxystomina Sp"
Sample_23$Species <- "Oxystomina Sp"
Sample_24$Species <- "Thalassoalaimus Sp1"
Sample_25$Species <- "Thalassoalaimus Sp2"
Sample_26$Species <- "Thalassoalaimus Sp2"
Sample_27$Species <- "Thalassoalaimus Sp2"
Sample_28$Species <- "Thalassoalaimus Sp2"
Sample_29$Species <- "Thalassoalaimus Sp2"

DADA2Files <- grep("Sample", names(.GlobalEnv), value=TRUE)
List_DADA2Files<-do.call("list",mget(DADA2Files))

for(i in DADA2Files){
  List_DADA2Files[[i]]["Method"] <- "DADA2"
}

DF_DADA2 <- bind_rows(List_DADA2Files, .id = "ImportSample")

### Import DADA2 Nem Samples ###
### First Change working Directory ### 
setwd("../VSearch_SeparatedSample/")

Sample_01 <- read.table("nem27.tsv", sep = "\t", header = T)
Sample_02 <- read.table("nem194.tsv", sep = "\t", header = T)
Sample_03 <- read.table("nem280.tsv", sep = "\t", header = T)
Sample_04 <- read.table("nem22.tsv", sep = "\t", header = T)
Sample_05 <- read.table("nem41.tsv", sep = "\t", header = T)
Sample_06 <- read.table("nem52.tsv", sep = "\t", header = T)
Sample_07 <- read.table("nem55.tsv", sep = "\t", header = T)
Sample_08 <- read.table("nem157.tsv", sep = "\t", header = T)
Sample_09 <- read.table("nem172.tsv", sep = "\t", header = T)
Sample_10 <- read.table("nem215.tsv", sep = "\t", header = T)
Sample_11 <- read.table("nem229.tsv", sep = "\t", header = T)
Sample_12 <- read.table("nem233.tsv", sep = "\t", header = T)
Sample_13 <- read.table("nem237.tsv", sep = "\t", header = T)
Sample_14 <- read.table("nem240.tsv", sep = "\t", header = T)
Sample_15 <- read.table("nem243.tsv", sep = "\t", header = T)
Sample_16 <- read.table("nem246.tsv", sep = "\t", header = T)
Sample_17 <- read.table("nem258.tsv", sep = "\t", header = T)
Sample_18 <- read.table("nem271.tsv", sep = "\t", header = T)
Sample_19 <- read.table("nem286.tsv", sep = "\t", header = T)
Sample_20 <- read.table("nem288.tsv", sep = "\t", header = T)
Sample_21 <- read.table("nem116.tsv", sep = "\t", header = T)
Sample_22 <- read.table("nem76.tsv", sep = "\t", header = T)
Sample_23 <- read.table("nem81.tsv", sep = "\t", header = T)
Sample_24 <- read.table("nem19.tsv", sep = "\t", header = T)
Sample_25 <- read.table("nem25.tsv", sep = "\t", header = T)
Sample_26 <- read.table("nem33.tsv", sep = "\t", header = T)
Sample_27 <- read.table("nem37.tsv", sep = "\t", header = T)
Sample_28 <- read.table("nem238.tsv", sep = "\t", header = T)
Sample_29 <- read.table("nem242.tsv", sep = "\t", header = T)

### Add Species Column to each Sample ###
Sample_01$Species <- "Oxystominidae Sp1"
Sample_02$Species <- "Oxystominidae Sp2"
Sample_03$Species <- "Oxystominidae Sp3"
Sample_04$Species <- "Halalaimus Sp5"
Sample_05$Species <- "Halalaimus Sp5"
Sample_06$Species <- "Halalaimus Sp3"
Sample_07$Species <- "Halalaimus Sp8"
Sample_08$Species <- "Halalaimus Sp2"
Sample_09$Species <- "Halalaimus Sp4"
Sample_10$Species <- "Halalaimus Sp6"
Sample_11$Species <- "Halalaimus Sp7"
Sample_12$Species <- "Halalaimus Sp5"
Sample_13$Species <- "Halalaimus Sp6"
Sample_14$Species <- "Halalaimus Sp4"
Sample_15$Species <- "Halalaimus Sp8"
Sample_16$Species <- "Halalaimus Sp5"
Sample_17$Species <- "Halalaimus Sp8"
Sample_18$Species <- "Halalaimus Sp1"
Sample_19$Species <- "Halalaimus Sp4"
Sample_20$Species <- "Halalaimus Sp4"
Sample_21$Species <- "Litinium Sp"
Sample_22$Species <- "Oxystomina Sp"
Sample_23$Species <- "Oxystomina Sp"
Sample_24$Species <- "Thalassoalaimus Sp1"
Sample_25$Species <- "Thalassoalaimus Sp2"
Sample_26$Species <- "Thalassoalaimus Sp2"
Sample_27$Species <- "Thalassoalaimus Sp2"
Sample_28$Species <- "Thalassoalaimus Sp2"
Sample_29$Species <- "Thalassoalaimus Sp2"


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

Final_DF <- merge(DF_VSearch, DF_DADA2, by.x = c("SequenceSamples"), by.y = c("SequenceSamples"), all.x = T, all.y = T)
Label_DF <- as.data.frame(na.omit(Final_DF))

Label_DF_left <- subset(Label_DF, select=c("NewName.x", "RelAbundance.x"))
Label_DF_left_Format <- as.data.frame(Label_DF_left %>% group_by(RelAbundance.x) %>% mutate(Order = seq_along(RelAbundance.x)) %>% spread(key = Order, value = NewName.x))

Label_DF_right <- subset(Label_DF, select=c("NewName.y", "RelAbundance.y"))
Label_DF_right_Format <- as.data.frame(Label_DF_right %>% group_by(RelAbundance.y) %>% mutate(Order = seq_along(RelAbundance.y)) %>% spread(key = Order, value = NewName.y))

Label_DF_left_Format$FinalLabel <- paste(Label_DF_left_Format$`1`, Label_DF_left_Format$`2`, Label_DF_left_Format$`3`, Label_DF_left_Format$`4`, Label_DF_left_Format$`5`, Label_DF_left_Format$`6`, sep = ", ")
Label_DF_left_Format$FinalLabel <- gsub("NA, ","",Label_DF_left_Format$FinalLabel) 
Label_DF_left_Format$FinalLabel <- gsub(", NA","",Label_DF_left_Format$FinalLabel)

Label_DF_right_Format$FinalLabel <- paste(Label_DF_right_Format$`1`, Label_DF_right_Format$`2`, Label_DF_right_Format$`3`, Label_DF_right_Format$`4`, Label_DF_right_Format$`5`, sep = ", ")
Label_DF_right_Format$FinalLabel <- gsub("NA, ","",Label_DF_right_Format$FinalLabel) 
Label_DF_right_Format$FinalLabel <- gsub(", NA","",Label_DF_right_Format$FinalLabel)

ab_left_label <- paste(Label_DF$RelAbundance.x, "%")
ab_right_label <- paste(Label_DF$RelAbundance.y, "%")

Label_DF_left <- merge(Label_DF, Label_DF_left_Format, by = "RelAbundance.x", all = F)
Label_DF_left_right <- merge(Label_DF_left, Label_DF_right_Format, by = "RelAbundance.y", all = F)


PLOT_Oxystominidae <- ggplot(Label_DF) + geom_segment(aes(x="1", xend="2", y=RelAbundance.x, yend=RelAbundance.y, col=factor(Species.x)), size=0.75, show.legend = T) +
  theme(panel.background = element_blank(),  panel.grid = element_blank(), axis.ticks = element_blank(),
    axis.text = element_blank(), axis.title = element_blank(), panel.border = element_blank(), plot.margin = unit(c(1,0,1,-1), "cm"),
    plot.title = element_text(hjust = 0.5), legend.key = element_rect(fill = "transparent", colour = "transparent"), legend.title.align = 0.5) +
  labs(color='Species') +
  geom_label(label=ab_left_label, y=Label_DF$RelAbundance.x, x=rep(1,NROW(Label_DF$RelAbundance.x)), size=3, hjust = 0, fontface="bold", vjust = 0, alpha=0.35, label.size = NA, label.padding = unit(0.05, "lines")) +
  geom_label(label=ab_right_label, y=Label_DF$RelAbundance.y, x=rep(2,NROW(Label_DF$RelAbundance.y)), size=3, hjust = 1, fontface="bold", vjust = 0, alpha=0.35, label.size = NA, label.padding = unit(0.05, "lines")) +
  geom_text(label=Label_DF_left_right$FinalLabel.x, y=Label_DF_left_right$RelAbundance.x, x=rep(1, NROW(Label_DF$RelAbundance.x)), hjust = 1, size=2.5, vjust=0, check_overlap = T) +
  geom_text(label=Label_DF_left_right$FinalLabel.y, y=Label_DF_left_right$RelAbundance.y, x=rep(2, NROW(Label_DF$RelAbundance.y)), hjust = 0, size=2.5, vjust=0, check_overlap = T) +
  geom_vline(xintercept=1, linetype="twodash", size=.1) + 
  scale_color_manual(values=c('#e6194b', '#3cb44b', '#ffe119', '#4363d8', '#f58231', '#911eb4', '#46f0f0', '#f032e6', '#bcf60c', '#fabebe', '#008080', '#e6beff', '#9a6324', '#fffac8', '#800000', '#aaffc3', '#808000', '#ffd8b1', '#000075', '#808080', '#000000', '#ffffff')) +
  geom_vline(xintercept=2, linetype="twodash", size=.1) +
  geom_text(label="VSearch", x=1, y=102, hjust=-0.2, size=5, check_overlap = T) +
  geom_text(label="DADA2", x=2, y=102, hjust=1.2, size=5, check_overlap = T) +
  ylim(1,100) + ggtitle("Oxystominidae ASVs/OTUs")
PLOT_Oxystominidae

ggsave("../Comparing_OTUs_ASVs/Oxystominidae_OTU_Corresponding_ASV.tiff", width = 16, height = 10, dpi = 300)


