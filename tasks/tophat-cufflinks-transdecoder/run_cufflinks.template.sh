TARGETDIR=%TARGETDIR%
BAM=$TARGETDIR/accepted_hits.bam
GENOME=../../140211-RspeGenome_Annot/Rspe02.final.assembly.fa
OUTDIR=$TARGETDIR

NCPU=8


cufflinks  \
 -o $OUTDIR \
 -b $GENOME \
 -u \
 -p $NCPU \
 $BAM