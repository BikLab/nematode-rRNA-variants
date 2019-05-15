#!/bin/bash

#SBATCH --job-name="QIIME2_DADA2"
#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks=5
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=50G
#SBATCH --time=14-00:00:00
#SBATCH --mail-user=adesa002@ucr.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH -e QIIME2_DADA2.err-%N
#SBATCH -o QIIME2_DADA2.out-%N

#Path Variables
INPUT=/rhome/adesa002/shared/memb/18S/analysis-results/rRNA-Variants-Filtered-Samples/DADA2/MEMB_FASTQ.qza
OUTPUT_TABLE=/rhome/adesa002/shared/memb/18S/analysis-results/rRNA-Variants-Filtered-Samples/DADA2/MEMB_ASV_FeatureTable_DADA2.qza
OUTPUT_REPSEQ=/rhome/adesa002/shared/memb/18S/analysis-results/rRNA-Variants-Filtered-Samples/DADA2/MEMB_ASV_FeatureSeq_DADA2.qza
OUTPUT_STATS=/rhome/adesa002/shared/memb/18S/analysis-results/rRNA-Variants-Filtered-Samples/DADA2/MEMB_ASV_QCStats_DADA2.qza

#Activate QIIME2v2018.8
export LC_ALL=en_US.utf-8
export LANG=en_US.utf-8
source activate qiime2-2019.1

#Run DADA2
qiime dada2 denoise-paired \
--i-demultiplexed-seqs $INPUT \
--p-trim-left-f 0 \
--p-trunc-len-f 232 \
--p-trim-left-r 0 \
--p-trunc-len-r 240 \
--o-table $OUTPUT_TABLE \
--o-representative-sequences $OUTPUT_REPSEQ \
--o-denoising-stats $OUTPUT_STATS \
--verbose
