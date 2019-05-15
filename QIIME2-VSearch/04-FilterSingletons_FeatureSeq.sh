#!/bin/bash

#SBATCH --job-name="FilterSingletons"
#SBATCH --partition=intel
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=50G
#SBATCH --time=7-00:00:00
#SBATCH --mail-user=adesa002@ucr.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH -e FilterSingletons.err-%N
#SBATCH -o FilterSingletons.out-%N

#Path Variables
INPUT=/rhome/adesa002/shared/memb/18S/analysis-results/rRNA-Variants-Filtered-Samples/VSearch/MEMB_Clustered_99_FilteredSingletons_FeatureTable.qza
OUTPUT=/rhome/adesa002/shared/memb/18S/analysis-results/rRNA-Variants-Filtered-Samples/VSearch/MEMB_Clustered_99_RepSeq_VSearch_Sans_Singletons.qza
SEQ=/rhome/adesa002/shared/memb/18S/analysis-results/rRNA-Variants-Filtered-Samples/VSearch/MEMB_Clustered_99_RepSeq_VSearch.qza

#Activate QIIME2
export LC_ALL=en_US.utf-8
export LANG=en_US.utf-8
source activate qiime2-2019.1

#Filter Singletons from Feature Sequences
qiime feature-table filter-seqs \
  --i-data $SEQ \
  --i-table $INPUT \
  --o-filtered-data $OUTPUT
