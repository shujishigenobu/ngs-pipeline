#!/bin/bash
set -e
set -u
set -o pipefail
ulimit -a

INPUT_BAMS=%FILES%
OUTPUT_BAM=%OUTBAM%
NCPU=8
MEM=48G

## concatenate multiple bam files into a single bam
samtools cat  \
  -o $OUTPUT_BAM \
  $INPUT_BAMS

## sort

OUTPUT_BAM2=`basename $OUTPUT_BAM .bam`.sorted.bam

samtools sort  \
  -@ $NCPU \
  -m $MEM \
  -o $OUTPUT_BAM2 \
  $OUTPUT_BAM

## index

samtools index $OUTPUT_BAM2


