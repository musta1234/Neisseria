#!/bin/bash

#filein="species_core_fam18.nuc.txt";

ls ./loci.lk/*_lk.txt | sed -e 's_\.\/loci\.lk\/__g' -e 's_\.txt__g' >lk1.tmp

for i in $(cat lk1.tmp); do

	~/Documents/packages/consel/bin/seqmt --phyml ./loci.lk/$i.txt&
	#~/Documents/packages/consel/bin/consel 		./loci.lk/$i &	
	#~/Documents/packages/consel/bin/catpv 		./loci.lk/$i &
done



exit






#/usr/bin/mafft  --fft --retree 2 --reorder "species.fasta" > "species.mafft.aln"
