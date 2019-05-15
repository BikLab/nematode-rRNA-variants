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


PLOT_Desmoscolecidae <- ggplot(Label_DF) + geom_segment(aes(x="1", xend="2", y=RelAbundance.x, yend=RelAbundance.y, col=factor(Species.x)), size=0.75, show.legend = T) +
  theme(panel.background = element_blank(),  panel.grid = element_blank(), axis.ticks = element_blank(),
        axis.text = element_blank(), axis.title = element_blank(), panel.border = element_blank(), plot.margin = unit(c(1,0,1,-1), "cm"),
        plot.title = element_text(hjust = 0.5), legend.key = element_rect(fill = "transparent", colour = "transparent"), legend.title.align = 0.5) +
  labs(color='Species') +
  geom_label(label=ab_left_label, y=Label_DF$RelAbundance.x, x=rep(1,NROW(Label_DF$RelAbundance.x)), size=3, hjust = 0, fontface="bold", vjust = 0, alpha=0.35, label.size = NA, label.padding = unit(0.05, "lines")) +
  geom_label(label=ab_right_label, y=Label_DF$RelAbundance.y, x=rep(2,NROW(Label_DF$RelAbundance.y)), size=3, hjust = 1, fontface="bold", vjust = 0, alpha=0.35, label.size = NA, label.padding = unit(0.05, "lines")) +
  geom_text(label=Label_DF_left_right$FinalLabel.x, y=Label_DF_left_right$RelAbundance.x, x=rep(1, NROW(Label_DF$RelAbundance.x)), hjust = 1, size=2.5, vjust=0, check_overlap = T) +
  geom_text(label=Label_DF_left_right$FinalLabel.y, y=Label_DF_left_right$RelAbundance.y, x=rep(2, NROW(Label_DF$RelAbundance.y)), hjust = 0, size=2.5, vjust=0, check_overlap = T) +
   geom_vline(xintercept=1, linetype="twodash", size=.1) + 
  scale_color_manual(values=c('#e6194b', '#3cb44b', '#ffe119', '#4363d8', '#f58231', '#911eb4', '#46f0f0', '#f032e6', '#bcf60c', '#fabebe', '#008080', '#e6beff', '#9a6324', '#fffac8', '#800000', '#aaffc3', '#808000', '#ffd8b1', '#000075', '#808080', '#ffffff', '#000000')) +
  geom_vline(xintercept=2, linetype="twodash", size=.1) +
  geom_text(label="VSearch", x=1, y=102, hjust=-0.2, size=5, check_overlap = T) +
  geom_text(label="DADA2", x=2, y=102, hjust=1.2, size=5, check_overlap = T) +
  ylim(1,100) + ggtitle("Desmoscolecidae ASVs/OTUs")
PLOT_Desmoscolecidae

ggsave("../Comparing_OTUs_ASVs/Desmoscolecidae_OTU_Corresponding_ASV.tiff", width = 16, height = 10, dpi = 300)


