#!/bin/bash

ls locus*.fasta | sed -e 's_\.fasta__g' >list-fasta.tmp

for i in $(cat list-fasta.tmp); do
	
	mafft --thread 8 "$i".fasta >"$i".aln
		
done


#exit


ls locus*.aln | sed -e 's_\.aln__g' >list-aln.tmp

for j in $(cat list-aln.tmp); do
	
	perl /home/mustapha/Documents/cool_scripts/Katz.pl \
			-i "$j".aln -o "$j".phy -c -f phylip -g fasta 

done


exit




