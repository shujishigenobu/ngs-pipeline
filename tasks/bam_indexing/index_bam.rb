#!/bin/ruby

#=== config
MAX_MEMORY = "4G"
NCPU = 40
#===


$bam = ARGV[0]
$name = ARGV[1]

bam_unsorted = $bam


STDERR.puts "# sorting bam"
if $name
  bam_sorted_out = $name + "." + File.basename(bam_unsorted, '.bam') + ".sorted.bam"
else
  bam_sorted_out = bam_unsorted.sub(/\.bam/, ".sorted.bam")
end

cmd = "samtools sort -m #{MAX_MEMORY} -o #{bam_sorted_out} -@ #{NCPU} #{bam_unsorted} "
IO.popen(cmd){}

STDERR.puts "# indexing bam"
STDERR.puts bam_sorted_out
cmd = "samtools index -@ #{NCPU} #{bam_sorted_out}"
IO.popen(cmd){}

#File.delete(bam_unsorted)

STDERR.puts "# completed"
