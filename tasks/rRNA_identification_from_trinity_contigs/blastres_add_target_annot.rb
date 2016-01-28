$infile = ARGV[0]
$blastdb = ARGV[1]
# blastdb : /home/DB/public/processed/SILVA/release_108/LSURef_108_tax_silva.fasta -- LSU
# blastdb : /home/DB/public/processed/SILVA/release_108/SSURef_108_NR_tax_silva_v2.fasta -- SSU
$keypos = (ARGV[2] || 1).to_i

=begin
counter = Hash.new(0)
File.open($infile).each do |l|
  next if /^\#/.match(l)
  a = l.chomp.split(/\t/)
  tophit = a[2]
  counter[tophit] += 1
end
=end

class DeflineParser
  def initialize
#    @entry_id = nil
#    @desc = nil
#    @species = nil
  end

  attr_accessor :entry_id, :desc, :species

  def parse(line, opt={})
    comment = line.sub(/^>/, "")
    m = /^(\S+)\s+(.+)$/.match(comment)
    entry_id = m[1]
    desc = m[2]
    entry_id.sub!(/^lcl\|/, "")
    h = {
      'entry_id' => entry_id, 
      'comment' => comment,
      'desc' => desc}
  end

end

class DPSilva < DeflineParser

  def parse(line)
    h = super
    tmp = h['desc'].split(/;/).last
    if m = /(.+)\s*\((.+)\)/.match(tmp)
      species = m[1]
      common_name = m[2]
    else
      species = tmp.strip
      common_name = nil
    end
    h.update({'species' => species, 'common_name' => common_name})
    h
  end
end

dp = DPSilva.new

cache = Hash.new

File.open($infile).each do |l|
  next if /^#/.match(l)
  a = l.chomp.split(/\t/)
  target_id = a[$keypos]
#  p target_id
  unless cache[target_id]
    cmd = "fastacmd -d #{$blastdb} -s #{target_id} | head -1"
    res = nil
    IO.popen(cmd){|io| res = io.read}
#    p res
    h = dp.parse(res)
    cache[target_id] = h
  end
  data = cache[target_id]
  outdat = a
#  p outdat
  outdat += [data['entry_id'], data['species'], data['common_name'], data['desc']]
  puts outdat.flatten.join("\t")
end
