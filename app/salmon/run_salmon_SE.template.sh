#!/bin/sh

#=== conf ===
REFIDX=TrinityORF_CerJa2.cds.fasta.salmon_quasi.K31.idx
NCPU=4
LIBTYPE=U
#
#===


NAME=%NAME% 
# ex) idx12_single

SEQ=%SEQ%

OUTDIR=salmon_out_$NAME

salmon quant \
  -i $REFIDX \
  -l $LIBTYPE \
  -o $OUTDIR \
  -p $NCPU \
  -r $SEQ \

