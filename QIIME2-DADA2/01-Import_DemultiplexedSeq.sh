#!/bin/bash

#SBATCH --job-name="ImportSeq_Artifacts"
#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=50G
#SBATCH --time=7-00:00:00
#SBATCH --mail-user=adesa002@ucr.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH -e ImportSeq_Artifacts.err-%N
#SBATCH -o ImportSeq_Artifacts.out-%N

#Path Variables
INPUT=/rhome/adesa002/shared/memb/18S/data-clean/raw_fastq_233nem_specimen/
SEQ_ARTIFACT=/rhome/adesa002/shared/memb/18S/analysis-results/rRNA-Variants-Filtered-Samples/DADA2/MEMB_FASTQ.qza

#Activate QIIME2v2019.1
export LC_ALL=en_US.utf-8
export LANG=en_US.utf-8
source activate qiime2-2019.1

#Import Demultiplexed Sequences
qiime tools import \
--type 'SampleData[PairedEndSequencesWithQuality]' \
--input-path $INPUT \
--input-format CasavaOneEightSingleLanePerSampleDirFmt \
--output-path $SEQ_ARTIFACT
