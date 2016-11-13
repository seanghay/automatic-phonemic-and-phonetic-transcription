# encoding: UTF-8 
file_out_ps_pron=File.open("data/dict_ps_pron.txt", "w:UTF-8")
file_out_no_ps_pron=File.open("data/dict_no_ps_pron.txt", "w:UTF-8")

count_ps_pron = 0
count_no_ps_pron = 0

# Read in the input file one line at a time 
File.open("data/dictwithoutps_no_d-iv.txt", "r:UTF-8").each do |line|

	  fields = line.split(" | ")
	  pron = fields[2] 

#   if fields[2] contain ៈ >> the pron is assumed to be p/s
	if pron =~ /ៈ/  
		count_ps_pron += 1
		file_out_ps_pron.puts line
	else
		count_no_ps_pron += 1
		file_out_no_ps_pron.puts line
    end

end    

# Post processing summary

puts "Entries w/out ps_pron: \t#{count_no_ps_pron} \t>>> Ready for next step"
puts "Entries with ps_pron: \t#{count_ps_pron} \tremoved"

