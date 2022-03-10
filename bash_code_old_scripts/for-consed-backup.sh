#!/bin/bash

filein="species_core_fam18.nuc.txt";

cut -f 2-38 <$filein | sed -e 's/gene_/\>/g' -e 's/_molecule//g' -e 's/_pseudo//g' |head -n 1 > header.tmp

cut -f 39 <$filein >tags.tmp


for i in $(cat tags.tmp); do
	grep "locus$i	" <$filein | cut -f 2-38 | cat header.tmp - >locus"$i".delim
		
		COUNTER=1
		while [  $COUNTER -lt 38 ]; do
			cut -f $COUNTER <locus"$i".delim > locus"$i"_"$COUNTER".fa
			let COUNTER=COUNTER+1 
        	done

	cat locus"$i"_* >locus"$i".fasta

	rm -f locus"$i"_* *.delim

done

mkdir ./loci
mv locus*.fasta ./loci

exit






#/usr/bin/mafft  --fft --retree 2 --reorder "species.fasta" > "species.mafft.aln"
