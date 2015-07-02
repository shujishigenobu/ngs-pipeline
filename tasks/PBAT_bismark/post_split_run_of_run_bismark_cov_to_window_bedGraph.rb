data = []

prev = nil
prev_data = nil

ARGF.each do |l|
	a = l.chomp.split(/\t/)
	curr = [a[0], a[1].to_i]
	if curr == prev
#		p [a, prev_data]
		meth_merged = prev_data[4].to_i + a[4].to_i
		unmeth_merged =	prev_data[5].to_i + a[5].to_i
		total_merged = meth_merged + unmeth_merged
		perc_meth_merged = meth_merged / total_merged.to_f
		newdata = 
		[a[0], a[1], a[2],
		(perc_meth_merged * 100).to_i,
		meth_merged, unmeth_merged
		]
		data.pop
		data.push(newdata)
#		puts newdata.join("\t")
	else
		data.push(a)
	end
	prev = curr
	prev_data = a.dup
end

data.each do |d|
	puts d.join("\t")
end