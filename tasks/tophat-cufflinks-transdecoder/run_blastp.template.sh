QUERY=%FASTA%
OUT=`basename $QUERY`.blastp.outfmt6

blastp -query $QUERY \
   -db orthodb8_euk_nr90.pep.fa -evalue 1.0e-4 -num_threads 1 -outfmt 6 -max_target_seqs 1 > $OUT