require 'json'

report_file = ARGV[0]
lines = []
in_report = false
File.open(report_file).each do |l|
  if /^\d+ reads; of these:/.match(l)
    in_report = true
  end
  lines << l if in_report
  if /^[\d\.]+% overall alignment rate/.match(l)
    in_report = false
    break
  end
end

# (example)
# 10000 reads; of these:
#   10000 (100.00%) were paired; of these:
#     650 (6.50%) aligned concordantly 0 times
#     8823 (88.23%) aligned concordantly exactly 1 time
#     527 (5.27%) aligned concordantly >1 times
#     ----
#     650 pairs aligned concordantly 0 times; of these:
#       34 (5.23%) aligned discordantly 1 time
#     ----
#     616 pairs aligned 0 times concordantly or discordantly; of these:
#       1232 mates make up the pairs; of these:
#         660 (53.57%) aligned 0 times
#         571 (46.35%) aligned exactly 1 time
#         1 (0.08%) aligned >1 times
# 96.70% overall alignment rate

report_lines = lines

unless report_lines.size == 15
  raise "Unknown format."
end
h = {}
total = /^(\d+) reads;/.match(report_lines[0])[1]
overall_alignment_rate = /([\d\.]+)% overall alignment rate/.match(report_lines[14])[1]
h = {
  'report_file' => File.basename(report_file),
  'total_num_read_pairs' => total.to_i, 
  'percent_overall_alignment' => overall_alignment_rate.to_f
}
m = /\s+(\d+) \(([\d\.]+)%\) aligned concordantly exactly 1 time/.match(report_lines[3])
h['num_pair_aligned_concordantly_once'] = m[1].to_i
#h['percent_pair_aligned_concordantly_once'] = m[2]

m = /\s+(\d+) \(([\d\.]+)%\) aligned concordantly >1 times/.match(report_lines[4])
h['num_pair_aligned_concordantly_multi'] = m[1].to_i
#h['percent_pair_aligned_concordantly_multi'] = m[2]

m = /\s+(\d+) \(([\d\.]+)%\) aligned concordantly 0 times/.match(report_lines[2])
h['num_pair_not_aligned_concordantly'] = m[1].to_i
#h['percent_pair_not_aligned_concordantly'] = m[2]

m = /\s+(\d+) \(([\d\.]+)%\) aligned discordantly 1 time/.match(report_lines[7])
#       34 (5.23%) aligned discordantly 1 time
h['num_pair_aligned_discordantly_once'] = m[1].to_i
#h['percent_pair_aligned_discordantly_once'] = m[2]

m = /\s+(\d+) \(([\d\.]+)%\) aligned 0 time/.match(report_lines[11])
#         660 (53.57%) aligned 0 times
h['num_mate_not_aligned'] = m[1].to_i

m = /\s+(\d+) \(([\d\.]+)%\) aligned exactly 1 time/.match(report_lines[12])
#         571 (46.35%) aligned exactly 1 time
h['num_mate_aligned_once'] = m[1].to_i

m = /\s+(\d+) \(([\d\.]+)%\) aligned >1 times/.match(report_lines[13])
#         1 (0.08%) aligned >1 times
h['num_mate_alignmed_multi'] = m[1].to_i
require 'pp'
#pp h

json = h.to_json
puts json