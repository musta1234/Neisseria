#!/bin/bash

for i in $(cat ctg_list.txt)
do
spades.py --careful -k 21,33,55,77,99,127 \
	-1 ../reads/"$i"_R1.fastq \
	-2 ../reads/"$i"_R2.fastq \
	-o ../assemblies/"$i" -t 8
done
