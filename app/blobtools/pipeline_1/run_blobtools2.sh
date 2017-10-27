
BLOBTOOLS=~/bio/applications/blobtools/blobtools

OUT=blobplot2

## 
# 1. Create a BlobDB

$BLOBTOOLS create \
  -i Heike2.2.final.assembly.fasta \
  -b hits.sorted.bam \
  -t Heike2.2.final.assembly.fasta_ALL.fasta.vs.nt.megablast.fmt6 \
  -t Heike2.2.final.assembly.shuffled.fasta_ALL.fasta.vs.uniprot_ref_proteomes.diamond.dmnd.blastx.dmnd.taxified.out \
  -o $OUT \


# 2. Generate a tabular view

$BLOBTOOLS view \
  -i $OUT.blobDB.json \
  -x bestsumorder \
  -o $OUT

$BLOBTOOLS view \
  -i $OUT.blobDB.json \
  -x bestsum \
  -o $OUT


# 3. Generate a blobplot
$BLOBTOOLS plot \
  -i $OUT.blobDB.json \
  -x bestsumorder \
  -o blobplot2

$BLOBTOOLS plot \
  -i $OUT.blobDB.json \
  -x bestsum \
  -o blobplot2


