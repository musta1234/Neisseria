#!/bin/bash

rm -f mycds.tmp

for i in $(cat Gene_list_cc4821_32.txt)
	do
	grep -m1 "$i"'"' <53442.gff >>mycds.tmp
	done
# grep -m1 flag keeps only the first match; '"' includes the trailing quote
#This step cleans up the gff file
cat mycds.tmp| grep -v 'CDS'|cat <(grep "^#" <53442.gff) - >Genes_cc4821_32.gff

wc -l <Genes_cc4821_32.gff
rm -f mycds.tmp
exit

