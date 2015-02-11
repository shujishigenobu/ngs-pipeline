#!/bin/sh
#$ -l nc=8
 
NAME=%NAME%
OUT=tophat_out_$NAME
SEQ1=%SEQ1%
# SEQ2=${SEQ1/_R1_/_R2_}

BOWTIEIDX=../../140211-RspeGenome_Annot/Rspe02.final.assembly
NCPU=8

# GTF=$REFDIR/Annotations/AphidBase_OGS2.1.v2.gtf
# TPIDX=AphidBase_OGS2.1.v2.1.bt2
 
tophat -p $NCPU -o $OUT \
 $BOWTIEIDX $SEQ1 


