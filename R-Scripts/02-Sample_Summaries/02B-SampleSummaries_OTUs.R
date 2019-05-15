library(seqinr)
library(tidyr)
library(dplyr)

### Organize ASVs per Sample ### 
### Import Files (Set Working Directory Beforehand) ###
VSearch_BiomTable <- read.table("VSearch_BiomTable_w_NewNames.tsv", sep = "\t", header = TRUE, row.names = 1)
VSearch_Taxonomy <- read.delim("Taxonomy/Export/taxonomy.tsv", sep = "\t", header = TRUE, row.names = 1)
VSearch_Sequence <- data.frame(row.names = names(read.fasta("FeatureSeq/ChimericSeq/Export-NonChimeras/dna-sequences.fasta")), Seqs=unlist(getSequence(read.fasta("FeatureSeq/ChimericSeq/Export-NonChimeras/dna-sequences.fasta"), as.string=T)))

### Merge BiomTable with Taxonomy and Sequences and Convert to Long Form ### 
VSearch_Merged <- cbind(VSearch_BiomTable, VSearch_Taxonomy, VSearch_Sequence)
VSearch_Merged$OTUs <- row.names(VSearch_Merged)
VSearch_Long <- VSearch_Merged %>% gather(Sample, Abundance, -Confidence, -Taxon, -Seqs, -NewName, -OTUs)

### Split Dataframe by Samples ### 
VSearch_Split <- split(VSearch_Long, VSearch_Long$Sample)
List <- names(VSearch_Split)

### Run Loop ###
VSearch_Split_RelAb <- NULL
VSearch_Split_RelAb_Filter <- NULL
VSearch_Split_RelAb_Filter_Sort <- NULL

for(i in List){
  VSearch_Split_RelAb[[i]] <- VSearch_Split[[i]] %>% mutate(RelAbundance = 100 * Abundance / sum(Abundance))
  VSearch_Split_RelAb_Filter[[i]] <- subset(VSearch_Split_RelAb[[i]], RelAbundance>1)
  VSearch_Split_RelAb_Filter_Sort[[i]] <- VSearch_Split_RelAb_Filter[[i]][order(-VSearch_Split_RelAb_Filter[[i]]$RelAbundance) , ]
}

for(i in List){
  saveName = paste0(i, '.tsv')
  write.table(VSearch_Split_RelAb_Filter[[i]], file=saveName, quote=FALSE, sep='\t', row.names = FALSE)
}


