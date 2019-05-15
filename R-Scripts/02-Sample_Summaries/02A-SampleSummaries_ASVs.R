library(seqinr)
library(tidyr)
library(dplyr)

### Organize ASVs per Sample ### 
### Import Files (Set Working Directory Beforehand) ###
DADA2_BiomTable <- read.table("DADA2_BiomTable_w_NewNames.tsv", sep = "\t", header = TRUE, row.names = 1)
DADA2_Taxonomy <- read.delim("Taxonomy/Export/taxonomy.tsv", sep = "\t", header = TRUE, row.names = 1)
DADA2_Sequence <- data.frame(row.names = names(read.fasta("FeatureSeq/Export/dna-sequences.fasta")), Seqs=unlist(getSequence(read.fasta("FeatureSeq/Export/dna-sequences.fasta"), as.string=T)))

### Merge BiomTable with Taxonomy and Sequences and Convert to Long Form ### 
DADA2_Merged <- cbind(DADA2_BiomTable, DADA2_Taxonomy, DADA2_Sequence)
DADA2_Merged$OTUs <- row.names(DADA2_Merged)
DADA2_Long <- DADA2_Merged %>% gather(Sample, Abundance, -Confidence, -Taxon, -Seqs, -NewName, -OTUs)

### Split Dataframe by Samples ### 
DADA2_Split <- split(DADA2_Long, DADA2_Long$Sample)
List <- names(DADA2_Split)

### Run Loop ###
DADA2_Split_RelAb <- NULL
DADA2_Split_RelAb_Filter <- NULL
DADA2_Split_RelAb_Filter_Sort <- NULL

for(i in List){
  DADA2_Split_RelAb[[i]] <- DADA2_Split[[i]] %>% mutate(RelAbundance = 100 * Abundance / sum(Abundance))
  DADA2_Split_RelAb_Filter[[i]] <- subset(DADA2_Split_RelAb[[i]], RelAbundance>1)
  DADA2_Split_RelAb_Filter_Sort[[i]] <- DADA2_Split_RelAb_Filter[[i]][order(-DADA2_Split_RelAb_Filter[[i]]$RelAbundance) , ]
}

for(i in List){
  saveName = paste0(i, '.tsv')
  write.table(DADA2_Split_RelAb_Filter[[i]], file=saveName, quote=FALSE, sep='\t', row.names = FALSE)
}


