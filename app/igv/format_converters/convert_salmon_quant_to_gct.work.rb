salmon_quant_f = "salmon_out_example/quant.sf"

header_1 = "#1.2"
header_2 = "40989 1"
header_3 = ["Name", "Description", "Sample_1"].join("\t")
puts header_1, header_2, header_3

File.open(salmon_quant_f).each_with_index do |f, i|
  next if i == 0
  a = f.chomp.split(/\t/)
  name = a[0]
  len = a[1]
  efflen = a[2]
  tpm = a[3]
  numreads = a[4]

  gct_desc = "na|@#{name}|"
  gct_row = [name, gct_desc, tpm]
  puts gct_row.join("\t") unless /^buc:/.match(name)
end