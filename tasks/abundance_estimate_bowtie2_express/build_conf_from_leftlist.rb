puts "#NAME\tSEQ1\tSEQ2"

File.open(ARGV[0]).each do |l|
  path = l.chomp
  sample = path.split(/\//)[-2].split(/_/)[-1]
  idx = /^idx\d+/.match(path.split(/\//)[-1])[0]
  name = sample + "_" + idx
  puts [name, path, path.sub(/_R1_/, "_R2_")].join("\t")

end
