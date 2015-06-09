#!/bin/sh

#DATADIR=./
#INPUT=$DATADIR/<%= FILE_NAME %>
INPUT=$1
#idx11_GGCTAC_L007_R2_001.fastq

QV=30
QB=33
##    QB=Quality_Base: usually 33, but 64 for old Illumina 


#ADPT1=GTCATAGCTGTTTCCTGCTGGCCGTCGTTTTACXXXXXXATCTCGTATGCCGTCTTCTGCTTG
ADPT1=AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT
#ADPT2=GATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT
## These above are normal TruSeq adaptors
## ADPT1 : Read1 external adapter
## ADPT2 : Read2 external adapter

INPUT_EXT=`basename $INPUT .gz`
OUTPUT=`basename $INPUT_EXT .fastq`.clnq$QV.fq

# zcat $INPUT > $INPUT_EXT
cutadapt -a $ADPT1 --overlap=8 --quality-base=$QB -q $QV $INPUT  > $OUTPUT.tmp
# ruby ezclean_fastq.rb $OUTPUT.tmp | gzip > $OUTPUT.gz






