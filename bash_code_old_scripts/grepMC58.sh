#!/bin/bash
sed 's_\/__g' <merged.recode.tab | \
		sed 's_\._\-_g'| tail -n +2 > body.tmp;

head -n 1 <merged.recode.tab | tr '\t' '$'| sed 's/\$/\	SNP_/g' | cat - body.tmp >stump.tmp;

cut -f 2- stump.tmp | sed '1s/SNP_POS	SNP_REF/POS	REF/' > merged.nochr.tabfiles;
cut -f 3- stump.tmp | sed '1s/SNP_REF/REF/'> merged.nopos.tabfiles; 

rm *tmp

exit;




