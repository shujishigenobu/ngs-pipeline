#!/bin/sh

DATADIR=./
INPUT=$DATADIR/%FILE%

QV=30
QB=33
##    QB=Quality_Base: usually 33, but 64 for old Illumina 


## ADPT1: Illumina_smallRNAseq_RPIs (NNNNNN = index seq)
ADPT1=TGGAATTCTCGGGTGCCAAGGAACTCCAGTCACNNNNNNATCTCGTATGCCGTCTTCTGCTTG


INPUT_EXT=`basename $INPUT .gz`
OUTPUT=`basename $INPUT_EXT .fastq`.clnq$QV.fq

# zcat $INPUT > $INPUT_EXT
cutadapt -a $ADPT1  --overlap=8 --quality-base=$QB -q $QV $INPUT  > $OUTPUT






