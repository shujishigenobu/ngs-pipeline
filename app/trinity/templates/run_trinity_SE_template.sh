#!/bin/sh
#
#=== Trinity exec template script for SE ===
#
# tested in Trinity v2.2, v2.1.1
#

## SGE parameters
#$ -S /bin/bash
#$ -cwd



#=== config ===
## REQUIRED
##
## Single end
##  gz compressed files allowed
SEQ=Reads_cleaned/SRR2913234_1.clnq30.fq,Reads_cleaned/SRR2913236_1.clnq30.fq,Reads_cleaned/SRR2913272_1.clnq30.fq,Reads_cleaned/SRR2913284_1.clnq30.fq,Reads_cleaned/SRR2913233_1.clnq30.fq,Reads_cleaned/SRR2913285_1.clnq30.fq,Reads_cleaned/SRR2913235_1.clnq30.fq

OUT=Trinity_Pobe_160706k2

## OPTIONAL PARAMETERS

MIN_KMER_COV=2
 
## SERVER CONF
NCPU=16
MEM=128G
TRINITY_BASE=~/bio/applications_ngs2013/trinityrnaseq-2.2.0

#===
 
source ~/.bashrc
 
echo original path: $PATH
ulimit -s unlimited
 
TRINITY=$TRINITY_BASE/Trinity
 
echo running on `hostname`
echo started at `date`
 
$TRINITY \
 --seqType fq \
 --single $SEQ \
 --max_memory $MEM \
 --CPU $NCPU \
 --min_kmer_cov $MIN_KMER_COV \
 --output $OUT 


