#!/bin/bash

echo Locus >locus.tmp
for i in  $(ls *.annot.vcf| sed 's_\.annot\.vcf__' )

	do
	rm -f head.tmp;
	echo "count_"$i"" | paste - locus.tmp >head.tmp; 
	
	grep -v "#" <"$i".annot.vcf|cut -f 8 \
		|sed 's_^.*\;__g' \
		| grep "ANN" \
		|sed 's_ANN\=_\	_g' | sort |uniq -c \
		|sed 's_\ __g' | grep -v ',' |cat head.tmp - >$i.annot.tab

	rm -f head.tmp;
done

# excised\
# |sed 's_ANN\=__g' | sort |uniq -c  | grep -v ',' |cat head.tmp - >$i.annot.tab

#|sed 's_^.*\;__g' \
#Remove those pesky SFs eg: SF=0,1,2;ANN=NMC001
# edited this command to insert tab|sed 's_ANN\=_\	_g';
# Remove al white spaces |sed 's_\ __g'

rm -f locus.tmp;
exit

