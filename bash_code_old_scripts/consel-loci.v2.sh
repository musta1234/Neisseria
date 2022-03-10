#!/bin/bash

catlist=$(ls *.mt |sed 's_\.mt__')


~/Documents/packages/consel/bin/catmt "$catlist" all_catmt



#/usr/bin/mafft  --fft --retree 2 --reorder "species.fasta" > "species.mafft.aln"
#~/Documents/packages/consel/bin/seqmt --phyml ./loci.lk/$i.txt&
