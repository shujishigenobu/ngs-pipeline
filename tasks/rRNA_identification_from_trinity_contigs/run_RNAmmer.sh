SEQ=comp28713_c0_seq1.fa

perl ~/bio/Applications/RNAmmer-1.2/rnammer \
 -s euk \
 -m lsu,ssu,tsu \
 -h $SEQ.RNAmmer.hmmreport \
 -f $SEQ.RNAmmer.fasta \
 -gff $SEQ.RNAmmer.gff \
 < $SEQ

