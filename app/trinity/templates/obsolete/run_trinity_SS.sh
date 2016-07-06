#!/bin/sh
#$ -S /bin/bash
#$ -l nc=16
#$ -cwd

## For trinityrnaseq_r20140413p1

#=== config ===
## REQUIRED
SEQ1=left.fa
SEQ2=right.fa
OUT=Trinity_TmA_141224k2
 
## OPTIONAL PARAMETERS
#DNORM_MAX_COV=200

MIN_KMER_COV=2
 
## SERVER CONF
NCPU=20
JM=256G
#===
 
source ~/.bashrc
 
echo original path: $PATH
ulimit -s unlimited
 
TRINITY_BASE=~/bio/Applications/trinityrnaseq_r20140413p1/
 
echo running on `hostname`
echo started at `date`
 
$TRINITY_BASE/Trinity \
 --seqType fa \
 --left  $SEQ1 --right $SEQ2 \
 --SS_lib_type RF \
 --JM $JM \
 --CPU $NCPU \
 --min_kmer_cov $MIN_KMER_COV \
 --output $OUT 


# --normalize_reads \
# --normalize_max_read_cov $DNORM_MAX_COV \