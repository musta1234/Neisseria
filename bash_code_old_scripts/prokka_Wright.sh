#!/bin/bash



for i in $(cat wright_list.txt); do

prokka --addgenes --mincontiglen 500 --locustag P --centre X \
    --outdir ../annotations/WrightAdams/"$i" ../contigs/spades_contigs/"$i".fasta
   
done;

exit

