#!/bin/sh
#$ -S /bin/bash
#$ -l nc=16
#$ -cwd

## For Trinity v2.1.1

#=== config ===
## REQUIRED
SEQ1=SRR2294730_1.fastq.cln.Q30L25.fastq.gz,SRR2294731_1.fastq.cln.Q30L25.fastq.gz,SRR2294732_1.fastq.cln.Q30L25.fastq.gz,SRR2294733_1.fastq.cln.Q30L25.fastq.gz,SRR2294734_1.fastq.cln.Q30L25.fastq.gz
SEQ2=SRR2294730_2.fastq.cln.Q30L25.fastq.gz,SRR2294731_2.fastq.cln.Q30L25.fastq.gz,SRR2294732_2.fastq.cln.Q30L25.fastq.gz,SRR2294733_2.fastq.cln.Q30L25.fastq.gz,SRR2294734_2.fastq.cln.Q30L25.fastq.gz
OUT=Trinity_Dvit_160406
 
## OPTIONAL PARAMETERS
#DNORM_MAX_COV=200

MIN_KMER_COV=1
 
## SERVER CONF
NCPU=20
MEM=192G
#===
 
source ~/.bashrc
 
echo original path: $PATH
ulimit -s unlimited
 
TRINITY=Trinity
 
echo running on `hostname`
echo started at `date`
 
$TRINITY \
 --seqType fq \
 --left  $SEQ1 --right $SEQ2 \
 --max_memory $MEM \
 --CPU $NCPU \
 --min_kmer_cov $MIN_KMER_COV \
 --output $OUT 


# --normalize_reads \
# --normalize_max_read_cov $DNORM_MAX_COV \
