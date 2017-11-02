#!/bin/sh

#=== conf ===
REFIDX=Alat_OGS1.0.cds.kallisto.idx
NCPU=4
BS=100
INSERT_MEAN=210
INSERT_SD=80
#
# Note)
# This template is used for generating batch scripts using ezjob utility
#===


NAME=%NAME% 
# ex) idx12_single

SEQ1=%SEQ1%
#SEQ2=%SEQ2%

OUTDIR=kallisto_out_$NAME

mkdir $NAME

kallisto quant  --single \
  -i $REFIDX \
  -o $OUTDIR \
  -l $INSERT_MEAN -s $INSERT_SD \
  -b $BS \
  -t $NCPU \
  $SEQ1 



