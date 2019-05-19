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
asvTable_Subset <- subset(ASV_Taxonomy, select = c(nem28,nem31,nem35,nem43,nem44,nem45,nem46,nem50,nem84,nem85,nem86,nem87,nem88,nem103,nem136,nem196,nem234,nem235,nem244,nem245,nem249,nem254,nem256,nem257,nem273,nem277,nem279,nem282,nem283,nem291))

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
write.table(asvTable_Subset_RelativeAbundance_RemoveLowAbundance_Separate_Taxonomy_Long, "Desmoscoledidae/DADA2_BiomTable_Desmoscoledidae_Family_Sans_LowAbundance_LONG_FORMAT.tsv", 
            sep = "\t", row.names = FALSE, col.names = TRUE, quote = FALSE)

### Subset BiomTable with Samples Belonging to Specific CLADE/Family ###
asvTable_Subset_removeBLANKasvs <- asvTable_Subset[ rowSums(asvTable_Subset)!=0, ] 
write.table(asvTable_Subset_removeBLANKasvs, file='Final_BiomTable_Desmoscolecidae_DADA2.tsv', quote=FALSE, sep='\t', col.names = NA)
