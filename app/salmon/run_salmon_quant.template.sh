
module load salmon/1.2.1

# cd ${PBS_O_WORKDIR}

READ1=%SEQ1%
READ2=%SEQ2%

NAME=%NAME%
REF=transcripts_apisum_buchnera_ApOk_v0.2.fasta.salmon.idx
NCPU=24

salmon quant \
  -i $REF \
  -l A \
  -1 $READ1 \
  -2 $READ2 \
  -o salmon_out_${NAME} \
  -p $NCPU


