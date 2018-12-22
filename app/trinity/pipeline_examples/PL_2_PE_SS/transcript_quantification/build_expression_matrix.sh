COUNT_FILES="all/quant.sf"
OUT_BASENAME=salmon

TRINITY_BASE=~/bio/apps/Trinity-v2.8.4/

$TRINITY_BASE/util/abundance_estimates_to_matrix.pl \
   --est_method salmon \
   --gene_trans_map Trinity.fasta.gene_trans_map \
   --out_prefix $OUT_BASENAME \
   --name_sample_by_basedir \
   $COUNT_FILES \

