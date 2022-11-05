#!/bin/sh
#
 
#SBATCH -N 1
#SBATCH -n 8
 
 
#===
# A template script for pre-processing Illumina paried-end reads
# with UD indexes generated with Illumina Stranded mRNA Prep Kit
# (#20040532, 20040534),  using cutadapt software.
#
# Validated cutadapt versions: 3.4
#
# author: Shuji Shigenobu <shige@nibb.ac.jp>
# date:  November 6, 2022
#
 
 
OVERHANG=ACTGTCTCTTATACACATCT
# CTGTCTCTTATACACATCT is the adapter seq to be removed for libraries
# made with Nextera, Illumina Prep or Illumina PCR Kits.
# For the reads generated from Illumina Strande mRNA Prep Kit, T-overhang
# added at the end of the adapter should be removed. So complement A is
# added at the beginning of target overhang sequence above.
 
QV=20
O=8
MINCUT=25
INPUT1={{READ1}}
INPUT2={{READ2}}
NCPU=8
 
OUTPUT1=`basename $INPUT1 .fastq.gz`.cln.Q${QV}L${MINCUT}.fastq.gz
OUTPUT2=`basename $INPUT2 .fastq.gz`.cln.Q${QV}L${MINCUT}.fastq.gz
 
CUTADAPT=cutadapt
 
$CUTADAPT \
  -u 1 \
  -U 1 \
  -q $QV \
  -O $O \
  -a $OVERHANG \
  -A $OVERHANG \
  --minimum-length $MINCUT \
  --trim-n \
  -o $OUTPUT1 \
  -p $OUTPUT2 \
  -j $NCPU \
  $INPUT1 \
  $INPUT2
 
# -u 1, -U 1 : Remove first nucleotide from both of Read1 and Read2.
#              These options remove T-overhang that appeared at the
#              beginning of the reads.
# --nextseq-trim=20 : you may want to use --nextseq-trim option if
#              you sequenced the reads with a NextSeq platform.
 
echo "complete: `date`\n"
 
# Index 1 (i7) Adapters
#CAAGCAGAAGACGGCATACGAGAT[i7]GTCTCGTGGGCTCGG
 
#Index 2 (i5) Adapters
#AATGATACGGCGACCACCGAGATCTACAC[i5]TCGTCGGCAGCGTC
 
 
# i5(index2)-----INSERT-----i7(index1)
#           >>>>>>>>>>
#           Read1
#                    <<<<<<<
#                      Read2
#
# >i7
# CAAGCAGAAGACGGCATACGAGATNNNNNNNNNNGTCTCGTGGGCTCGG
# >i7_reverse_complement
# CCGAGCCCACGAGACNNNNNNNNNNATCTCGTATGCCGTCTTCTGCTTG
# >i5
# AATGATACGGCGACCACCGAGATCTACACNNNNNNNNNNTCGTCGGCAGCGTC
# >i5_reverse_complement
# GACGCTGCCGACGANNNNNNNNNNGTGTAGATCTCGGTGGTCGCCGTATCATT
