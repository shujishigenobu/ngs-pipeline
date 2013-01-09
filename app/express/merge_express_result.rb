target_col = 6 #est_counts

names = ["idx2", "idx4", "idx5", "idx6", "idx7",  #female eggs          
         "idx12", "idx13", "idx14", "idx15", "idx16",  #male eggs         
         "idx18", # female larvae
         "idx19", # male larvae
        ]

COLUMN_NAMES = %w{
bundle_id       
target_id       
length  
eff_length      
tot_counts      
uniq_counts     
est_counts      
eff_counts     
ambig_distr_alpha       
ambig_distr_beta        
fpkm    
fpkm_conf_low   
fpkm_conf_high  
solvable}

data = {}
names.each do |name|
  data[name] = {}
  File.open("#{name}/express_out/results.xprs").each_with_index do |l, i|
    next if i == 0
    a = l.chomp.split(/\t/, -1)
    id = a[1]
    val = a[target_col]
    data[name][id] = val
  end
end

ids = data[names[0]].keys.sort

puts "#=== eXpress Summary Table ==="
puts "#"
puts "# source:"
names.each do |n|
  puts "#   #{n}/express_out/results.xprs"
end
puts "# target column: " + COLUMN_NAMES.at(target_col)
puts "# script: #{__FILE__}"
puts "# date:   #{Time.now}"
puts "# author: Shuji Shigenobu <shige@nibb.ac.jp>"
puts "#"
puts "# id\t" + names.join("\t")

ids.each do |id|
  values = names.map{|n| data[n][id]}
  puts [id, values].flatten.join("\t")
end
