#!/bin/bash


ls locus*.aln | sed -e 's_\.aln__g' > aln.list
rm -f ../out.xmfa

echo "=" >carat.tmp;

for i in $(cat aln.list ); do
	cat $i.aln carat.tmp >>../out.xmfa
done



exit 
