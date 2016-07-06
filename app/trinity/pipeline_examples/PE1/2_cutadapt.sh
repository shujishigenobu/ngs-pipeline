ruby -e 'puts "#SEQ1\tSEQ2" ' > run_cutadapt.PE.template.sh.conf

\ls -1 Reads_fastq/*_1.fastq | ruby -ne 'puts "#{$_.chomp}\t#{$_.sub(/_1\.fastq/, %Q{_2\.fastq})}" ' >> run_cutadapt.PE.template.sh.conf

ruby script_templ/generate_jobs.rb run_cutadapt.PE.template.sh run_cutadapt.PE.template.sh.conf

##
## submit qsub
