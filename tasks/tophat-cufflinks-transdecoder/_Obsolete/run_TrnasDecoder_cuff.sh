
CUFF_OUTDIR=merged_asm_isofrac10
GENOME=../../140211-RspeGenome_Annot/Rspe02.final.assembly.fa

TD_BASE=/home/shige/bio/Applications/trinityrnaseq_r20140413p1/trinity-plugins/TransDecoder_r20131110


$TD_BASE/util/cufflinks_gtf_to_alignment_gff3.pl $CUFF_OUTDIR/merged.gtf \
 > merged.transcripts.gff3

$TD_BASE/util/cufflinks_gtf_genome_to_cdna_fasta.pl \
 $CUFF_OUTDIR/merged.gtf $GENOME \
 > $CUFF_OUTDIR/merged.transcripts.fasta

 $TD_BASE/TransDecoder -t $CUFF_OUTDIR/merged.transcripts.fasta


TD_GFF=merged.transcripts.fasta.transdecoder.gff3
OUTF=`basename $TD_GFF .gff3`.genome.gff3

$TD_BASE/cdna_alignment_orf_to_genome_orf.pl \
 $TD_GFF merged.transcripts.gff3 $CUFF_OUTDIR/merged.transcripts.fasta \
 > $OUTF