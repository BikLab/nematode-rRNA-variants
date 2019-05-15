#!/bin/bash

#SBATCH --job-name="ImportFASTA"
#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=50G
#SBATCH --time=7-00:00:00
#SBATCH --mail-user=adesa002@ucr.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH -e ImportFASTA.err-%N
#SBATCH -o ImportFASTA.out-%N

#Path Variables
INPUT=/rhome/adesa002/shared/memb/18S/data-clean/18S-euk-memb1-filtered-samples-rRNA-Variants.fa
OUTPUT=/rhome/adesa002/shared/memb/18S/analysis-results/rRNA-Variants-Filtered-Samples/VSearch/MEMB_FASTA.qza

#Activate QIIME2
export LC_ALL=en_US.utf-8
export LANG=en_US.utf-8
source activate qiime2-2019.1

#Import Quality Trimmed FASTA Format
qiime tools import \
--input-path $INPUT \
--output-path $OUTPUT \
--type 'SampleData[Sequences]'

