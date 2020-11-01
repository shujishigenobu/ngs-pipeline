matrix_file = ARGV[0]
gene_trans_map_file = ARGV[1]

## Load gene_trans_map data
trans_to_gene = Hash.new
File.open(gene_trans_map_file).each do |l|
  next if /^\#/.match(l)
  a = l.chomp.split(/\t/)
  gene = a[0]
  trans = a[1]
  trans_to_gene[trans] = gene
end

## Load cout matrix
t2mat = Hash.new

File.open(matrix_file).each do |l|
  if /^\#/.match(l)
    puts l
    next
  elsif /^id/.match(l)
    puts l
    next
  end
  a = l.chomp.split(/\t/)
  k = a[0]
  trans_id = k
  if /^rna-/.match(k)
    trans_id = k.sub(/^rna-/, "")
  end
  g = trans_to_gene[trans_id]
#  p [k, g]
  unless g
    p [k, g]
    raise
  end
  t2mat[k] = a[1..-1].map{|x| x.to_f}
end

num_col =  t2mat.to_a[0][1].size
STDERR.puts "num_columns: #{num_col}"

## Calculate gene based count
gene_to_trans = {}
trans_to_gene.each do |t, g|
  gene_to_trans[g] = [] unless gene_to_trans.has_key?(g)
  gene_to_trans[g] << t
end
gene_to_trans.each do |g, transcripts|
#  p [g, transcripts]
  gmat = Array.new(num_col, 0)
  transcripts.each do |t|
 #   p [t, t2mat[t]]
    next unless t2mat[t]
    tmat = t2mat[t].map{|v| v.to_f}
    gmat.each_with_index do |x, i|
      gmat[i] += tmat[i]
    end
  end
  puts [g, gmat.map{|v| v.round(3)}].flatten.join("\t")
end
