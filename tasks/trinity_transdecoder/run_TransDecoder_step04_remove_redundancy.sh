SCRDIR=~/MyBitbucket/okorf2

TASSEMBLY=Trinity_CarIp_180309p1.fasta
TDBASENAME=Trinity_CarIp_180309p1.fasta.transdecoder
#OUTBASE=ORF_TD

IDENT=0.97

## Run cdhit

cd-hit-est \
 -i $TDBASENAME.cds \
 -c $IDENT \
 -G 0 \
 -g 1 \
 -aS 0.7 -aL 0.0 \
 -r 0 \
 -T 8 -M 0 \
 -d 0 \
 -o $TDBASENAME.cds.cdhit97.fa

#sh $SCRDIR/run_cdhit_cds_local_p2.sh $BASENAME.cds $OUTBASE.cds.fa.cdhit97

#fast ids $OUTBASE.cds.fa.cdhit97 > $OUTBASE.cds.fa.cdhit97.ids

#ruby $SCRDIR/get_gff_entries_from_idlist.rb $BASENAME.gff3 $OUTBASE.cds.fa.cdhit97.ids > $OUTBASE.rmdup.gff3

#GFF=$OUTBASE.rmdup.gff3

#perl $SCRDIR/util/gff3_file_to_bed.pl $GFF > `basename $GFF .gff3`.bed

#perl $SCRDIR/util/gff3_file_to_proteins.pl $GFF $TASSEMBLY prot > `basename $GFF .gff3`.pep.fa

#perl $SCRDIR/util/gff3_file_to_proteins.pl $GFF $TASSEMBLY CDS > `basename $GFF .gff3`.cds.fa
