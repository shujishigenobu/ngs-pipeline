sp1 = ARGV[0]
sp2 = ARGV[1]

[sp1, sp2, "#{sp1} #{sp2}", "#{sp2} #{sp1}"].each do |x|
  scr = "run_inparablast-#{x.gsub(/\s+/, '-')}.sh"
  File.open(scr, "w"){|o|
    o.puts "perl inparanoid_blast.pl #{x} "
  }
end
