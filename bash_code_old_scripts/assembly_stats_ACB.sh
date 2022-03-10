#!/bin/bash

rm -f *.tmp
#cutadapt; turns out cc32 Barosso needs no trimming... it is squeaky clean;
#mkdir assemblies
#ls ./reads/ |grep '.gz'$ |sed 's/_.*//g'|sort -u >fastq_list.txt

for i in $(cat fastq_list.txt )
do
	
grep -c '>' <../contigs/spades_contigs/"$i".ctg.fasta \
	|paste <(echo "$i") - >>stats00.tmp

~/bin/prinseq-lite.pl -fasta ../contigs/spades_contigs/"$i".ctg.fasta \
	--stats_info -stats_assembly |cut -f3 | tr '\n' '\t' \
	|paste <(echo "$i") - >>stats01.tmp

cat ../reads/"$i"_*.fastq |~/bin/prinseq-lite.pl -fastq stdin \
	--stats_info |cut -f3| tr '\n' '\t' \
	|paste <(echo "$i") - >>stats02.tmp

done;

paste stats00.tmp stats01.tmp stats02.tmp >stats_merge.txt

exit



