###
# --- fetch_CoreData_TrinityOutputs.rb ---
#
# fetch core data from Trinity Output directory.
#
# work with Trinity 2.8.4.
# work with 


output_dir = ARGV[0] # (ex) /work/Trinity_PriPu_brains_181031f/
exec_script = ARGV[1]

require 'rake'

dirname = output_dir.split(%r{/})[-1]
newdir = dirname

mkdir newdir
mkdir "#{newdir}/logs"
mkdir "#{newdir}/pipeline"
mkdir "#{newdir}/intermediates"

cp "#{output_dir}/Trinity.fasta", "#{newdir}/"
cp "#{output_dir}/Trinity.fasta.gene_trans_map", "#{newdir}/"
cp "#{output_dir}/Trinity.timing", "#{newdir}/logs/"
cp "./collectl/collectl.dat", "#{newdir}/logs/"
cp "./#{exec_script}.log", "#{newdir}/logs/"
cp "#{output_dir}/inchworm.K25.L25.fa", "#{newdir}/intermediates/"
cp "#{output_dir}/insilico_read_normalization/left.norm.fq", "#{newdir}/intermediates/"
cp "#{output_dir}/insilico_read_normalization/right.norm.fq", "#{newdir}/intermediates/"
cp "./#{exec_script}", "#{newdir}/pipeline"
cp "./samples.txt", "#{newdir}/pipeline"


