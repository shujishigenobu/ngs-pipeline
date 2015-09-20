## for TransDecoder > github:190730

#=== conf ===
CUFF_GTF=merged_asm_isofrac10/merged.gtf
CUFF_SEQ=merged_asm_isofrac10/merged.transcripts.fasta
GENOME=../../Om2.assembly.fasta
TD_BASE=~/GitHub/TransDecoder

MIN_LEN=50 #aa
NCPU=8

#===

#$TD_BASE/util/cufflinks_gtf_to_alignment_gff3.pl \
#  $CUFF_GTF \
#  > transcripts.gff3

#$TD_BASE/util/cufflinks_gtf_genome_to_cdna_fasta.pl \
#  $CUFF_GTF $GENOME \
#  > transcripts.fasta

#$TD_BASE/TransDecoder.LongOrfs \
#  -t transcripts.fasta \
#  -m $MIN_LEN


$TD_BASE/TransDecoder.Predict --cpu $NCPU -t transcripts.fasta \
  --retain_pfam_hits pfam.domtblout \
  --retain_blastp_hits blastp.outfmt6


TD_GFF=transcripts.fasta.transdecoder.gff3
OUTF=`basename $TD_GFF .gff3`.genome.gff3

$TD_BASE/util/cdna_alignment_orf_to_genome_orf.pl \
  $TD_GFF \
  transcripts.gff3 \
  transcripts.fasta \
  > $OUTF

