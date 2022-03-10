#!/bin/bash

#ls ./loci.phy/*.aln | sed -e 's_\.\/loci\.phy\/__g' -e 's_\.aln__g' >aln1.tmp

 for i in $(cat aln3.tmp); do
	
	perl ./Katz.pl -i ./loci.aln/"$i".aln -o ./loci.phy/"$i".phy -c -f phylip -g fasta &


 done

exit

