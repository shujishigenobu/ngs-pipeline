def fastq_to_names(file, outfile)

  o = File.open(outfile, "w")

  File.open(file).each_with_index do |l, i|
    n = i % 4
    case n
    when 0
      unless  /^@HWI/.match(l)
        raise "Invalid FASTQ format"
      end
      name = l.chomp.split[0].sub(/^@/, '')
      o.puts name
    when 1
      # do nothing
    when 2
      unless /^\+/.match(l)
        raise "Invalid FASTQ format"
      end
      # do nothing
    when 3
      # do nothing
    end
  end
  o.close
end


class FastqEntry
  def initialize(txt)
    @record = txt
    lines = @record.split(/\n/).map{|l| l.chomp}
    @sname = lines[0].sub(/^@/, '').split[0]
    @seq  = lines[1]
    @qname = lines[2].sub(/^\+/, '')
    @qual = lines[3]
  end

  attr_reader :sname, :seq, :qname, :qual

  def to_s
    @record
  end

end

class FastqIterator
  def initialize(file)
    @io = File.open(file)
  end

  def next
    record = ""
    4.times do |i|
      record << @io.readline
    end
    FastqEntry.new(record)
  end

  def has_next?
    !@io.eof?
  end

end

if __FILE__ == $0

  fq1f = ARGV[0]
  fq2f = ARGV[1]

  out1 = "#{fq1f}.paired_only.fq"
  out2 = "#{fq2f}.paired_only.fq"
  o1 = File.open(out1, "w")
  o2 = File.open(out2, "w")


  fq1fn =   File.basename(fq1f) + ".names"
  fq2fn =   File.basename(fq2f) + ".names"

  fastq_to_names(fq1f, fq1fn)
  fastq_to_names(fq2f, fq2fn)

  diffout = "#{fq1fn}-#{fq2fn}.diff"
  cmd = "diff --side-by-side #{fq1fn} #{fq2fn} > #{diffout}"
  system cmd

  fq1 = FastqIterator.new(fq1f)
  fq2 = FastqIterator.new(fq2f)
  
  File.open(diffout).each do |l|
    next if /(<|>)/.match(l)
    next if /\|/.match(l)
    a = l.chomp.split(/\t/,-1)
    name1 = a[0]
    name2 = a[-1]
    next unless name1 == name2
    name = name1

    loop do
      r1 = fq1.next
      if name == r1.sname
        o1.puts r1
        break
      end
    end

    loop do
      r2 = fq2.next
      if name == r2.sname
        o2.puts r2
      break
      end
    end
    
  end

  o1.close
  o2.close
end



