#!/bin/sh
 
# SGE PARAMETERS
#$ -S /bin/bash
#$ -q small
#$ -pe smp 2
#$ -cwd
 
 
#=== config ===
NCPU=5
EVALUE=1.0e-25
NHITS=10
TASK=megablast
#===
 
QUERY=%FASTAF%
DB=/bio/db/blast/db/nt
OUTF=`basename $QUERY`.vs.`basename $DB`.${TASK}.fmt6
FORMAT="6 qseqid staxids bitscore std"
 
blastn -query $QUERY \
-db  $DB \
-task $TASK \
-evalue $EVALUE \
-num_threads $NCPU \
-outfmt "$FORMAT" \
-max_hsps 1 \
-max_target_seqs 10 \
-out $OUTF \
