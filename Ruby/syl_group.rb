# encoding: UTF-8 
file_out_sg1 = File.open("data/syl_group1.txt", "w:UTF-8")
file_out_sg2 = File.open("data/syl_group2.txt", "w:UTF-8")
file_out_sg3 = File.open("data/syl_group3.txt", "w:UTF-8")
file_out_sg4 = File.open("data/syl_group4.txt", "w:UTF-8")
file_out_sg5 = File.open("data/syl_group5.txt", "w:UTF-8")
file_out_sg11 = File.open("data/syl_group11.txt", "w:UTF-8")
file_out_sg22 = File.open("data/syl_group22.txt", "w:UTF-8")
file_out_sg33 = File.open("data/syl_group33.txt", "w:UTF-8")
file_out_sg44 = File.open("data/syl_group44.txt", "w:UTF-8")
file_out_sg55 = File.open("data/syl_group55.txt", "w:UTF-8")
#file_out_sg111 = File.open("data/syl_group111.txt", "w:UTF-8")
#file_out_sg1111 = File.open("data/syl_group222.txt", "w:UTF-8")

file_out_remains = File.open("data/syl_group_remain.txt", "w:UTF-8")

count_sg1 = 0
count_sg2 = 0
count_sg3 = 0
count_sg4 = 0
count_sg5 = 0
count_sg11 = 0
count_sg22 = 0
count_sg33 = 0
count_sg44 = 0
count_sg55 = 0
#count_sg111 = 0
#count_sg1111 = 0

count_remains = 0

# Read in the input file one line at a time 
File.open("data/dict_no_ps_pron.txt", "r:UTF-8").each do |line|

	  fields = line.split(" | ")
	  headword = fields[1]
	  headword.gsub!(/[\u200B\u200C\u200D]/,"")

#monosyllabic structure: C(S)(៏)(៊/៉)(V)(D1)(F)(D2)
#C=consonant,S=subscript,V=vowel,D1=kakabat,F=final consonant,D2=bantoc
if headword =~ /^([ក-អ](្[ក-អ])?[៏]?[៊៉]?)([ា-ៅ]?[ំះ]?)(៎?)(([ក-អ]?)(់?))$/

		count_sg1 += 1
		file_out_sg1.puts headword
		
#disyllablic structure type 1: CNS(៊/៉)(V)(D1)(F)(D2)
#1st syl=CN; 2nd syl=S(៊/៉)(V)(D1)(F)(D2)
	elsif headword =~ /^([ក-អ][ងញនណម])((្[ក-អ])([៊៉]?)){1,2}([ា-ៅ]?[ំះ]?)(៎?)(([ក-អ]?)(់?))$/

		count_sg2 += 1
		file_out_sg2.puts headword

#disyllablic structure type 2: Cr(C)(៊/៉)(V)(D1)(F)(D2)
#1st syl=Cr; 2nd syl= Cr(C)(៊/៉)(V)(D1)(F)(D2)
	elsif headword =~ /^([ក-អ]្រ)[ក-អ](្[ក-អ])?[៊៉]?([ា-ៅ]?[ំះ]?)(៎?)(([ក-អ]?)(់?))$/

		count_sg3 += 1
		file_out_sg3.puts headword

#disyllablic structure type 3: C(៊/៉)C(S)(៊/៉)(V)(D1)(F)(D2)
#1st syl=C(៊/៉); 2nd syl= C(៊/៉)C(S)(៊/៉)(V)(D1)(F)(D2)
	elsif headword =~ /^([ក-អ][៊៉]?)([ក-អ](្[ក-អ])?[៊៉]?)([ា-ៅ]?[ំះ]?)(៎?)(([ក-អ]?)(់?))$/

		count_sg4 += 1
		file_out_sg4.puts headword

#disyllablic structure type 4: CំC(S)(៊/៉)(V)(D1)(F)(D2)
#1st syl=Cំ; 2nd syl= CំC(S)(៊/៉)(V)(D1)(F)(D2)
	elsif headword =~ /^([ក-អ][ំ])([ក-អ](្[ក-អ])?[៊៉]?)([ា-ៅ]?[ំះ]?)(៎?)(([ក-អ]?)(់?))$/

		count_sg5 += 1
		file_out_sg5.puts headword
		
#full disyllablic: C(S)(៊/៉)(V)(D1)(F)(D2)+C(S)(៊/៉)(V)(D1)(F)(D2)
#(two monosyllabic words)	2x
	elsif headword =~ /^(([ក-អ](្[ក-អ])?[៊៉]?)([ា-ៅ]?[ំះ]?)(៎?)(([ក-អ]?)(់?))){2}$/

		count_sg11 += 1
		file_out_sg11.puts headword

#double disyllablic structure type 1: CN(S)(៊/៉)(V)(D1)(F)(D2)+CN(S)(៊/៉)(V)(D1)(F)(D2)
#1st syl=CN; 2nd syl=(S)(៊/៉)(V)(D1)(F)(D2)	2x
	elsif headword =~ /^(([ក-អ][ងញនណម])((្[ក-អ])([៊៉]?)){1,2}([ា-ៅ]?[ំះ]?)(៎?)(([ក-អ]?)(់?))){2}$/

		count_sg22 += 1
		file_out_sg22.puts headword

#double disyllablic structure type 2: Cr(C)(៊/៉)(V)(D1)(F)(D2)
#1st syl=Cr; 2nd syl=Cr(C)(៊/៉)(V)(D1)(F)(D2)	2x
	elsif headword =~ /^(([ក-អ]្រ)[ក-អ](្[ក-អ])?[៊៉]?([ា-ៅ]?[ំះ]?)(៎?)(([ក-អ]?)(់?))){2}$/

		count_sg33 += 1
		file_out_sg33.puts headword

#double disyllablic structure type 3: C(៊/៉)C(S)(៊/៉)(V)(D1)(F)(D2)
#1st syl=C(៊/៉); 2nd syl= C(៊/៉)C(S)(៊/៉)(V)(D1)(F)(D2)		2x
	elsif headword =~ /^(([ក-អ][៊៉]?)([ក-អ](្[ក-អ])?[៊៉]?)([ា-ៅ]?[ំះ]?)(៎?)(([ក-អ]?)(់?))){2}$/

		count_sg44 += 1
		file_out_sg44.puts headword
		
#full disyllablic structure type 4: CំC(S)(៊/៉)(V)(D1)(F)(D2)
#1st syl=Cំ; 2nd syl= CំC(S)(៊/៉)(V)(D1)(F)(D2)
	elsif headword =~ /^(([ក-អ][ំ])([ក-អ](្[ក-អ])?[៊៉]?)([ា-ៅ]?[ំះ]?)(៎?)(([ក-អ]?)(់?))){2}$/

		count_sg55 += 1
		file_out_sg55.puts headword

=begin
#full trisyllablic: C(S)(៊/៉)(V)(D1)(F)(D2)
#(three monosyllabic words)	3x
	elsif headword =~ /^(([ក-អ](្[ក-អ])?[៊៉]?)([ា-ៅ]?[ំះ]?)(៎?)(([ក-អ]?)(់?))){3}$/

		count_sg111 += 1
		file_out_sg111.puts headword

#full quadruple-syllablic: C(S)(៊/៉)(V)(D1)(F)(D2)
#(four monosyllabic words)	4x
	elsif headword =~ /^(([ក-អ](្[ក-អ])?[៊៉]?)([ា-ៅ]?[ំះ]?)(៎?)(([ក-អ]?)(់?))){4}$/

		count_sg1111 += 1
		file_out_sg1111.puts headword
=end

#	words left for the next syllable grouping process.
	else
		count_remains += 1
		file_out_remains.puts headword
    end

end    

puts "Native Wordlist: \t\t#{count_sg1+count_sg2+count_sg3+count_sg4+count_sg5+count_sg11+count_sg22+count_sg33+count_sg44+count_sg55+count_remains}"
puts "Monosyllabic Words: \t\t#{count_sg1}"
puts "Disyllabic Words: \t\t#{count_sg2+count_sg3+count_sg4+count_sg5}"
puts "--Type 1: \t\t\t#{count_sg2}"
puts "--Type 2: \t\t\t#{count_sg3}"
puts "--Type 3: \t\t\t#{count_sg4}"
puts "--Type 4: \t\t\t#{count_sg5}"
puts "Double Syllabic Words \t\t#{count_sg11+(count_sg22+count_sg33+count_sg44+count_sg55)}"
puts "Double Monosyllabic Words: \t#{count_sg11}"
puts "Double Disyllabic Words: \t#{count_sg22+count_sg33+count_sg44+count_sg55}"
#puts "three monosyllable:	#{count_sg111}"
#puts "four monosyllable:	#{count_sg1111}"

puts "remains: \t\t\t#{count_remains}"
