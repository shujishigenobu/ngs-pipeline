PFAMDB=~/bio/Applications/interproscan-5.4-47.0/data/pfam/27.0/Pfam-A.hmm
NCPU=1
QUERY=%FASTA%
OUT=`basename $QUERY`.pfam.domtblout

#QUERY=transcripts.fasta.transdecoder_dir/longest_orfs.pep

hmmscan \
  --cpu $NCPU \
  --domtblout $OUT \
  $PFAMDB \
  $QUERY
