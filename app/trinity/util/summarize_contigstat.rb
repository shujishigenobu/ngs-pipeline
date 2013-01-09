files = "Trinity_Diac_Run1Allp1.fasta.cdest[0-9][0-9][0-9].fa.stat"
#files = "Trinity_Diac_Run1Allp1.fasta.cdest[0-9][0-9][0-9]aS*.fa.stat"

keys = ["num_contigs",  "longest", "mean", "median",  
        "N50", "N90", "total_bases",
        ">= 10000", ">= 5000", ">= 3000", ">= 2000", ">= 1000", ">= 500", ">=300"]
puts ["#file", keys].flatten.join("\t")

Dir[files].each do |f|
  h = {}
  File.open(f).each do |l|
    next if /\#/.match(l)
    a = l.chomp.split(/\t/)
    k = a[0]
    v = a[1]
    h[k] = v
  end
  puts [f, 
        keys.map{|x| h[x]}].flatten.join("\t")
end
