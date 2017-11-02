require 'yaml'

conffile = ARGV[0]
conf = YAML.load(File.open(conffile).read)

STDERR.puts conf.inspect


COLUMN_NAMES = %w{
target_id       
length  
eff_length      
est_counts      
tpm
}


names = conf['names']
outdir_prefix = conf['outdir_prefix']

data = {}

source_files = []
names.each do |name|
  data[name] = {}
  source_file = "#{outdir_prefix}#{name}/abundance.tsv"
  source_files << source_file
  File.open(source_file).each_with_index do |l, i|
    next if i == 0
    a = l.chomp.split(/\t/, -1)
    id = a[0]
    val = a[conf['target_col']]
    data[name][id] = val
  end
end

ids = data[names[0]].keys.sort

## Read sample_info_file

sample_info = {}
File.open(conf['sample_info_file']).each do |l|
  next if /^\#/.match(l)
  a = l.chomp.split(/\t/)
  sample_info[a[0]] = a
end


puts "#=== eXpress Summary Table ==="
puts "#"
puts "# source:"
source_files.each do |sf|
  puts "#   #{sf}"
end
puts "#"
puts "# sample information"
names.each do |n|
  puts "#  #{sample_info[n].join("\t")}"
end

puts "# target column: " + COLUMN_NAMES.at(conf['target_col'])
puts "# script: #{__FILE__}"
puts "# date:   #{Time.now}"
puts "# author: Shuji Shigenobu <shige@nibb.ac.jp>"
puts "#"
puts "# id\t" + names.join("\t")
puts "# id\t" + names.map{|n| sample_info[n][1]}.join("\t")

ids.each do |id|
  values = names.map{|n| data[n][id]}
  puts [id, values].flatten.join("\t")
end
