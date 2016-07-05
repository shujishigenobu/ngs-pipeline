for f in *sra
do
  fastq-dump --split-files --origfmt  $f
done
