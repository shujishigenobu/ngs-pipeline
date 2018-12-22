ASSEMBLY=Trinity.fasta
SAMPLES_FILE=samples.txt
NCPU=16

TRINITY_BASE=~/bio/apps/Trinity-v2.8.4/

$TRINITY_BASE/util/align_and_estimate_abundance.pl \
  --transcripts $ASSEMBLY \
  --est_method salmon  \
  --seqType fq \
  --trinity_mode \
  --SS_lib_type RF \
  --samples_file $SAMPLES_FILE \
  --thread_count $NCPU \

