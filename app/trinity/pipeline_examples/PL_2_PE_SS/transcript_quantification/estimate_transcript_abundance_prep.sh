ASSEMBLY=Trinity.fasta

TRINITY_BASE=~/bio/apps/Trinity-v2.8.4/

$TRINITY_BASE/util/align_and_estimate_abundance.pl \
  --transcripts $ASSEMBLY \
  --est_method salmon  \
  --seqType fq \
  --SS_lib_type RF \
  --prep_reference \
  --trinity_mode \
