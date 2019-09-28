#!/bin/sh

#=== conf ===
REFIDX=ApL_SN190824_pseudohap2.1
NCPU=32
#
#===


OUTBAM=10xLinkedReads.on.`basename $REFIDX`.bam
# ex) idx12_single

SEQ=barcoded.fastq.gz

bowtie2 \
 --interleaved $SEQ \
 -p $NCPU \
 -x $REFIDX \
 --end-to-end \
 | samtools view -bS - \
 > $OUTBAM

## important options
# -a, -k: how to treat multiple hits

echo "Finished: " `date`

