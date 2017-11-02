#!/bin/sh

#=== conf ===
REFIDX=PLEWA02_ORF.cds.fa.kallisto.idx
NCPU=4
BS=100
#
# Note)
# This template is used for generating batch scripts using ezjob utility
#===


NAME=%NAME% 
# ex) idx12_single

SEQ1=%SEQ1%
SEQ2=%SEQ2%

OUTDIR=kallisto_out_$NAME

kallisto quant \
  -i $REFIDX \
  -o $OUTDIR \
  -b $BS \
  -t $NCPU \
  $SEQ1 $SEQ2



