<h2>Introduction</h2>
<p>This repository stores source codes used in a research project entitled: "Phonological Principles and Automatic Phonemic and Phonetic Transcription of Khmer Words" which was presented in partial fulfillment of the requirements for the degree of Master OF Arts in Linguistics at the International College of Payap University, Thailand, in 2016.</p>

There are two source codes:
    <ol>     
        <li>Ruby codes for data prepration processes</li>
        <li>Thrax codes for the conversion processes</li>
    </ol> 

    
<h2><a href="https://www.ruby-lang.org/en/">Ruby Codes</a></h2>
Data Preparation:
    <ul>     
        <li>cleanup.rb --removing stray characters, prefixes and duplicate entries</li>
        <li>filter1.rb --removing Pali/Sanskrit loanwords using etymological tags</li>
        <li>filter2.rb --removing P/S loanwords using diacritics and independent vowels</li>
        <li>filter3.rb --removing P/S loanwords using pronunciation field</li>
        <li>syl_group.rb --grouping native khmer words into their respective syllable groups</li>
        <li>data --containing 18,948 entries from Khmer-Khmer Dictionary (1967)</li>
    </ul> 

<h2><a href="http://openfst.cs.nyu.edu/twiki/bin/view/GRM/ThraxQuickTour">Thrax Codes</a></h2>
The conversion grammars:
    <ul>     
        <li>automator_phonemic.grm</li>
        <li>automator_phonetic.grm</li>
    </ul> 
    
<h2>Try them out</h2>
You may try these out by first running the Ruby codes in the aforementioned order (make sure you have Ruby installed). 
when you have all native words in their respective syllable groups, you may be able to the Thrax grammar, either the g2p one or the p2p one, on them one file at a time (make sure you have Thrax installed).

<h2>Inquiry</h2>

All inquiries should be redirected to <a href="mailto:makara_sok@hotmail.com">makara_sok@hotmail.com</a>.

<h2>Copyright &copy; Makara Sok</h2>
<h2>Payap University 2016</h2>