#!/bin/bash

#SBATCH --job-name="RemoveChimericSeq"
#SBATCH --partition=intel
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=100G
#SBATCH --time=7-00:00:00
#SBATCH --mail-user=adesa002@ucr.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH -e Remove_ChimericSeq.err-%N
#SBATCH -o Remove_ChimericSeq.out-%N

#Path Variables
TABLE=/rhome/adesa002/shared/memb/18S/analysis-results/rRNA-Variants-Filtered-Samples/VSearch/MEMB_Clustered_99_FilteredSingletons_FeatureTable.qza
METADATA=/rhome/adesa002/shared/memb/18S/analysis-results/rRNA-Variants-Filtered-Samples/VSearch/ChimericSeq/nonchimeras.qza
OUTPUT=/rhome/adesa002/shared/memb/18S/analysis-results/rRNA-Variants-Filtered-Samples/VSearch/MEMB_Clustered_99_Sans_Singletons_Chimeras_FeatureTable.qza

#Activate QIIME2
export LC_ALL=en_US.utf-8
export LANG=en_US.utf-8
source activate qiime2-2019.1

#Filter out Chimeras from Feature Table
qiime feature-table filter-features \
  --i-table $TABLE \
  --m-metadata-file $METADATA \
  --o-filtered-table $OUTPUT
