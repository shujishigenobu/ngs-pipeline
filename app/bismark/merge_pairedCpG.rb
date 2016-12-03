source = "Znev_bismark_GpG_report_combined.txt"

prev = nil
File.open(source).each do |l|
  if /^\#/.match(l)
    if /^\# \d+/.match(l)
      puts l.gsub(/\# /, '# data_')
    elsif /^\#chromosome/.match(l)
      puts "#" + (%w{chrom start end name %methylated strand sum_methylated sum_unmethylated coverage} << (0..7).map{|n| "data_#{n}"}.join('|')).join("\t")
    else
      puts l 
    end
    next
  end
  a = l.chomp.split(/\t/)
  genome = a[0]
  pos = a[1].to_i
  strand = a[2]

  if strand == "-"
    unless a[1].to_i == prev[1].to_i + 1
#      raise
      STDERR.puts "No CpG pair records:"
      STDERR.puts a.join("\t")
      next
    end
#    p prev
#    p a

    chr = a[0]
    from = prev[1].to_i - 1
    to   = a[1].to_i
    name = "CpG"
    
    sum_methylated = a[6].to_i + prev[6].to_i
    sum_unmethylated = a[7].to_i + prev[7].to_i
    coverage = a[8].to_i + prev[8].to_i
    sample_data = []
    (9..16).each do |i|
#p i
      values_curr = a[i].split(/,/).map{|x| x.to_i}
      values_prev = prev[i].split(/,/).map{|x| x.to_i}
      met = values_curr[0] + values_prev[0]
      unmet = values_curr[1] + values_prev[1]
#      [met, unmet]
      sample_data << "#{met},#{unmet}"
    end

    perc_meth = sum_methylated.to_f / coverage.to_f * 100

    dat = [chr, from, to, name, sprintf("%.1f", perc_meth), "+"] 
    dat += [sum_methylated, sum_unmethylated, coverage, sample_data.join('|')]
    puts dat.join("\t")
  end

  prev = a.dup

end
