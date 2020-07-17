#!/bin/sh
#$ -S /bin/bash
#$ -cwd

# for PBS Pro
# cd ${PBS_O_WORKDIR}

#===
# run_cutadapt.NexteraXT.template.sh
# 
# A template script for pre-processing Illumina NexteraXT paried-end reads, 
# using cutadapt software.
#
# Validated cutadapt versions: 2.9
#
# author: Shuji Shigenobu <shige@nibb.ac.jp>
# date:   April 23, 2020
#

OVERHANG_COMMON_REV=CTGTCTCTTATACACATCT

QV=20
O=8
MINCUT=50
FIXEDLEN=150
INPUT1=%SEQ1%
INPUT2=%SEQ2%
NCPU=1

OUTPUT1=`basename $INPUT1 .fastq.gz`.cln.Q${QV}L${MINCUT}.fastq.gz
OUTPUT2=`basename $INPUT2 .fastq.gz`.cln.Q${QV}L${MINCUT}.fastq.gz

CUTADAPT=cutadapt

$CUTADAPT \
  -q $QV \
  -O $O \
  -a $OVERHANG_COMMON_REV \
  -A $OVERHANG_COMMON_REV \
  --minimum-length $MINCUT \
  --trim-n \
  --nextseq-trim=20 \
  -l $FIXEDLEN \
  -o $OUTPUT1 \
  -p $OUTPUT2 \
  -j $NCPU \
  $INPUT1 \
  $INPUT2

# Other popular options:
# --quality-base=33 or 64
#   usually 33, but 64 for old Illumina
#  -l $FIXEDLEN \

# Nextera XT
# Nextera transposase adapters
# (a) Read 1 -->
# 5’ TCGTCGGCAGCGTCAGATGTGTATAAGAGACAG
#
# (d) Read 2 --> 
# 5’ GTCTCGTGGGCTCGGAGATGTGTATAAGAGACAG
#
# Nextera Index Kit - PCR primers
# Index 1 (i7)
# 5’ CAAGCAGAAGACGGCATACGAGAT[i7]GTCTCGTGGGCTCGG
#
# Index 2 (i5)
# 5’ AATGATACGGCGACCACCGAGATCTACAC[i5]TCGTCGGCAGCGTC

# Reference
# - cutadapt manuals / section on illumina-truseq: 
#    http://cutadapt.readthedocs.org/en/stable/guide.html#illumina-truseq
# - Illumina Adapter Sequences Document
#    https://jp.support.illumina.com/downloads/illumina-adapter-sequences-document-1000000002694.html

