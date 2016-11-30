###
# convert 
# Bismark methylation call report => methylSig methylation score table


puts %w{chrBase chr     base    strand  coverage        freqC   freqT}.join("\t")

ARGF.each do |l|
  a = l.chomp.split(/\t/)
  chr = a[0]
  pos = a[1].to_i
  str = a[2]
  met = a[3].to_i
  non_met = a[4].to_i
  
  coverage = met + non_met
  freqC = met.to_f / coverage * 100
  freqT = non_met.to_f / coverage * 100

  name = "#{chr}.#{pos}"

  if coverage > 0 
    puts [name, chr, pos, str, coverage, freqC, freqT].join("\t")
  else
#    puts [name, chr, pos, str, 0, freqC, freqT].join("\t")
  end
end
