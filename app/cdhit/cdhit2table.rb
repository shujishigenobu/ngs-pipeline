cluster = {}
cluster_no_current = nil

File.open(ARGV[0]).each do |l|

  if m = /^>Cluster\s+(\d+)/.match(l)
    cluster_no = m[1].to_i
    cluster_no_current = cluster_no
    cluster[cluster_no] = []
  else
    a = l.chomp.split
    name = />(.+)\.{3}/.match(a[2])[1]
    cluster[cluster_no_current] << [name, a[0], a[-1], a[1].sub(/nt,$/, "")]
  end    
end

outf1 = ARGV[1]
o = File.open(outf1, "w")

o.puts "# " + %w{cluster_id  representative  cluster_members  cluster_size  representative_lingth}.join("\t")

cluster.keys.sort.each do |c|
  representative =  cluster[c].select{|x| x[2] == "*"}[0]
  o.puts [c, 
          representative[0],
          cluster[c].map{|x| x[0]}.join(","),
          cluster[c].size,
          representative[3]].join("\t")
end
o.close



data = []
cluster.to_a.each do |k, members|
  representative = members.select{|x| x[2] == "*"}[0]
  members.each do |m|
    data << [m[0], k, m[2], representative[0]]
  end
end

outf2 = ARGV[2]
o = File.open(outf2, "w")
o.puts "# " + %w{contig_name  cluster_id  identity  representative}.join("\t")
data.sort{|a, b| a[0] <=> b[0]}.each do |x|
  o.puts x.join("\t")
end
o.close
