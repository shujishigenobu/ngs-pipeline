#===
# bismark_cysosine_report_parser.rb
#
# author: Shuji Shigenobu <sshigenobu@gmail.com>
#
###
# The genome-wide cytosine report format
# ======================================
# * tab-delimited
# * 1-based coords
# * columns
# <chromosome>  <position>  <strand>  <count methylated>  <count unmethylated>  <C-context> <trinucleotide context>
# (ex)
# scaffold_0      78      +       4       0       CG      CGT
# scaffold_0      79      -       2       0       CG      CGC
# scaffold_0      84      +       4       0       CG      CGC
# scaffold_0      85      -       1       0       CG      CGG
#
# See Bismark HP for the specification
# - http://www.bioinformatics.babraham.ac.uk/projects/bismark/
#

class BismarkCytosineReport

  def initialize(file)
    @filepath = file
    @io = File.open(@filepath)
  end

  attr_accessor :filepath
  attr_reader :io

  def each
    io.each do |line|
      yield line
    end
  end

  def each_record
    io.each do |line|
      r = Record.new(line.chomp)
      r.parse
      yield r
    end
  end

  def convert_to_bed6like
    self.each_record do |r|
      puts r.to_bed6like.join("\t")
    end
  end

  class Record
    def initialize(str)
      @raw = str
    end

    def parse
      a = @raw.split(/\t/)
      @h = {
        'chromosome' => a[0],
        'position' => a[1].to_i, #1-based
        'strand' => a[2],
        'count_methylated' => a[3].to_i,
        'count_unmethylated' => a[4].to_i,
        'c_context' => a[5],
        'trinucleotide_context' => a[6],
      }
      @chromosome = @h['chromosome']
      @position = @h['position']
      @strand = @h['strand']
      @count_methylated = @h['count_methylated']
      @count_unmethylated = @h['count_unmethylated']
      @c_context = @h['c_context']
      @trinucleotide_context = @h['trinucleotide_context']
      @h
    end

    attr_reader :chromosome, :position, :strand, :count_methylated, :count_unmethylated, :c_context, :trinucleotide_context

    def coverage
      unless @coverage
        @coverage = @count_methylated + @count_unmethylated
      end
      @coverage
    end

    def percent_methylated
      unless @percent_methylated
        @percent_methylated = count_methylated.to_f / coverage * 100
      end
      @percent_methylated
    end

    def to_bed6(name_type = nil)
      case name_type
      when :count_info
        name = "#{count_methylated}:#{count_unmethylated}"
      when :context
        name = c_context
      when :context3
        name = trinucleotide_context
      else
        name = "."
      end
      out = [
        @h['chromosome'],   #1:chrom
        @h['position'] - 1, #2:start
        @h['position'],     #3:end
        name,  #4:name
        sprintf("%.2f", percent_methylated), #5:score
        @h['strand'],        #6:strand
      ]
      out
    end

    def to_bed6like
      a = to_bed6(:context3)
      [a, count_methylated, count_unmethylated].flatten
    end

  end



end

if __FILE__ == $0
#  file = "bismark_methylcall_result_150722151029x2_merged_CpG/bismark_150722151029x2.merged.sorted.CpG_report.txt"
  subcmd = ARGV[0]
  file = ARGV[1]

  rep = BismarkCytosineReport.new(file)

  case subcmd
  when "convert_to_bed6like"
    rep.convert_to_bed6like
  else
    raise "unknown sub-command"
  end
end
