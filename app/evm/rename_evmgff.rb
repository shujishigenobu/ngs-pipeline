
# (example of evm output gff)
# scaffold_0      EVM     gene    583     82865   .       +       .       ID=evm.TU.scaffold_0.1;Name=EVM%20prediction%20scaffold_0.1
# scaffold_0      EVM     mRNA    583     82865   .       +       .       ID=evm.model.scaffold_0.1;Parent=evm.TU.scaffold_0.1
# scaffold_0      EVM     exon    583     685     .       +       .       ID=evm.model.scaffold_0.1.exon1;Parent=evm.model.scaffold_0.1
# scaffold_0      EVM     CDS     583     685     .       +       1       ID=cds.evm.model.scaffold_0.1;Parent=evm.model.scaffold_0.1

ARGF.each do |l|
  a = l.chomp.split(/\t/)
  b = a.dup
  case a[2]
  when "gene"
    b[8] = a[8].gsub("%20", ":")
  else
  end
  puts b.join("\t")
end
