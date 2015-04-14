featureCounts \
  -s 2 \
  --primary \
  -T 8 \
  -t CDS -g gene_id -a RsGM8.gtf \
  -o counts.txt \
tophat_out_Rs21idx1/accepted_hits.bam \
tophat_out_Rs21idx2/accepted_hits.bam \
tophat_out_Rs21idx4/accepted_hits.bam \
...


