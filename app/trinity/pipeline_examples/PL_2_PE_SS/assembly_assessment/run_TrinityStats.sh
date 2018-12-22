ASSEMBLY=../../Trinity_CerJa_181130b.fasta

TRINITY_HOME=~/bio/apps/Trinity-v2.8.4/util

OUT=`basename $ASSEMBLY`.stats

$TRINITY_HOME/TrinityStats.pl $ASSEMBLY > $OUT

