#!/bin/sh

#=== conf ===
REFIDX=Trinity.fasta
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
# ex) idx12_single

SEQ1=%SEQ1%
SEQ2=%SEQ2%

OUTBAM=hits.bam


mkdir $NAME

bowtie2 -a \
 -1 $SEQ1 -2 $SEQ2 \
 -p $NCPU \
 -x $REFIDX \
 --end-to-end \
 | samtools view -bS - \
 > $NAME/$OUTBAM

echo "Finished: " `date`

