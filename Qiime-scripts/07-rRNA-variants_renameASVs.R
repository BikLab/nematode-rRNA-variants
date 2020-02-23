library(biomformat)
library(tidyverse)

### 
# Import Biom Table
###
Path <- "Desktop/GoogleDrive/BikLab/rRNA-variants/featuretable/06B-rRNAvariants_ASVtable.tsv"
FeatureTable <- read.table(Path, sep = '\t', header = TRUE, row.names = 1)

###
# Sum Rows and order decreasing abundance
###
FeatureTable$Sum <- rowSums(FeatureTable)
FeatureTable <- FeatureTable[order(FeatureTable$Sum, decreasing = TRUE),]
FeatureTable$Sum <- NULL

### 
# Rename ASVs 
###
FeatureTable$NewName <- paste("ASV", seq.int(nrow(FeatureTable)), sep = "")
FeatureTable$ASVs <- row.names(FeatureTable)

###
# Save as TSV
###
output <- "Desktop/GoogleDrive/BikLab/rRNA-variants/analysis/07A-rRNAvariants_FeatureTable_NewNames.tsv"
write.table(FeatureTable, output, sep = "\t", row.names = F, col.names = TRUE, quote = FALSE)



