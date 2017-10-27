#!/bin/sh

# SGE PAREMETERS
#$ -S /bin/bash
#$ -cwd
#$ -l nc=24

#=== conf ===
NCPU=32
#===


QUERY=%FASTAF%
DB=uniprot_ref_proteomes.diamond.dmnd
TASK=blastx
EVALUE=1.0e-25
OUTF=`basename $QUERY`.vs.`basename $DB`.${TASK}.dmnd.out
FORMAT=6

diamond $TASK \
 --query $QUERY \
 --db  $DB \
 --sensitive \
 --evalue $EVALUE \
 --threads $NCPU \
 --outfmt $FORMAT \
 --max-target-seqs 1 \
 --out $OUTF \
