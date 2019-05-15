#!/bin/bash

#SBATCH --job-name="DADA2-AssignTaxBlast"
#SBATCH --partition=intel
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=150G
#SBATCH --time=2-00:00:00
#SBATCH --mail-user=adesa002@ucr.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH -e DADA2-AssignTaxBlast.err-%N
#SBATCH -o DADA2-AssignTaxBlast.out-%N


#Path Variables
INPUT=/rhome/adesa002/shared/memb/18S/analysis-results/rRNA-Variants-Filtered-Samples/DADA2/MEMB_ASV_FeatureSeq_DADA2.qza
REFSEQ=/rhome/adesa002/shared/ref-dbs/CustomDatabase_SILVA_and_SingleNem_Sequences_ImportedQIIME.qza
REFTAX=/rhome/adesa002/shared/ref-dbs/CustomDatabase_SILVA_and_SingleNem_Taxonomy_ImportedQIIME.qza
OUTPUT=/rhome/adesa002/shared/memb/18S/analysis-results/rRNA-Variants-Filtered-Samples/DADA2/DADA2_Taxonomy_BLAST.qza

#Activate QIIME2
export LC_ALL=en_US.utf-8
export LANG=en_US.utf-8
source activate qiime2-2019.1

#Assign BLAST
qiime feature-classifier classify-consensus-blast \
--i-query $INPUT \
--i-reference-reads $REFSEQ \
--i-reference-taxonomy $REFTAX \
--p-perc-identity 0.7 \
--o-classification $OUTPUT \
--verbose
