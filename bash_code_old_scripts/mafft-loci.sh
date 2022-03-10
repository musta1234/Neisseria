#!/bin/bash

ls ./loci.empty/locus* | sed -e 's_\.\/loci\.aln\/__g' -e 's_\.aln__g' >aln3.tmp

 for i in $(cat list.tmp); do
	
	mafft --retree 2 --maxiterate 2 --memsave --thread 20 ./loci.fasta/"$i".fasta >./loci.empty/"$i".2.aln &


 done

exit

