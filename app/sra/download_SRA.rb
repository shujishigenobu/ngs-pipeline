listf = ARGV[0]

require 'rake'

srrs = []
File.open(listf).each do |l|
  m = /SRR\d+/.match(l)
  srrs << m[0] if m
end
STDERR.puts "#{srrs.size} SRR IDs found in the list"
STDERR.puts "#{srrs.join(', ')}"

srrs.each do |srr|
  STDERR.puts srr
  cmd = "prefetch --max-size 100G -v #{srr} "
  STDERR.puts cmd
  sh cmd
end
