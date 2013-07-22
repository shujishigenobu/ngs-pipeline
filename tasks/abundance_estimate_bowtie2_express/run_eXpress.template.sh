NAME=%NAME%
NCPU=8
OUTDIR=$NAME/express_out
 
BAM=$NAME/hits.sam
REF=Trinity.Ntak_121217p11.fa
 
express \
 -p $NCPU \
 -o $OUTDIR \
 -B 2 \
 $REF $BAM \