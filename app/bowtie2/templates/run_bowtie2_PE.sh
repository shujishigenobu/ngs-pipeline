#!/bin/sh

#=== conf ===
REFIDX=Japhid_v06_CCS_consensus.quiver.fa
NCPU=8
#
# Note)
# This template is used for generating batch scripts using ezjob utility
#
# IMPORTANT)
# If you are aligning phred64-format fastq,
# --phred64 should be added to bowtie2 option below 
#===


NAME=bowtie2_out_idx5
# ex) idx12_single

SEQ1=idx5_ACAGTG_L007_R1_001.clnq30.fq
SEQ2=idx5_ACAGTG_L007_R2_001.clnq30.fq

OUTBAM=hits.bam


mkdir $NAME

bowtie2 \
 -1 $SEQ1 -2 $SEQ2 \
 -p $NCPU \
 -x $REFIDX \
 --end-to-end \
 | samtools view -bS - \
 > $NAME/$OUTBAM

## important options
# -a, -k: how to treat multiple hits

echo "Finished: " `date`

