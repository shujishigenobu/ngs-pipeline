dir = "Bismark_methylcall_report_CpG"

files = %w{
SRR3139745_Znev_dAF1_1.cln.Q30L25_bismark_bt2_pe.sorted.rmdup.CpG_report.txt
SRR3139746_Znev_dAF2_1.cln.Q30L25_bismark_bt2_pe.sorted.rmdup.CpG_report.txt
SRR3139747_Znev_dAM1_1.cln.Q30L25_bismark_bt2_pe.sorted.rmdup.CpG_report.txt
SRR3139748_Znev_dAM2_1.cln.Q30L25_bismark_bt2_pe.sorted.rmdup.CpG_report.txt
SRR3139749_Znev_dWF1_1.cln.Q30L25_bismark_bt2_pe.sorted.rmdup.CpG_report.txt
SRR3139750_Znev_dWF2_1.cln.Q30L25_bismark_bt2_pe.sorted.rmdup.CpG_report.txt
SRR3139751_Znev_dWM1_1.cln.Q30L25_bismark_bt2_pe.sorted.rmdup.CpG_report.txt
SRR3139752_Znev_dWM2_1.cln.Q30L25_bismark_bt2_pe.sorted.rmdup.CpG_report.txt
}

names = %w{AF1 AF2 AM1 AM2 WF1 WF2 WM1 WM2}

data_meth = {}
data_unmeth = {}

files.each do |file|
  STDERR.puts "loading #{file}"
  data_meth[file] = []
  data_unmeth[file] = []
  File.open("#{dir}/#{file}").each do |l|
    a = l.chomp.split(/\t/)
    data_meth[file] << a[3].to_i
    data_unmeth[file] << a[4].to_i
  end
end

files.each_with_index do |f, i|
  puts "\# #{i}: #{f}"
end

colnames = %w{chromosome  position  strand  context context3 %methylated sum_methylated sum_unmethylated coverage}
files.each_with_index{|f, i| colnames << "data_#{i}"}
puts "#" + colnames.join("\t")

File.open("#{dir}/#{files[0]}").each_with_index do |l, i|
  a = l.chomp.split(/\t/)
  b = [a[0], a[1], a[2], a[5], a[6]]
  count_pairs = files.map{|f| [data_meth[f][i], data_unmeth[f][i]]}
  meth_sum = count_pairs.map{|cp| cp[0]}.inject{|sum, n| sum += n}
  unmeth_sum = count_pairs.map{|cp| cp[1]}.inject{|sum, n| sum += n}
  coverage = meth_sum + unmeth_sum

  meth_ratio = meth_sum.to_f / (meth_sum + unmeth_sum)
  b << [sprintf("%.1f", meth_ratio * 100)]
  b << [meth_sum, unmeth_sum]
  b << coverage
  b << count_pairs.map{|cp| "#{cp[0]},#{cp[1]}"}
  puts b.flatten.join("\t")
end
