# encoding: UTF-8 
out_dictwithoutps=File.open("data/dictwithoutps.txt", "w:UTF-8")
out_count_etymoorigins=File.open("data/count_etymoorigins.txt", "w:UTF-8")
out_dictwithps=File.open("data/dictwithps.txt", "w:UTF-8")

lookup = {
	"បា\.សំ\." => "ps",
	"បា\.សំ\.ក្ល\." => "ps",
	"សំ\.បា\." => "ps",
	"សំ\.បា\.ក្ល\." => "ps",
	"ខ\.បា\." => "ps",
	"ខ\.សំ\." => "ps",
	"បា\.ក្ល\." => "ps",
	"បា\.ខ\." => "ps",
	"បា\.ស\." => "ps",
	"សំ\.ក្ល\." => "ps",
	"សំ\.ស\." => "ps",
	"បា\.ពហុ\." => "ps",
	"បា\.សំ\.ស\." => "ps", 
	"មក​ពីបា\. " => "ps",
	"សំ\.បា\.ស\." => "ps",
	"បា\.សំ" => "ps",
	"សំ\.ក្ល\.បា\." => "ps",
	"ក្ល\.សំ\." => "ps",
	"ក្ល\.មក​ពីសំ\." => "ps",
	"សំ\.បា" => "ps",
	"ពាក្យ​ឃ្លាត​ក្ល\.មក​ពីសំ\." => "ps",
	"ពាក្យ​ប្រើ​ក្លាយ​មក​ពីសំ\." => "ps",
	"បា\." => "ps",
	"សំ\." => "ps"
	}

count_native = 0
count_ps = 0
etymo_count = Hash.new(0)

# Read in the input file one line at a time 
File.open("data/entries_unique.txt", "r:UTF-8").each do |line|
    keep_word = true
	line.chomp!
	line.strip!
	fields = line.split(" | ")
	etymo_wrong_field = fields[2]
	etymo = fields[3] 
	if ! etymo.nil?
	   etymo.gsub!(/\s/, "")
	   units = etymo.split(/(,|;|\+|ឬ|និង)/)
       units.each do |u|
       	 if (! u.nil?) && (! lookup[u].nil?)
           etymo_count[u] += 1
		   u.gsub!(/\s/, "")
       	   if lookup[u].eql?("ps")
       	 	  keep_word = false
       	   end
         end
       end
    end

	if keep_word && etymo_wrong_field !~ /(បា\.|សំ\.)/
		count_native += 1
		out_dictwithoutps.puts line
		else
		count_ps += 1
		out_dictwithps.puts line
    end
end    

# Post processing summary
puts "Entries without PS: \t#{count_native} \t>>> Ready for next step" 
puts "Entries with PS: \t#{count_ps} \tremoved"


out_count_etymoorigins.puts "Etymology Annotations: Counts\n==============="

etymo_count.keys.each { |entry|
    out_count_etymoorigins.puts "#{entry}: #{etymo_count[entry]}"
}

out_count_etymoorigins.puts "\nEntries with PS: #{count_ps}"
