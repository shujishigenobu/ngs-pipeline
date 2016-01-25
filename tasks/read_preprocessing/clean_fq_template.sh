#!/bin/sh
#
# WARNING: this script still works well, but a newer one run_cutadapt.PE.template.sh
# is recommended because the nerwer is designed to work with the latest cutadapt that
# can treat PE reads properly.
#
DATADIR=./
INPUT=$DATADIR/<%= FILE_NAME %>
#idx11_GGCTAC_L007_R2_001.fastq

QV=30
QB=33
##    QB=Quality_Base: usually 33, but 64 for old Illumina 


ADPT1=GATCGGAAGAGCACACGTCTGAACTCCAGTCA
ADPT2=GATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT
## These above are normal TruSeq adaptors
## ADPT1 : Read1 external adapter
## ADPT2 : Read2 external adapter

INPUT_EXT=`basename $INPUT .gz`
OUTPUT=`basename $INPUT_EXT .fastq`.clnq$QV.fq

# zcat $INPUT > $INPUT_EXT
cutadapt -a $ADPT1 -a $ADPT2 --overlap=8 --quality-base=$QB -q $QV $INPUT  > $OUTPUT.tmp
# ruby ezclean_fastq.rb $OUTPUT.tmp | gzip > $OUTPUT.gz
ruby ezclean_fastq.rb $OUTPUT.tmp > $OUTPUT

rm $OUTPUT.tmp




