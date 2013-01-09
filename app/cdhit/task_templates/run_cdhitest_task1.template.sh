#!/bin/sh
#$ -S /bin/bash
#$ -cwd
 
QUERY=tmp.txt
IDENT=96
OUTF=`basename $QUERY .fa`.cdest"$IDENT".fa
 
cd-hit-est \
-i $QUERY \
-c 0.$IDENT \
-g 1 \
-r 1 -T 12 -M 0 \
-d 0 \
-o $OUTF