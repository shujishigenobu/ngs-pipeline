QUERY=../Trinity_OdoFor140420.fa
DB=/home/DB/public/processed/SILVA/release_108/SSURef_108_NR_tax_silva_v2.fasta
FORMAT=6
#FORMAT=0
NCPU=8
EVALUE=1.0e-40
NTARGET=5
 
OUTF=`basename $QUERY`.vs.`basename $DB`.bl$FORMAT

blastn \
-task megablast \
-db $DB \
-query $QUERY \
-evalue $EVALUE \
-soft_masking true \
-dust yes \
-num_threads  $NCPU  \
-outfmt $FORMAT \
-max_target_seqs $NTARGET \
-out $OUTF \

