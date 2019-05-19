library(vegan)
library(tidyr)
library(reshape2)

### Import Biom Table (Replace File Line 6 for VSearch) ###
asvTable <- read.table("DADA2_BiomTable_w_NewNames.tsv", header = T)
row.names(asvTable) <- asvTable$ASVs

### Import Taxonomy ###
Taxonomy <- read.delim("Taxonomy/Export/taxonomy.tsv", sep = "\t", header = TRUE, row.names = 1)

ASV_Taxonomy <- merge(asvTable, Taxonomy, by = "row.names", all.x = T)
row.names(ASV_Taxonomy) <- ASV_Taxonomy$NewName
ASV_Taxonomy$Row.names <- NULL

### Rename ASVs ###
Taxonomy_Renamed <- subset(ASV_Taxonomy, select = c(Taxon))

### Subset select ASVs for Specic Family Group ###
asvTable_Subset <- subset(ASV_Taxonomy, select = c(nem59,nem71,nem73,nem75,nem117,nem152,nem163,nem192,nem290,nem40,nem54,nem64,nem143,nem150,nem151,nem155,nem164,nem174,nem193,nem219,nem220,nem225,nem26,nem32,nem65,nem66,nem67,nem69,nem70,nem72,nem74,nem78,nem79,nem111,nem144,nem159,nem177,nem191,nem217,nem221,nem222,nem224,nem232,nem239,nem264,nem265,nem267,nem285,nem51,nem56,nem187,nem195))

### Convert to Relative Abundance ###
asvTable_Subset_RelativeAbundance <- as.data.frame(t(decostand(t(asvTable_Subset), method = "total")))
asvTable_Subset_RelativeAbundance <- asvTable_Subset_RelativeAbundance[, 1:ncol(asvTable_Subset_RelativeAbundance)]*100

### Remove Low Abundance ASVs (<1%) by replacing them with 0 ###
asvTable_Subset_RelativeAbundance[ asvTable_Subset_RelativeAbundance<1 ] <- 0
asvTable_Subset_RelativeAbundance_RemoveLowAbundance <- asvTable_Subset_RelativeAbundance[ rowSums(asvTable_Subset_RelativeAbundance)>0, ] 

### Merge asvTable with Taxonomy ###
asvTable_Subset_RelativeAbundance_RemoveLowAbundance_Taxonomy <- merge(asvTable_Subset_RelativeAbundance_RemoveLowAbundance, Taxonomy_Renamed, by = "row.names", all.x = T)
row.names(asvTable_Subset_RelativeAbundance_RemoveLowAbundance_Taxonomy) <- asvTable_Subset_RelativeAbundance_RemoveLowAbundance_Taxonomy$Row.names
asvTable_Subset_RelativeAbundance_RemoveLowAbundance_Taxonomy$Row.names <- NULL

### Only Keep taxonomy level 7 (Contains Nematoda) ###
asvTable_Subset_RelativeAbundance_RemoveLowAbundance_Separate_Taxonomy<- asvTable_Subset_RelativeAbundance_RemoveLowAbundance_Taxonomy %>% separate(Taxon, c("V1", "V2", "V3", "V4", "V5", "V6", "Taxonomy", "V8", "V9", "V10", "V11", "V12", "V13", "V14", "V15"),sep = ";", remove = TRUE)
asvTable_Subset_RelativeAbundance_RemoveLowAbundance_Separate_Taxonomy <- subset(asvTable_Subset_RelativeAbundance_RemoveLowAbundance_Separate_Taxonomy, select = -c(V1,V2,V3,V4,V5,V6,V8,V9,V10,V11,V12,V13,V14,V15))
asvTable_Subset_RelativeAbundance_RemoveLowAbundance_Separate_Taxonomy$ASV <- row.names(asvTable_Subset_RelativeAbundance_RemoveLowAbundance_Separate_Taxonomy) 

### Melt into LongFormat ###
asvTable_Subset_RelativeAbundance_RemoveLowAbundance_Separate_Taxonomy_Long <- melt(asvTable_Subset_RelativeAbundance_RemoveLowAbundance_Separate_Taxonomy, id.vars=c("ASV", "Taxonomy"))

### Rename ASVs with blank taxonomy with Eukaryota and fix formatting and column names ### 
asvTable_Subset_RelativeAbundance_RemoveLowAbundance_Separate_Taxonomy_Long[is.na(asvTable_Subset_RelativeAbundance_RemoveLowAbundance_Separate_Taxonomy_Long)] <- "Eukaryota"
asvTable_Subset_RelativeAbundance_RemoveLowAbundance_Separate_Taxonomy_Long$Taxonomy <- gsub("D_[0-9]__", "", asvTable_Subset_RelativeAbundance_RemoveLowAbundance_Separate_Taxonomy_Long$Taxonomy)
colnames(asvTable_Subset_RelativeAbundance_RemoveLowAbundance_Separate_Taxonomy_Long) <- c("ASV", "Taxonomy", "Sample", "Abundance")

### Save Files (Long Format for Barplots with GGTREE) ###
write.table(asvTable_Subset_RelativeAbundance_RemoveLowAbundance_Separate_Taxonomy_Long, "Comesomatidae/DADA2_BiomTable_Comesomatidae_Family_Sans_LowAbundance_LONG_FORMAT.tsv", 
            sep = "\t", row.names = FALSE, col.names = TRUE, quote = FALSE)

### Subset BiomTable with Samples Belonging to Specific CLADE/Family ###
asvTable_Subset_removeBLANKasvs <- asvTable_Subset[ rowSums(asvTable_Subset)!=0, ] 
write.table(asvTable_Subset_removeBLANKasvs, file='Final_BiomTable_Comesomatidae_DADA2.tsv', quote=FALSE, sep='\t', col.names = NA)
