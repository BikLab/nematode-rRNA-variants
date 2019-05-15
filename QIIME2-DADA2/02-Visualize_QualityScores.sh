#!/bin/bash

#SBATCH --job-name="Visualize_Quality"
#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=50G
#SBATCH --time=7-00:00:00
#SBATCH --mail-user=adesa002@ucr.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH -e Visualize_Quality.err-%N
#SBATCH -o Visualize_Quality.out-%N

#Path Variables
INPUT=/rhome/adesa002/shared/memb/18S/analysis-results/rRNA-Variants-Filtered-Samples/DADA2/MEMB_FASTQ.qza
OUTPUT=/rhome/adesa002/shared/memb/18S/analysis-results/rRNA-Variants-Filtered-Samples/DADA2/MEMB_FASTQ_Vis.qzv

#Activate QIIME2v2019.1
export LC_ALL=en_US.utf-8
export LANG=en_US.utf-8
source activate qiime2-2019.1

#Visualize Quality Scores
qiime demux summarize \
  --i-data $INPUT \
  --o-visualization $OUTPUT

