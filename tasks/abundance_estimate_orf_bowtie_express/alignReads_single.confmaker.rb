# ../cleanfq/idx10_TAGCTT_L007_R1_001.clnq30.fq

filelistf = ARGV[0]

puts "#NAME\tSEQ"
File.open(filelistf).each do |l|
  f = File.basename(l.chomp)
  m = /^(idx\d+)_.+(R\d)_+/.match(f)
  idx = m[1]
  r = m[2]
#  p [idx, r]
  name= "#{idx}#{r}"
  puts [name, l].join("\t")
end
