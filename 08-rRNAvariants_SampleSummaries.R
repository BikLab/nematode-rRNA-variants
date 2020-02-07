library(tidyverse)
library(seqinr)

### 
# Import Files 
###
FeatureTablepath <- "Desktop/GoogleDrive/BikLab/rRNA-variants/analysis/07A-rRNAvariants_FeatureTable_NewNames.tsv"
Taxonomypath <- "Desktop/GoogleDrive/BikLab/rRNA-variants/taxonomy/rRNAvariants_taxonomy.tsv"
DNASeqPath <- "Desktop/GoogleDrive/BikLab/rRNA-variants/featureseq/rRNAvariants_FeatureSeq.fasta"

FeatureTable <- read.table(FeatureTablepath, sep = "\t", header = TRUE, row.names = 261)
FeatureSeq <- data.frame(row.names = names(read.fasta(DNASeqPath)), Seqs=unlist(getSequence(read.fasta(DNASeqPath), as.string=T)))
Taxonomy <- read.delim(Taxonomypath, sep = "\t", header = TRUE, row.names = 1)

### Merge BiomTable with Taxonomy and Sequences and Convert to Long Form ### 
FeatureMerged <- merge(FeatureTable, FeatureSeq, by="row.names")
row.names(FeatureMerged) <- FeatureMerged$Row.names; FeatureMerged$Row.names <- NULL

MergedTable <- merge(FeatureMerged, Taxonomy, by="row.names")
MergedTable$ASVs <- MergedTable$Row.names; MergedTable$Row.names <- NULL
MergedTable_Long <- MergedTable %>% gather(Sample, Abundance, -Confidence, -Taxon, -Seqs, -NewName, -ASVs)

### Split Dataframe by Samples ### 
MergedTable_Split <- split(MergedTable_Long, MergedTable_Long$Sample)
List <- names(MergedTable_Split)

### Run Loop ###
DADA2_Split_RelAb <- NULL
DADA2_Split_RelAb_Filter <- NULL
DADA2_Split_RelAb_Filter_Sort <- NULL

for(i in List){
  DADA2_Split_RelAb[[i]] <- MergedTable_Split[[i]] %>% mutate(RelAbundance = 100 * Abundance / sum(Abundance))
  DADA2_Split_RelAb_Filter[[i]] <- subset(DADA2_Split_RelAb[[i]], RelAbundance > 0)
  DADA2_Split_RelAb_Filter_Sort[[i]] <- DADA2_Split_RelAb_Filter[[i]][order(-DADA2_Split_RelAb_Filter[[i]]$RelAbundance) , ]
}

output <- "Desktop/GoogleDrive/BikLab/rRNA-variants/analysis/08A-rRNAvariants_SampleSummaries/"
for(i in List){
  saveName = paste0(output, i, '.tsv')
  write.table(DADA2_Split_RelAb_Filter_Sort[[i]], file=saveName, quote=FALSE, sep='\t', row.names = FALSE)
}
