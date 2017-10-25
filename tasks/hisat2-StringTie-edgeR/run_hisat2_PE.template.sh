SEQ1=%SEQ1%
SEQ2=%SEQ2%
NAME=%NAME%

#mkdir $NAME

REF=../../Data/Acyrthosiphon_pisum/NIBB_ApisBuc1/hisat2/ApisBuc1.genome
OUTBAM=${NAME}.on.`basename $REF`.hs2.bam
NCPU=8

hisat2 -p $NCPU --dta \
  -x $REF \
  -1 $SEQ1 \
  -2 $SEQ2 \
  | samtools view -bS - \
  > $OUTBAM


