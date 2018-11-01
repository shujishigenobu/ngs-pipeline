#!/bin/sh
#$ -S /bin/bash

cd $PBS_O_WORKDIR

## For Trinity v2.8.4

#=== config ===
## REQUIRED
#SEQ1=Reads_Cleaned/180919-trial1-10_S12_L001_R1_A012.cln.Q30L25.fastq.gz,Reads_Cleaned/180919-trial1-10_S12_L002_R1_A012.cln.Q30L25.fastq.gz,Reads_Cleaned/180919-trial1-10_S12_L003_R1_A012.cln.Q30L25.fastq.gz,Reads_Cleaned/180919-trial1-10_S12_L004_R1_A012.cln.Q30L25.fastq.gz

#SEQ2=Reads_Cleaned/180919-trial1-10_S12_L001_R2_A012.cln.Q30L25.fastq.gz,Reads_Cleaned/180919-trial1-10_S12_L002_R2_A012.cln.Q30L25.fastq.gz,Reads_Cleaned/180919-trial1-10_S12_L003_R2_A012.cln.Q30L25.fastq.gz,Reads_Cleaned/180919-trial1-10_S12_L004_R2_A012.cln.Q30L25.fastq.gz

SAMPLES_FILE=samples.txt

OUT=/work/Trinity_PriPu_brains_181031f

SCRIPT=run_trinity_brains_f.sh
LOG=${SCRIPT}.log
 
## OPTIONAL PARAMETERS
DNORM_MAX_COV=200
MIN_KMER_COV=2
 
## SERVER CONF
NCPU=20
MEM=256G
#===
 
source ~/.bashrc
 
echo original path: $PATH
ulimit -s unlimited
 
TRINITY_HOME=/home/shige/bio/apps/Trinity-v2.8.4

echo running on `hostname`
echo started at `date`
 
$TRINITY_HOME/Trinity \
 --seqType fq \
 --SS_lib_type RF \
 --samples_file $SAMPLES_FILE \
 --max_memory $MEM \
 --CPU $NCPU \
 --min_kmer_cov $MIN_KMER_COV \
 --normalize_max_read_cov $DNORM_MAX_COV \
 --monitoring \
 --output $OUT \
 > $LOG 2>&1


## Other popular optoins
#
# --normalize_reads \
# --normalize_max_read_cov $DNORM_MAX_COV \
# --jaccard_clip

# --left  $SEQ1 --right $SEQ2 \
