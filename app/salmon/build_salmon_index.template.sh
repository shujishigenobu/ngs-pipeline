FASTA=TrinityORF_CerJa2.cds.fasta
KSIZE=31

IDXNAME=`basename $FASTA`.salmon_quasi.idx

salmon index \
  -t $FASTA \
  -i $IDXNAME \
  --type quasi \
  -k $KSIZE \
