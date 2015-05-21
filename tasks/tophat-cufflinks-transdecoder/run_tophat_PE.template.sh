#!/bin/sh
#$ -l nc=8
 
NAME=%NAME%
OUT=tophat_out_$NAME
SEQ1=%SEQ1%
SEQ2=${SEQ1/_R1_/_R2_}
 
NCPU=8
BOWTIEIDX=Rpal.genome.pl140405.fa
# GTF=$REFDIR/Annotations/AphidBase_OGS2.1.v2.gtf
# TPIDX=AphidBase_OGS2.1.v2.1.bt2
 
tophat -p $NCPU -o $OUT \
 $BOWTIEIDX $SEQ1 $SEQ2


