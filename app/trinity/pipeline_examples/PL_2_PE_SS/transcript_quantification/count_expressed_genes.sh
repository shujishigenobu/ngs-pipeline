MATRIX_GENE=salmon.gene.TPM.not_cross_norm
MATRIX_TRANS=salmon.isoform.TPM.not_cross_norm

TRINITY_BASE=~/bio/apps/Trinity-v2.8.4/

$TRINITY_BASE/util/misc/count_matrix_features_given_MIN_TPM_threshold.pl \
  $MATRIX_GENE > $MATRIX_GENE.counts_by_min_TPM

$TRINITY_BASE/util/misc/count_matrix_features_given_MIN_TPM_threshold.pl \
  $MATRIX_TRANS > $MATRIX_TRANS.counts_by_min_TPM

