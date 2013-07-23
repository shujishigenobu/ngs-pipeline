#=== config ===
NCPU=8
REF=Trinity.fasta
#===

NAME=%NAME%

OUTDIR=$NAME/express_out
 
BAM=$NAME/hits.bam

 
express \
 -p $NCPU \
 -o $OUTDIR \
 -B 2 \
 $REF $BAM \