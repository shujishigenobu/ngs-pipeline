#!/bin/sh
#$ -S /bin/bash
#$ -cwd
 
QUERY=Trinity_Diac_Run1Allp1.fasta
IDENT=%IDENT%
OUTF=`basename $QUERY .fa`.cdest"${IDENT/./}"aS80aL00.fa

echo  $OUTF

cd-hit-est \
-i $QUERY \
-c $IDENT \
-G 0 \
-g 1 \
-aS 0.8 -aL 0.0 \
-r 1 -T 8 -M 0 \
-d 0 \
-o $OUTF