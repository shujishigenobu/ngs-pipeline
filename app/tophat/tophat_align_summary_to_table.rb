target_dir = ARGV[0]
showhead = ARGV[1]

headers = %w{name num_reads num_mapped num_multihits perc_multihits mapping_rate }

if target_dir == "headeronly"
  puts "#" + headers.join("\t")
  exit
end

align_summary_file = "#{target_dir}/align_summary.txt"


dirname = File.dirname(align_summary_file).split(/\//)[-1]

txt = File.open(align_summary_file).read

num_reads = /Input\s+:\s+(\d+)/.match(txt)[1].to_i
m = /Mapped\s+:\s+(\d+)/.match(txt)
num_mapped = m[1].to_i
#perc_mapped = m[2]

m = /of these:\s+(\d+) \(\s*([0-9\.]+\%)\) have multiple alignments/.match(txt)
num_multihits = m[1].to_i
perc_multihits = m[2]

m = /^([0-9\.]+\%) overall read mapping rate/.match(txt)
mapping_rate = m[1]

headers = %w{name num_reads num_mapped num_multihits perc_multihits mapping_rate }

if showhead
  puts "#" + headers.join("\t")
end
puts [dirname, num_reads, num_mapped, num_multihits, perc_multihits, mapping_rate ].join("\t")
