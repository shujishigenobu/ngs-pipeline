id2entries = {}

ARGF.each do |l|
  next if /^\#/.match(l)
  a = l.chomp.split(/\t/)
  id = /ID\=(.+?);/.match(a[8])[1]
  id2entries[id] = [] unless id2entries.has_key?(id)
  id2entries[id] << a
end



id2entries.keys.sort.each do |k|
  poss = id2entries[k].map{|a| [a[3].to_i, a[4].to_i]}.flatten
  poss.sort!
  pos_min = poss[0]
  pos_max = poss[-1]
#  p [pos_min, pos_max]


  ## create match_span line
  v = id2entries[k][0].dup
  v[2] = "match"
  v[3] = pos_min
  v[4] = pos_max
  query_name = /Query\=(.+?)\s/.match(v[8])[1]
  v[8] = "ID=#{query_name}"
  puts v.join("\t")
  
  ## output each hits
  id2entries[k].each_with_index do |h, i|
    j = h.dup
    j[2] = "match_part"
    j[8] = "Parent=#{query_name}"
    puts j.join("\t")
  end
end

STDERR.puts id2entries.keys.size
