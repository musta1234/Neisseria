#!/bin/bash



for i in $(cat ctg_list.txt); do

prokka --addgenes --mincontiglen 500 --locustag P --centre X \
    --outdir ../annotations/"$i" ../contigs/spades_contigs/"$i".ctg.fasta
   
done;

exit

