sp1 = ARGV[0]
sp2 = ARGV[1]
template_dir = ARGV[2]

scripts = []
[sp1, sp2, "#{sp1} #{sp2}", "#{sp2} #{sp1}"].each do |x|
  newdir = "#{template_dir}-#{x.gsub(/\s+/, '-')}"
  cmd = "cp -a #{template_dir} #{newdir}"
  system cmd

  scr = "run_inparablast-#{x.gsub(/\s+/, '-')}.sh"
  scripts << scr
  File.open(scr, "w"){|o|
    o.puts "cd #{newdir}\nperl inparanoid_blast.pl #{x} "
  }
end

sge = "sge_submission.sh"
File.open(sge, "w"){|o|
  scripts.each do |s|
    o.puts "qsub -v PATH  #{s}"
  end
}
