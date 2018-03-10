#=== conf ===
TDDIR=Trinity_CarIp_180309p1.fasta.transdecoder_dir
DB=uniprot_ref_proteomes.diamond
NCPU=30
LOGF=run_TransDecoder_step02Bd_diamond.sh.log
#===

#if [ -z "PBS_O_WORKDIR" ]; then
cd $PBS_O_WORKDIR
#fi

 
QUERY=$TDDIR/longest_orfs.pep
TASK=blastp
EVALUE=1.0e-5
OUTF=`basename $QUERY`.vs.`basename $DB`.${TASK}.dmnd.out
FORMAT=6
 
diamond $TASK \
 --query $QUERY \
 --db  $DB \
 --evalue $EVALUE \
 --threads $NCPU \
 --outfmt $FORMAT \
 --max-target-seqs 1 \
 --out $OUTF \
 >$LOGF 2>&1



# --sensitive \
