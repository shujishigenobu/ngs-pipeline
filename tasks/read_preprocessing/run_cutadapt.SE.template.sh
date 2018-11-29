#!/bin/sh

#===
# run_cutadapt.PE.template.sh
# 
# A template script for pre-processing Illumina TruSeq paried-end reads, 
# using cutadapt software.
#
# Validated cutadapt versions: 1.16
#
# author: Shuji Shigenobu <shige@nibb.ac.jp>
# date:   Nov 29, 2018
#

#=== server dependent setting ===
#
# For Univa Grid Engine
#$ -S /bin/bash
#$ -V
#$ -cwd
#
# For Environment Modules
module load cutadapt

#=== Config ===
INPUT1=%SEQ1%
QV=30
O=8
MINCUT=25

#===



UNIV_ADAPTER_COMP=AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT
IDX_CONS=AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC

OUTPUT1=`basename $INPUT1 .fastq.gz`.cln.Q${QV}L${MINCUT}.fastq.gz

CUTADAPT=cutadapt



$CUTADAPT \
  -q $QV \
  -O $O \
  -a $IDX_CONS $INPUT \
  --minimum-length $MINCUT \
  -o $OUTPUT1 \
  $INPUT1 \


# Other popular options:
# --quality-base=33 or 64
#   usually 33, but 64 for old Illumina

# Reference
# - cutadapt manuals / section on illumina-truseq: 
#    http://cutadapt.readthedocs.org/en/stable/guide.html#illumina-truseq
#

