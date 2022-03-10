#!/bin/bash

ls ./loci.empty/locus* | sed -e 's_\.\/loci\.empty\/__g' -e 's_\.aln__g' >aln3.tmp

 for i in $(cat aln3.tmp); do
	
	mafft --retree 2 --maxiterate 2 --memsave --thread 20 ./loci.fasta/"$i".fasta >./loci.empty/"$i".2.aln &


 done

exit

