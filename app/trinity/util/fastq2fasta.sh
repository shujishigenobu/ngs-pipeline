FASTQ=$1
FASTA=$2

TRINITY_BASE=~/bio/Applications/trinityrnaseq_r20140413p1/

$TRINITY_BASE/trinity-plugins/fastool/fastool \
  --illumina-trinity \
  --to-fasta \
  $FASTQ > $FASTA