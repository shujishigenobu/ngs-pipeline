## bismark_quick_summary.rb
## -- parse bismark summary report file *_bismark_bt2_SE_report.txt
##    and output the data in a line (or other way inthe future)

file = ARGV[0]

dat = []
keys = []
File.open(file).each_with_index do |l, i|
  if i <= 3
    ## skip header lines
    keys[i] = nil
    dat[i] = nil
  elsif /:.+\d+.+/.match(l)
    a = l.chomp.split(/:/)
    key = a[0].strip
    val = a[1].strip
    val.sub!(/\t.+/, '')
#     [key, val]
    dat[i] = val
    keys[i] = key
  else
    keys[i] = nil
    dat[i] = nil
  end
end

puts [File.basename(file), dat].flatten.join("\t")

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
