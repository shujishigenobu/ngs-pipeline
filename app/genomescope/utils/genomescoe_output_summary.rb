source = {
  "idx12" => "Ooba-reseq1-12.k21.jf.histo.genomescope",        
  "idx19" => "Ooba-reseq1-19.k21.jf.histo.genomescope",
  "idx5"  => "Ooba-reseq1-5.k21.jf.histo.genomescope",
  "idx6"  => "Ooba-reseq1-6.k21.jf.histo.genomescope",
  "ikey"  => "idx6_GCCAAT_L002.k21.jf.histo.genomescope"
}

data = Hash.new()
source.each do |k, v|
  data[k] = Hash.new()
  resultfile = "#{v}/summary.txt"
  File.open(resultfile).each do |l|
    a = l.chomp.split(/\s{2,}/)
    next unless a.size == 3
    data[k][a[0]] = [a[1], a[2]]
  end
end

keys = data[source.keys[0]].keys

source_names = source.keys
puts [nil, source_names].join("\t")
keys.each do |k|
  puts [k, source_names.map{|s| data[s][k][1]}].join("\t")
end

