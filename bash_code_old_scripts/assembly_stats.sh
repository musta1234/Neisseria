#!/bin/bash

rm -f *.tmp
#cutadapt; turns out cc32 Barosso needs no trimming... it is squeaky clean;
#mkdir assemblies
#ls ./reads/ |grep '.gz'$ |sed 's/_.*//g'|sort -u >fastq_list.txt

for i in $(cat fastq_list.txt )
do
	
grep -c '>' <./assemblies/"$i"/scaffolds.fasta |paste <(echo "$i") - >>stats00.tmp

~/bin/prinseq-lite.pl -fasta ./assemblies/"$i"/scaffolds.fasta \
   --stats_info -stats_assembly |cut -f3| tr '\n' '\t' |paste <(echo "$i") - >>stats01.tmp

zcat ./reads/"$i"_R1.fastq.gz |~/bin/prinseq-lite.pl -fastq stdin \
   --stats_info |cut -f3| tr '\n' '\t' |paste <(echo "$i") - >>stats02.tmp

done;

paste stats00.tmp stats01.tmp stats02.tmp >stats_merge.txt
#cp results.tmp >results.txt
exit



