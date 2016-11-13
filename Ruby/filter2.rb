# encoding: UTF-8 
file_out_withoutpsdandiv=File.open("data/dictwithoutps_no_d-iv.txt", "w:UTF-8")
file_out_withpsdandiv=File.open("data/dict_withps_d-iv.txt", "w:UTF-8")
count_nops_d_iv = 0
count_ps_d_iv = 0

# Read in the input file one line at a time 
File.open("data/dictwithoutps.txt", "r:UTF-8").each do |line|

	  fields = line.split(" | ")
	  headword = fields[1] 
	
#   if fields[1] contain one of these Diacritics: ៍, ័, ៌, ៈ >> 
#	all P/S lines, else are native words.
	if headword =~ /[៍័៌ៈឥឦឧឩឪឫឬឭឮឯឰឱឳ]/  
		count_ps_d_iv += 1
		file_out_withpsdandiv.puts line
	else
		count_nops_d_iv += 1
		file_out_withoutpsdandiv.puts line
    end

	
end    

# Post processing summary

puts "Entries withoutps_d-iv:\t#{count_nops_d_iv} \t>>> Ready for next step"
puts "Entries withps_d-iv: \t#{count_ps_d_iv} \tremoved"