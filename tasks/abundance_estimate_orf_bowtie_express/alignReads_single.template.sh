#!/bin/sh

#=== conf ===
REFIDX=ORF_Dcit_130927b.cds.cdest097.aS70aL00.fa
NCPU=8
#
# Note)
# This template is used for generating batch scripts using ezjob utility
#
# IMPORTANT)
# If you are aligning phred64-format fastq,
# --phred64 should be added to bowtie2 option below 
#===


NAME=%NAME% 
SEQ=%SEQ%
OUTBAM=hits.bam

mkdir $NAME

bowtie2 -a \
 -U $SEQ \
 -p $NCPU \
 -x $REFIDX \
 --local \
 | samtools view -bS - \
 > $NAME/$OUTBAM

echo "Finished: " `date`

