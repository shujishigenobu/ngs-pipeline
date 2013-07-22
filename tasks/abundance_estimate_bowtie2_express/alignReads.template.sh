#!/bin/sh

NAME=%NAME% 
# ex) idx12_single

SEQ1=%SEQ1%
SEQ2=%SEQ2%

OUTSAM=hits.sam

REFIDX=Trinity.Ntak_121217p11.fa

NCPU=8

mkdir $NAME

bowtie2 -a \
 -1 $SEQ1 -2 $SEQ2 \
 -p $NCPU \
 -x $REFIDX \
 --end-to-end \
 --phred64 \
 -S $NAME/hits.sam


echo "Finished: " `date`

