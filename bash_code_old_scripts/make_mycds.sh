#!/bin/bash
#makemycds.sh grabs a list of genes from gff2 format file then adds the gff header; 

INFILE='../WUE2594/WUE2594.gff'
OUTFILE="cc5_36_node77genes.gff"

rm -f mycds.tmp

#make sure to use the correct list
#for i in $(cat <cc5_36_genelist.txt |cut -f 3 |sort -u)
#for i in $(cat <cc5_36_genelist.txt |sort -u |grep -v "	299_"|grep "^5"|cut -f 3 |sort -u)

for i in $(cat <cc5_36_genelist.txt |grep "NODE_77_"|cut -f 3 |sort -u)
	do
	grep -m1 "locus_tag="$i"" <"$INFILE" >>mycds.tmp
	done


# grep -m1 "$i"'"' flag for only one match and trailing quote 
#This step cleans up the gff file
cat <(grep "^#" <"$INFILE") mycds.tmp >$OUTFILE

wc -l <$OUTFILE
rm -f mycds.tmp
exit

# seqret -sequence ../GNM28/GNM28.fasta -feature -fformat gff2 -fopenfile cc5_36_ST5no299.gff -osformat2 embl -auto

