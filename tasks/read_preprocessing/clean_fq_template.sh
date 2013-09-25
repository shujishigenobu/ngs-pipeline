#!/bin/sh

DATADIR=../../Data/Illumina_Runs/120117_SN676_0100_BD0EM9ABXX/Lane_08_Hayashi
INPUT=$DATADIR/<%= FILE_NAME %>

QV=30
QB=33
##    QB=Quality_Base: usually 33, but 64 for old Illumina 


ADPT1=ATCTCGTATGCCGTCTTCTGCTTG
ADPT2=AATGATACGGCGACCACCGAGATCTACACTCTTTCCCTACACGACGCTCTTCCGATCT
## These above are normal TruSeq adaptors

INPUT_EXT=`basename $INPUT .gz`
OUTPUT=`basename $INPUT_EXT .fq`.clnq$QV.fq

# zcat $INPUT > $INPUT_EXT
cutadapt -b $ADPT1 -b $ADPT2 --quality-base=$QB -q $QV $INPUT  > $OUTPUT.tmp
# ruby ezclean_fastq.rb $OUTPUT.tmp | gzip > $OUTPUT.gz
ruby ezclean_fastq.rb $OUTPUT.tmp > $OUTPUT

rm $OUTPUT.tmp




