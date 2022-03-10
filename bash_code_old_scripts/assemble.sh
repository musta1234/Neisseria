#!/bin/bash

#cutadapt; turns out cc32 Barosso needs no trimming... it is squeaky clean;
#mkdir assemblies
#ls ./reads/ |grep '.gz'$ |sed 's/_.*//g'|sort -u >fastq_list.txt

for i in $(cat fastq_list.txt )
do
	
spades.py --careful -k 21,33,55,77,99,127 -1 ./reads/"$i"_R1.fastq.gz -2 ./reads/"$i"_R2.fastq.gz -o ./assemblies/"$i"
   
done;

#cp results.tmp >results.txt
exit



