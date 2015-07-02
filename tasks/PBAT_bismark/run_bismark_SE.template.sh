#!/bin/sh

BISMARK_BASE=~/bio/Applications/bismark_v0.14.3
GENOME_DIR=genome_Rspe
SEQ1=idx2_CGATGT_L001_R1_001.clnq30.fq
NCPU=2
OUT=bismark_out_L1x2


$BISMARK_BASE/bismark \
  --bowtie2 \
  -p $NCPU \
  --non_directional \
  --unmapped \
  -o $OUT \
  $GENOME_DIR \
  $SEQ1 \
