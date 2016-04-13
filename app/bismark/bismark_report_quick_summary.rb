## bismark_quick_summary.rb
## -- parse bismark summary report file *_bismark_bt2_SE_report.txt
##    and output the data in a line (or other way inthe future)

file = ARGV[0]
outfmt = (ARGV[1] || "line")

txt = File.open(file).read

dat = {}

m = /^Sequences analysed in total:(.+?)\n/.match(txt)
 dat['num_reads'] =  m[1].strip.to_i

m = /^Number of alignments with a unique best hit from the different alignments:(.+?)\n/.match(txt)
 dat['aligned_reads'] = m[1].strip.to_i
 dat['maprate'] = dat['aligned_reads'].to_f/dat['num_reads']

m = /^C methylated in CpG context:\s+([0-9\.]+)\%/.match(txt)
 dat['percent_CpG'] = m[1]

case  outfmt 
when "line"
  puts [File.basename(file, "_bismark_bt2_SE_report.txt"),
      dat['num_reads'], dat['aligned_reads'], 
      sprintf("%.2f", dat['maprate']), "#{dat['percent_CpG']}%"
     ].join("\t")
else
  p dat
end

## (ex) input file
=begin
Sequences analysed in total:    10985702
Number of alignments with a unique best hit from the different alignments:      5697086
Mapping efficiency:     51.9%
Sequences with no alignments under any condition:       4767354
Sequences did not map uniquely: 521262
Sequences which were discarded because genomic sequence could not be extracted: 438

Number of sequences with unique best (first) alignment came from the bowtie output:
CT/CT:  173642  ((converted) top strand)
CT/GA:  176854  ((converted) bottom strand)
GA/CT:  2667586 (complementary to (converted) top strand)
GA/GA:  2678566 (complementary to (converted) bottom strand)

Final Cytosine Methylation Report
=================================
Total number of C's analysed:   114098742

Total methylated C's in CpG context:    1285388
Total methylated C's in CHG context:    248751
Total methylated C's in CHH context:    855239
Total methylated C's in Unknown context:        444

Total unmethylated C's in CpG context:  17050003
Total unmethylated C's in CHG context:  25109070
Total unmethylated C's in CHH context:  69550291
Total unmethylated C's in Unknown context:      12086

C methylated in CpG context:    7.0%
C methylated in CHG context:    1.0%
C methylated in CHH context:    1.2%
=end
