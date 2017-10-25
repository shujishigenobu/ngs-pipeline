inputf = ARGV[0]

TEMPR = "tmm_norm.template.R"

cols = []
File.open(inputf).each_with_index do |l, i |
  if i == 0
    cols = l.strip.split(/,/)[1..-1]
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

