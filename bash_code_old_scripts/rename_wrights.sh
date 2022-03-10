#!/bin/bash

rm -f *.tmp
#cutadapt; turns out cc32 Barosso needs no trimming... it is squeaky clean;
#mkdir assemblies
#ls ./reads/ |grep '.gz'$ |sed 's/_.*//g'|sort -u >fastq_list.txt


for i in $(ls *.faa)
do
echo "$i"
cp "$i" (head -n1 <"$i" |sed 's/.*baumannii\ //'|tr -d ']'|sed 's/$/\.faa/')
done

for j in $(ls *.fna)
do
echo "$j"
	paste "$j" <(head -n1 <"$j" |cut -d ' ' -f4|sed 's/$/\.fna/') >>
done

for k in $(ls *.gbff)
do
echo "$k"
cp "$k" (head -n2 <"$k" |tail -n1 |cut -d ' ' -f5|sed 's/$/\.gff/')
done

cd ~/Acinet/lists
exit
