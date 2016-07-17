#!/bin/sh
#$ -S /bin/bash
#$ -l nc=12
#$ -cwd

## For Trinity > v2.2.0

#=== config ===
## REQUIRED
SEQ1=Reads_Cleaned_H/idx13_AGTCAA_L003_R1_001.cln.Q30L25.fastq.gz,Reads_Cleaned_H/idx14_AGTTCC_L003_R1_001.cln.Q30L25.fastq.gz,Reads_Cleaned_H/idx15_ATGTCA_L003_R1_001.cln.Q30L25.fastq.gz,Reads_Cleaned_H/idx2_CGATGT_L004_R1_001.cln.Q30L25.fastq.gz,Reads_Cleaned_H/idx4_TGACCA_L004_R1_001.cln.Q30L25.fastq.gz,Reads_Cleaned_H/idx5_ACAGTG_L004_R1_001.cln.Q30L25.fastq.gz,Reads_Cleaned_H/s_5_1_1_sequence.fq.cln.Q30L25.fastq.gz,Reads_Cleaned_H/s_5_1_3_sequence.fq.cln.Q30L25.fastq.gz,Reads_Cleaned_H/s_5_1_8_sequence.fq.cln.Q30L25.fastq.gz

SEQ2=Reads_Cleaned_H/idx13_AGTCAA_L003_R2_001.cln.Q30L25.fastq.gz,Reads_Cleaned_H/idx14_AGTTCC_L003_R2_001.cln.Q30L25.fastq.gz,Reads_Cleaned_H/idx15_ATGTCA_L003_R2_001.cln.Q30L25.fastq.gz,Reads_Cleaned_H/idx2_CGATGT_L004_R2_001.cln.Q30L25.fastq.gz,Reads_Cleaned_H/idx4_TGACCA_L004_R2_001.cln.Q30L25.fastq.gz,Reads_Cleaned_H/idx5_ACAGTG_L004_R2_001.cln.Q30L25.fastq.gz,Reads_Cleaned_H/s_5_2_1_sequence.fq.cln.Q30L25.fastq.gz,Reads_Cleaned_H/s_5_2_3_sequence.fq.cln.Q30L25.fastq.gz,Reads_Cleaned_H/s_5_2_8_sequence.fq.cln.Q30L25.fastq.gz

OUT=Trinity_H_160716
 
## OPTIONAL PARAMETERS
#DNORM_MAX_COV=200
MIN_KMER_COV=2
 
## SERVER CONF
NCPU=16
MEM=128G
#===
 
source ~/.bashrc
 
echo original path: $PATH
ulimit -s unlimited
 
TRINITY=/home/shige/bio/applications/trinityrnaseq-2.2.0/Trinity

echo running on `hostname`
echo started at `date`
 
$TRINITY \
 --seqType fq \
 --left  $SEQ1 --right $SEQ2 \
 --max_memory $MEM \
 --CPU $NCPU \
 --min_kmer_cov $MIN_KMER_COV \
 --jaccard_clip \
 --output $OUT 


## Other popular optoins
#
# --normalize_reads \
# --normalize_max_read_cov $DNORM_MAX_COV \
# --jaccard_clip
