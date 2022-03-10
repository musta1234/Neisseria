#!/bin/bash

original="all-genes-stata.tab";

filein="concat-all.tab";

cut -f 1 --complement <$original | sed -e '1s_0fam18_fam18_' >$filein

COUNTER=1
	while [  $COUNTER -le 49 ]; do

	cut -f $COUNTER <$filein | sed -e 's/gene_/\>/g' \
				|sed -e 's/NM3352/M7124/g' \
					-e 's_^>.*joiner__g' \
					-e 's_ender__g' \
					-e 's_ende__g' \
					-e 's_end__g' \
					-e 's_en__g' \
					-e 's_e__g' \
					-e 's_r__g' \
				| tr 'a-z' 'A-Z' >column_$COUNTER.fa 

	let COUNTER=COUNTER+1 ;		done

cat column*.fa >all-columns.fna
rm -f column*.fa


exit


