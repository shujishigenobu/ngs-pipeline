targetlistf = ARGV[0]
num_threads = (ARGV[1] || 2).to_i

require 'parallel'
require 'rake'

targets = []
File.open(targetlistf).each do |l|
  targets << l.chomp.split[0]
end

STDERR.puts "#{targets.size} targets found"

Parallel.each(targets, in_threads: num_threads) do |t|
  cmd = "fastq-dump --split-files --origfmt #{t}"
  sh cmd

end
