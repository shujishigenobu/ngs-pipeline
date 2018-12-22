
ASSEMBLY=Trinity.fasta
MATRIX_FILE=salmon.isoform.counts.matrix
OUTF=`basename $ASSEMBLY`.ExN50.stats

TRINITY_BASE=~/bio/apps/Trinity-v2.8.4/


$TRINITY_BASE/util/misc/contig_ExN50_statistic.pl \
  $MATRIX_FILE $ASSEMBLY > $OUTF

