inputf = ARGV[0]

TEMPR = "tmm_norm.template.R"

cols = []
File.open(inputf).each do |l|
  if m = /^\# id/.match(l)
    cols = m.post_match.strip.split(/\t/)
  end
end
p cols

scr = File.open(TEMPR).read
scr.gsub!(/%INPUT_FILE%/, inputf)
scr.sub!(/%COLS%/, "c(" + cols.map{|c| "\"#{c}\""}.join(", ") + ")")


p rscript = TEMPR.sub(/\.template/, '')
File.open(rscript, "w"){|o| o.puts scr}
cmd = "R --vanilla < #{rscript}"
system(cmd)

