#!/bin/bash

for i in $(cat Nm_list00.txt); do

prokka --addgenes --mincontiglen 500 --locustag P --centre X \
    --cpus 4 \
    --outdir ../annotations/"$i" ../N_meningitidis_ctgs/"$i".fas
   
done;

exit

