#!/bin/sh

BISMARK_BASE=~/bio/Applications/bismark_v0.14.3
GENOME_DIR=genome_Rspe
BAM=idx6_bismark.bam
NCPU=8
MEM=24G
OUT=bismark_out_idx6_merged


ulimit -a

##
# single end reads

$BISMARK_BASE/bismark_methylation_extractor \
  -s \
  --bedGraph \
  --cytosine_report \
  --counts \
  --no_overlap \
  --multicore $NCPU \
  --buffer_size $MEM \
  --scaffolds \
  --genome_folder $GENOME_DIR \
  --ignore 4 \
  -o $OUT \
  $BAM

