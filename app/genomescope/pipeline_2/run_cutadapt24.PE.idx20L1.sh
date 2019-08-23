#!/bin/sh
#$ -S /bin/bash
#$ -cwd

#===
# run_cutadapt.PE.template.sh
# 
# A template script for pre-processing Illumina TruSeq paried-end reads, 
# using cutadapt software.
#
# Validated cutadapt versions: 1.9.1
#
# author: Shuji Shigenobu <shige@nibb.ac.jp>
# date:   Jan 22, 2016
#

UNIV_ADAPTER_COMP=AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT
IDX_CONS=AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC

QV=20
O=8
MINCUT=100
FIXEDLEN=100
INPUT1=190808-YMG1-20_S2_L001_R1_001.fastq.gz
INPUT2=190808-YMG1-20_S2_L001_R2_001.fastq.gz
NCPU=24

OUTPUT1=`basename $INPUT1 .fastq.gz`.cln2.Q${QV}L${FIXEDLEN}.fastq.gz
OUTPUT2=`basename $INPUT2 .fastq.gz`.cln2.Q${QV}L${FIXEDLEN}.fastq.gz

CUTADAPT=/home/shige/.local/bin/cutadapt

$CUTADAPT \
  -q $QV \
  -O $O \
  -a $IDX_CONS $INPUT \
  -A $UNIV_ADAPTER_COMP \
  -l $FIXEDLEN \
  --minimum-length $MINCUT \
  --trim-n \
  -o $OUTPUT1 \
  -p $OUTPUT2 \
  -j $NCPU \
  $INPUT1 \
  $INPUT2




# Other popular options:
# --quality-base=33 or 64
#   usually 33, but 64 for old Illumina
#

# Reference
# - cutadapt manuals / section on illumina-truseq: 
#    http://cutadapt.readthedocs.org/en/stable/guide.html#illumina-truseq
#
# Acknowledgements
# - K Yamaguchi.
