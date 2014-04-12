$fastqf = ARGV[0]
$min_len = (ARGV[1] || 50).to_i

# 
# Reads with length < $min_len are replaced with a single base of "N", a dummy seq.
#

File.open($fastqf).each_with_index do |l, i|
  n = i % 4
  case n
  when 0
    unless  /^@/.match(l)
      raise "Invalid FASTQ format"
    end
    puts l
  when 1
    if  l.chomp.size < $min_len
      puts "N"
    else
      puts l
    end
  when 2
    unless /^\+/.match(l)
      raise "Invalid FASTQ format"
    end
    puts l
  when 3
    if  l.chomp.size < $min_len
      puts "H"
    else
      puts l
    end
  else
    raise
  end
end
