#!/bin/bash

for i in $(cat gz_list2.txt)
do
spades.py --careful -k 21,33,55,77,99,127 -t 16 \
	-1 ../reads/"$i"_R1.fastq.gz \
	-2 ../reads/"$i"_R2.fastq.gz \
	-o ../assemblies/"$i"_gz 
done
