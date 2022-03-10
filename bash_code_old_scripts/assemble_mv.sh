#!/bin/bash

mkdir ~/Documents/Acinet/contigs/spades_contigs_v2

for i in $(cat ctg_list.txt); do
	cp -f  ../assemblies/"$i"/scaffolds.fasta \
		~/Documents/Acinet/contigs/spades_contigs_v2/"$i".ctg.fasta

done
