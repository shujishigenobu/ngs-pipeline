#!/bin/bash

READS_DIR=Reads_HQ_L100

NCPU=20
KMER=21
SIZE=8G
OUTF=`basename $READS_DIR`.k${KMER}.jf
JELLYFISH="$HOME/bio/apps/jellyfish-2.2.10/jellyfish-linux"
#"/home/shige/bio/applications/jellyfish/bin/jellyfish"

###
# count

zcat $READS_DIR/*.fastq.gz | \
$JELLYFISH count  \
 -t $NCPU \
 -m $KMER \
 -C \
 -s $SIZE \
 -o $OUTF \
 -F 2 \
 /dev/fd/0


###
# histogram

$JELLYFISH histo \
 -t $NCPU \
 $OUTF > $OUTF.histo

