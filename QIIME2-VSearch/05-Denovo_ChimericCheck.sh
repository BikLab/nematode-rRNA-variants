#!/bin/bash

#SBATCH --job-name="VSearch_ChimericCheck"
#SBATCH --partition=intel
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=100G
#SBATCH --time=7-00:00:00
#SBATCH --mail-user=adesa002@ucr.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH -e VSearch_ChimericCheck.err-%N
#SBATCH -o VSearch_ChimericCheck.out-%N

#Path Variables
TABLE=/rhome/adesa002/shared/memb/18S/analysis-results/rRNA-Variants-Filtered-Samples/VSearch/MEMB_Clustered_99_FilteredSingletons_FeatureTable.qza
SEQ=/rhome/adesa002/shared/memb/18S/analysis-results/rRNA-Variants-Filtered-Samples/VSearch/MEMB_Clustered_99_RepSeq_VSearch_Sans_Singletons.qza
OUTPUT=/rhome/adesa002/shared/memb/18S/analysis-results/rRNA-Variants-Filtered-Samples/VSearch/ChimericSeq

#Activate QIIME2
export LC_ALL=en_US.utf-8
export LANG=en_US.utf-8
source activate qiime2-2019.1

#Denovo Chimeric Checking
qiime vsearch uchime-denovo \
--i-table $TABLE \
--i-sequences $SEQ \
--output-dir $OUTPUT
