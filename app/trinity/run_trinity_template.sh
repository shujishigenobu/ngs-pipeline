#!/bin/sh
#$ -S /bin/bash
#$ -l nc=8
#$ -cwd
 
#=== config ===
## REQUIRED
AHOME=/home/shige/Projects/n11708-Satta/Analysis/130925-trinity_devil
SEQ1=$AHOME/left_all.fq
SEQ2=$AHOME/right_all.fq
OUT=./trinity_devil_130925
# OUT=/scratch/shige/130330-trinity-LSR/trinity_ApLSR_all
  
## OPTIONAL PARAMETERS
MIN_KMER_COV=1
  
## SERVER CONF
NCPU=8
JM=64G
#===

TRINITY_BASE=~/bio/Applications/trinityrnaseq_r2013-02-25
  
echo original path: $PATH
ulimit -s unlimited
  
echo running on `hostname`
echo started at `date`
  
$TRINITY_BASE/Trinity.pl \
     --prep \
     --JM $JM \
     --seqType fq \
     --min_kmer_cov $MIN_KMER_COV \
     --left $SEQ1  --right $SEQ2 \
     --CPU $NCPU \
     --output $OUT