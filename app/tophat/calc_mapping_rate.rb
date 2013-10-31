targetdir = ARGV[0]

readinfotxt = File.open("#{targetdir}/prep_reads.info").read

left = /left_reads_out\=(\d+)/.match(readinfotxt)[1].to_i
right = /right_reads_out\=(\d+)/.match(readinfotxt)[1].to_i

cmd = "samtools view -F 0x100 -c  #{targetdir}/accepted_hits.bam"

res = IO.popen(cmd){|io| io.read}


nmap = res.strip.to_i
pmap = nmap.to_f / (left + right) * 100

puts "^ " + %w{library left right #mapped %mapped}.join(" ^ ") + "^"
puts "| " + [File.basename(targetdir), left, right, nmap, sprintf("%.1f", pmap)].join(" | ") + " |"
