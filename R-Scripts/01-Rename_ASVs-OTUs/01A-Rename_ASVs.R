library(biomformat)
library(dplyr)

### Rename ASV/OTU table ### 
### Import Biom Table ###
otuTable <- as.data.frame(as.matrix(biom_data(read_biom("FeatureTable/Export/feature-table.biom"))))

otuTable$rowSums <- rowSums(otuTable)
otuTable_rowSums <- otuTable[order(otuTable$rowSums, decreasing = TRUE),]
otuTable_rowSums$rowSums <- NULL

### Rename ASVs ###
otuTable_rowSums$NewName <- paste("ASVs", seq.int(nrow(otuTable_rowSums)), sep = "")

### Move LAST Column to the Beginning ### 
otuTable_rowSums <- otuTable_rowSums %>%
  select(NewName, everything())

### Make Row Names into a new column and move to front ###
otuTable_rowSums$ASVs <- row.names(otuTable_rowSums)

otuTable_rowSums <- otuTable_rowSums %>%
  select(ASVs, everything())

write.table(otuTable_rowSums, "DADA2_BiomTable_w_NewNames.tsv", 
            sep = "\t", row.names = FALSE, col.names = TRUE, quote = FALSE)

