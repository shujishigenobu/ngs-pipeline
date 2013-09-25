templatef = "clean_fq_template.sh"

definition_table_file = "name_list.txt"

keywords = %w{FILE_NAME}

template = File.open(templatef).read

i = 0

File.open(definition_table_file).each do |l|

  h = Hash.new
  script = template.dup

  next if /^\#/.match(l)
  a = l.chomp.split(/\t/)
  keywords.zip(a) do |k, v|
    h[k] = v
  end

p h

  h.keys.each do |k|
#    p [k, h[k]]

    script.gsub!(/<%\=\s*#{k}\s*%>/, h[k])
  end

  outf = File.basename(templatef, "_template.sh") + "_job#{i+=1}.sh"

  File.open(outf, "w") do |o|
    o.puts script
  end


end





