ASSEMBLY=Trinity.fasta
MATRIX_TRANS=salmon.isoform.TPM.not_cross_norm
MIN_TPM=1.0

TRINITY_BASE=~/bio/apps/Trinity-v2.8.4/

## Select one transcript per gene based on the expression level (choose highest)

ASSEMBLY_ONE_TRANS_PER_GENE=`basename $ASSEMBLY .fasta`.one_transcript_per_gene.fasta

$TRINITY_BASE/util/filter_low_expr_transcripts.pl \
  --matrix $MATRIX_TRANS \
  --transcripts $ASSEMBLY \
  --trinity_mode \
  --highest_iso_only \
  1> ${ASSEMBLY_ONE_TRANS_PER_GENE} \
  2> ${ASSEMBLY_ONE_TRANS_PER_GENE}.log \


## Filter lowly expressed transcripts

ASSEMBLY_FILTERED_LOWEXP=`basename $ASSEMBLY .fasta`.flt.minTPM.${MIN_TPM}.fasta

$TRINITY_BASE/util/filter_low_expr_transcripts.pl \
  --matrix $MATRIX_TRANS \
  --transcripts $ASSEMBLY \
  --min_expr_any $MIN_TPM \
  --trinity_mode \
  1> ${ASSEMBLY_FILTERED_LOWEXP} \
  2> ${ASSEMBLY_FILTERED_LOWEXP}.log \

## Select one transcript per gene and filter lowly expressed transcripts

ASSEMBLY_NR_FILTERED_LOWEXP=`basename $ASSEMBLY .fasta`.one_transcript_per_gene.flt.minTPM.${MIN_TPM}.fasta

$TRINITY_BASE/util/filter_low_expr_transcripts.pl \
  --matrix $MATRIX_TRANS \
  --transcripts $ASSEMBLY \
  --min_expr_any $MIN_TPM \
  --trinity_mode \
  --highest_iso_only \
  1> ${ASSEMBLY_NR_FILTERED_LOWEXP} \
  2> ${ASSEMBLY_NR_FILTERED_LOWEXP}.log \


