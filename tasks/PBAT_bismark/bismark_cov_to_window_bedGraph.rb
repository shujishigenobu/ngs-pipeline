#source = "%FILE%"
source = ARGV[0]
#source = "idx2_bismark.bismark.cov.win"

contigsizef = "Rspe02.final.assembly.fasta.masked.sizes"
contig2size = {}
File.open(contigsizef).each do |l|
	a = l.chomp.split
	contig2size[a[0]] = a[1].to_i
end

data = {}
File.open(source).each_with_index do |l, i|
	a = l.chomp.split(/\t/)
	key = [a[6],a[7].to_i]
	unless data.has_key?(key)
		data[key] = {:meth => 0, :unmeth =>0}
	end
	data[key][:meth] += a[4].to_i
	data[key][:unmeth] += a[5].to_i
 	
 	if i % 100000 == 0
		STDERR.puts "#{i}: #{key.join(':')}"
	end
end

data.keys.sort.each do |k|
	m = data[k][:meth]
	u = data[k][:unmeth]
	total = m + u
	perc_meth = m.to_f / total
#	p [k, m, u, perc_meth]
	puts [k[0], 
		k[1], 
		[k[1] + 1000, contig2size[k[0]]].sort[0], 
		(perc_meth  * 100).to_i,
		m, u,
		].join("\t")
end
