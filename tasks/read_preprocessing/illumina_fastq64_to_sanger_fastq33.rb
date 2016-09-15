ARGF.each_with_index do |l, i|
 if i % 4 == 3
   puts l.tr('@-i', '!-J')
 else
   puts l
 end
end
