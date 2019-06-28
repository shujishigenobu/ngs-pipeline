GENOMESCOPE=/home/shige/bio/apps/genomescope-Feb16_2018/genomescope.R
HISTO_FILE=Ooba-reseq1-6.k21.jf.histo
KMER=21
READLEN=151
KMERMAX=10000

OUTDIR=$HISTO_FILE.genomescope

Rscript $GENOMESCOPE \
  $HISTO_FILE $KMER $READLEN $OUTDIR $KMERMAX

