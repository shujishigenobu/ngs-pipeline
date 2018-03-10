## for TransDecoder > github:190730

#=== conf ===
TDDIR=~/bio/apps/TransDecoder-v5.0.2
TRANSCRIPT=Trinity_CarIp_180309p1.fasta
NCPU=8
#PFAM=longest_orfs.pep.pfam.domtblout
BLAST=longest_orfs.pep.vs.uniprot_ref_proteomes.diamond.blastp.dmnd.out
#===

cd $PBS_O_WORKDIR

$TDDIR/TransDecoder.Predict --cpu $NCPU -t $TRANSCRIPT \
  --retain_blastp_hits $BLAST \


#  --retain_pfam_hits $PFAM \

#TD_GFF=stringtie_merged.transcripts.fasta.transdecoder_dir/longest_orfs.gff3
#OUTF=`basename $TD_GFF .gff3`.genome.gff3

#$TD_BASE/util/cdna_alignment_orf_to_genome_orf.pl \
#  $TD_GFF \
#  transcripts.gff3 \
#  transcripts.fasta \
#  > $OUTF

