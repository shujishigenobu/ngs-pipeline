#!/bin/sh
#$ -S /bin/bash
#$ -l nc=16
#$ -cwd
 
#=== config ===
## REQUIRED
SEQ1=All_R1.fq
SEQ2=All_R2.fq
OUT=/scratch/shige/121003-trinity-YoshidaG/trinity_Coku_R120810all_p2_dignorm
 
## OPTIONAL PARAMETERS
DNORM_MAX_COV=30
MIN_KMER_COV=2
 
## SERVER CONF
NCPU=16
JM=128G
#===
 
source ~/.bashrc
 
echo original path: $PATH
ulimit -s unlimited
 
TRINITY_BASE=~/bio/Applications/trinityrnaseq_r2013-02-25/
 
echo running on `hostname`
echo started at `date`
 
$TRINITY_BASE/util/normalize_by_kmer_coverage.pl \
--seqType fq \
--JM $JM \
--max_cov $DNORM_MAX_COV \
--left  $SEQ1 --right $SEQ2 \
--pairs_together --PARALLEL_STATS --JELLY_CPU $NCPU



SEQ1N=$SEQ1.normalized_K25_C30_pctSD100.fq
SEQ2N=$SEQ2.normalized_K25_C30_pctSD100.fq

$TRINITY_BASE/Trinity.pl \
--JM $JM \
--seqType fq \
--min_kmer_cov $MIN_KMER_COV \
--left $SEQ1N  --right $SEQ2N \
--CPU $NCPU \
--output $OUT 

