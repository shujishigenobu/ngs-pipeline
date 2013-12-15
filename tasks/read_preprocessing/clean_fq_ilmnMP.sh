#!/bin/sh

# trim MP adaptor ligated to 5' of the reads
# quality filtering is also applied

DATADIR=Reads
#DATADIR=./
INPUT=$DATADIR/idx1_ATCACG_L003_R1_001.fastq.gz


QV=30
QB=33
##    QB=Quality_Base: usually 33, but 64 for old Illumina 

#=== Step 1: trim 3' adaptor


ADPT_JUNCT=CTGTCTCTTATACACATCTAGATGTGTATAAGAGACAG


INPUT_EXT=`basename $INPUT .gz`
OUTPUT=`basename $INPUT_EXT .fastq`.clnq1.fq

# zcat $INPUT > $INPUT_EXT
cutadapt -a $ADPT_JUNCT \
  --overlap=10 \
  --minimum-length=50 \
  --quality-base=$QB \
  -q $QV \
  $INPUT  > $OUTPUT

#=== Step 2: discard reads starting from adaptor

ADPT_JUNCT_SINGLE=CTGTCTCTTATACACATCT 
ADPT_JUNCT_SINGLE_REVCOMP=AGATGTGTATAAGAGACAG

INPUT2=$OUTPUT 
OUTPUT2=`basename $INPUT_EXT .fastq`.clnq2.fq

# zcat $INPUT > $INPUT_EXT
cutadapt \
  -g $ADPT_JUNCT \
  -g $ADPT_JUNCT_SINGLE \
  -g $ADPT_JUNCT_SINGLE_REVCOMP \
  --overlap=10 \
  --minimum-length=50 \
  --error-rate=0.05 \
  --untrimmed-output=$OUTPUT2 \
  $INPUT2  > /dev/null




