
BAM=%BAM%
NAME=%NAME%
REF_GFF=AphidBase_OGS2.1.v2.gtf
NCPU=8
OUT=ballgown/$NAME/$NAME.gtf

stringtie -e -B -p $NCPU \
  -G $REF_GFF -o $OUT \
   $BAM
