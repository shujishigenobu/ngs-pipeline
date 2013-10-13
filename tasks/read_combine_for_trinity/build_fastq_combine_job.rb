left_list = ARGV[0]

sh1 = "combine_left.sh"
outf1 = "left_all.fq"

sh1io = File.open(sh1, "w")
sh1io.puts "cat \\"

File.open(left_list).each do |l|
  sh1io.puts "  #{l.chomp} \\"
end

sh1io.puts " > #{outf1}"
sh1io.close

sh2 = "combine_right.sh"
sh2io = File.open(sh2, "w")
File.open(sh1).each do |l|
  l = l.sub(/_R1_/, "_R2_")
  l = l.sub(/\bleft_/, "right_")
  sh2io.puts l
end
sh2io.close
