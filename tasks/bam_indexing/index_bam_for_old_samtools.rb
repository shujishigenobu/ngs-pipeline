#!/bin/ruby

##
# this script works with old versions of samtools
# use updated index_bam.rb script for new samtools
##

#=== config
MAX_MEMORY = 30000000000
#===


$bam = ARGV[0]
$name = ARGV[1]

bam_unsorted = $bam


STDERR.puts "# sorting bam"
if $name
  bam_sorted_prefix = $name + "." + File.basename(bam_unsorted, '.bam') + ".sorted"
else
  bam_sorted_prefix = File.basename(bam_unsorted, '.bam') + ".sorted"
end

cmd = "samtools sort -m #{MAX_MEMORY} #{bam_unsorted} #{bam_sorted_prefix}"
IO.popen(cmd){}

STDERR.puts "# indexing bam"
p bam_sorted = bam_sorted_prefix + ".bam"
cmd = "samtools index #{bam_sorted}"
IO.popen(cmd)

#File.delete(bam_unsorted)

STDERR.puts "# completed"
