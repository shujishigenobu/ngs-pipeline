#!/usr/bin/ruby

$pp = true # pretty print
$head = true # display header
$targetdir = ( ARGV[0] || "fastqc")


files = Dir["#{$targetdir}/*_fastqc/fastqc_data.txt"]



data_read1 = []; data_read2 = [];
data_read1_un = []; data_read2_un = [];

# p files.size
files.each do |f|
#  p f
  txt = File.open(f).read
  m = /^Total Sequences\s+(\d+)/.match(txt)
  count = m[1].to_i
  name =  File.dirname(f).split(%r{/})[-1].sub(/_\d{3}_fastqc$/, '')

  if  m2 = /^idx(\d+)_[ATGC]+_L(\d+)_R(1|2)$/.match(name) ||
      m2 = /^idx(\d+)_NoIndex_L(\d+)_R(1|2)$/.match(name)
    lane = m2[2].to_i
    read = m2[3].to_i
    bc = m2[1].to_i
    # p [name, lane, bc, count]
    if read == 1
      data_read1 << [name, lane, bc, count]
    elsif read == 2
      data_read2 << [name, lane, bc, count]
    end
  elsif m2 = /^lane(\d+)_Undetermined_L(\d+)_R(1|2)$/.match(name)
    lane = m2[1].to_i
    read = m2[3].to_i
    bc   =  0
    if read == 1
      data_read1_un << [name, lane, bc, count]
    elsif read == 2
      data_read2_un << [name, lane, bc, count]
    end
  end
end

## summary by lane
puts "# " + %w{Lane #idx  indexes  #reads_total  idx:#reads:% }.join("\t") if $head

[data_read1, data_read2, data_read1_un, data_read2_un].each_with_index do |data, i|
  case i
  when 0
    puts '# Read1'
  when 1
    puts "# Read2"
  when 2
    puts "# Undetermined (index unknown) Read1"
  when 3
    puts "# Undetermined (index unknown) Read2"
  end
  data.map{|x| x[1]}.sort.uniq.each do |lane|
    data2 = []
    data2 << lane
    lset = data.select{|y| y[1] == lane}
    data2 << lset.length
    data2 << lset.map{|y| y[2]}.sort.join(",")
    subtotal = lset.map{|y| y[3]}.inject(0){|n, m | n + m}
      
    if $pp
      data2 << sprintf("%.1fM", subtotal/1000000.to_f)
    else
      data2 << subtotal
    end
    lset.sort{|a, b| a[2] <=> b[2]}.each do |z|
      if $pp
        next unless z[3] >= 100000
        data2 << [z[2],
                  sprintf("%.1fM", z[3]/1000000.to_f),
                  sprintf("%.1f%%", z[3]/subtotal.to_f*100)].join(":")
      else
        data2 << [z[2], z[3], sprintf("%.1f%%", z[3]/subtotal.to_f*100)].join(":")
      end

    end
    puts  data2.join("\t")
  end
  puts "//"

end

