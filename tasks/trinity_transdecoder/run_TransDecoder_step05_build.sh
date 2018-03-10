TDDIR=~/bio/apps/TransDecoder-v5.0.2/

TASSEMBLY=Trinity_CarIp_180309p1.fasta
CDHITCDS=$TASSEMBLY.transdecoder.cds.cdhit97.fa
TDGFF3=$TASSEMBLY.transdecoder.gff3

OUTBASE=TrinityORF_CarIp_180309p1_NR
#OUTBASE=ORF_TD

seqkit faidx $CDHITCDS

echo $CDHITCDS.fai

ruby get_gff_entries_from_faidx.rb $TDGFF3 $CDHITCDS.fai > $OUTBASE.gff3

perl $TDDIR/util/gff3_file_to_bed.pl $OUTBASE.gff3 > $OUTBASE.bed

perl $TDDIR/util/gff3_file_to_proteins.pl --gff3 $OUTBASE.gff3 --fasta $TASSEMBLY --seqType prot > $OUTBASE.pep.fa
perl $TDDIR/util/gff3_file_to_proteins.pl --gff3 $OUTBASE.gff3 --fasta $TASSEMBLY --seqType CDS > $OUTBASE.cds.fa


