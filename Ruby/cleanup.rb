# encoding: UTF-8 
without_dup_out = File.open("data/entries_without_dup.txt", "w:UTF-8")
dup_pair_out = File.open("data/entries_dup_pair.txt", "w:UTF-8")
pref_out = File.open("data/entries_prefixes.txt", "w:UTF-8")
unique_out = File.open("data/entries_unique.txt", "w:UTF-8")

khmerword = Hash.new()
khwords = Array.new()

count_without_dup = 0
count_dup = 0
count_pref = 0
count_unique = 0

# Read in the input file one line at a time 
File.open("data/ChuonNath20_original.txt", "r:UTF-8").each do |line|
    
   fields = line.split(" | ")

   #0. remove extra spaces
   hdword = fields[1].strip

   #1. unwanted punctuations "?", "!" and "ៗ" found in headwords are to be removed.
   hdword.gsub!(/\s*[\?\!ៗ]/,"")

   #removed the zero width space
   hdword.gsub!(/[\u200B\u200C\u200D]/, "")

   if hdword =~ /\-\-/
	   pref_out.puts hdword
	   count_pref += 1
   end
   
   if !(hdword =~ /\-\-/)
   	   fields[1] = hdword

   	#  check if this is the first occurrence of this work
       if khmerword[hdword].nil?
       	  khmerword[hdword] = fields.join(" | ")
       	  khwords << hdword
		  unique_out.puts fields.join(" | ")
		  count_unique += 1
       else
       	   dup_pair_out.puts hdword
           dup_pair_out.puts ">>> " + khmerword[hdword]
           dup_pair_out.puts ">>> " + fields.join(" | ")
           dup_pair_out.puts "---"

           # mark the duplicate
           khmerword[fields[1]] = "+"
		   count_dup += 1
       end
   end
end    

# Post processing summary
khwords.each do |word|
	if !(khmerword[word].eql?("+"))
		without_dup_out.puts khmerword[word]
		count_without_dup += 1
	end
end

puts "w/out de-dup entries:	#{count_without_dup}" #entries without dup, dup are in "De-duplicated"
puts "De-dup entries only:    #{count_unique-count_without_dup}"
puts "Total unique words:	#{count_unique} \t>>> Ready for next step"
puts "Duplicates removed:	#{count_dup}"
puts "Prefixes removed:	#{count_pref}"
