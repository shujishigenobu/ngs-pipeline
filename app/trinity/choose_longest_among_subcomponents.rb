require 'rubygems'
require 'bio'

include Bio


h = {}
FlatFile.open(FastaFormat, ARGF).each do |fas|
  name = fas.entry_id
  len = fas.seq.length
  subcomp = /^comp\d+_c\d+/.match(name)[0]
  h[subcomp] = [] unless h.has_key?(subcomp)
  h[subcomp] << [name, len, fas]
end


h.keys.sort.each do |k|
  longest = h[k].sort{|a, b| b[1] <=> a[1]}[0]
  puts longest[2]
end
