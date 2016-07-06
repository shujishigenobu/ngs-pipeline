echo "SEQ1="
ruby -e 'puts Dir["Reads_cleaned/*_1.fastq*"].join"," '
echo ""
echo "SEQ2="
ruby -e 'puts Dir["Reads_cleaned/*_1.fastq*"].map{|x| x.sub(/_1\.fastq/, "_2.fastq")}.join"," '



