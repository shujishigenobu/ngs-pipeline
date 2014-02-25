## Somehow fasta file produed by EVM util script include non-standard character in the description line.
## This script clean them.
## This script can also change the 

ARGF.each do |l|
  if /^>/.match(l)
    l.sub!("\034", ":")
    puts l
  else
    puts l
  end
end
