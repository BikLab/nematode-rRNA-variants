library(biomformat)
library(dplyr)

### Rename ASV/OTU table ### 
### Import Biom Table ###
otuTable <- as.data.frame(as.matrix(biom_data(read_biom("FeatureTable/Export-Sans-Singletons-ChimericSeq/feature-table.biom"))))
colnames(otuTable) <- sub("MEMB.nem.", "nem", colnames(otuTable))

otuTable$rowSums <- rowSums(otuTable)
otuTable_rowSums <- otuTable[order(otuTable$rowSums, decreasing = TRUE),]
otuTable_rowSums$rowSums <- NULL

### Rename OTUs ###
otuTable_rowSums$NewName <- paste("OTU", seq.int(nrow(otuTable_rowSums)), sep = "")

### Move LAST Column to the Beginning ### 
otuTable_rowSums <- otuTable_rowSums %>%
  select(NewName, everything())

### Make Row Names into a new column and move to front ###
otuTable_rowSums$OTUs <- row.names(otuTable_rowSums)

otuTable_rowSums <- otuTable_rowSums %>%
  select(OTUs, everything())

write.table(otuTable_rowSums, "VSearch_BiomTable_w_NewNames.tsv", 
            sep = "\t", row.names = FALSE, col.names = TRUE, quote = FALSE)

