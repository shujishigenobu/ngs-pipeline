sp1 = ARGV[0]
sp2 = ARGV[1]

scripts = []
[sp1, sp2, "#{sp1} #{sp2}", "#{sp2} #{sp1}"].each do |x|
  scr = "run_inparablast-#{x.gsub(/\s+/, '-')}.sh"
  scripts << scr
  File.open(scr, "w"){|o|
    o.puts "perl inparanoid_blast.pl #{x} "
  }
end

scr0 = "run_formatdb.sh"
File.open(scr0, "w"){|o|
  o.puts "formatdb -i #{sp1}"
  o.puts "formatdn -i #{sp2}"
}

sge = "sge_submission.sh"
File.open(sge, "w"){|o|
  o.puts "qsub -v PATH -N formatdb_#{sp1}-#{sp2} #{scr0}"
  scripts.each do |s|
    o.puts "qsub -v PATH -hold_jid formatdb_#{sp1}-#{sp2} #{s}"
  end
}
