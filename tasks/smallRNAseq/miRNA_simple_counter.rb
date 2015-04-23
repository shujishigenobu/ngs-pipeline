target_len_min = 20
target_len_max = 24
counter = Hash.new(0)

ARGF.each_with_index do |l, i|
 if i % 4 == 3
 elsif i % 4 == 1
   seq = l.chomp.strip
   
   if seq.length >= target_len_min && seq.length <= target_len_max
     counter[seq] += 1
   else
     next
   end

 else


 end

end


counter.to_a.sort{|a, b|
  b[1] <=> a[1]
}.each do |k, v|
  puts [k,v].join("\t")
end
