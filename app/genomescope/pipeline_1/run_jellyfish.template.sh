#!/bin/bash

ZFILE1=Reads/Ooba-reseq1-12_R1.fastq.gz
ZFILE2=Reads/Ooba-reseq1-12_R2.fastq.gz
NCPU=20
KMER=21
SIZE=8G
OUTF=`basename $ZFILE1 _R1.fastq.gz`.k${KMER}.jf
JELLYFISH="$HOME/bio/apps/jellyfish-2.2.10/jellyfish-linux"
#"/home/shige/bio/applications/jellyfish/bin/jellyfish"

###
# count

$JELLYFISH count \
 -t $NCPU \
 -m $KMER \
 -C \
 -s $SIZE \
 -o $OUTF \
 -F 2 \
 <(zcat $ZFILE1) <(zcat $ZFILE2)

###
# histogram

$JELLYFISH histo \
 -t $NCPU \
 $OUTF > $OUTF.histo

