#!/bin/bash

# This is my first script--- fingers crossed
# This tool will remove indels and low quality SNPs from a bunch of annotated and filtered vcf files March 25 2014 then generate output in .tab format

# Second, I will use this script to clean up .tab files and place them in a separate .tabfiles folder


for i in  $(ls *.filtered.vcf| sed 's_\.filtered\.vcf__g' ) ; 

	do

	~/vcftools/bin/vcftools --vcf "$i".filtered.vcf --remove-indels --remove-filtered-all --recode --out $i; vcf-to-tab < $i.recode.vcf > $i.tab

			#vcftools located at /usr/bin/ does not have --remove-indels functions so I had to improvise
	
	done

#Begin tab-to-tabfiles.sh

NOW=$(date +"%m-%d-%Y-%R")

mkdir ../tabfiles."$NOW"

for j in  $(ls *.tab ) ; # This part deals with all diploid calls and comment lines 
	do
	sed < $j	's_G\/G_G_g'| 
		sed 's_C\/C_C_g'|
		sed 's_T\/T_T_g'|
		sed 's_A\/A_A_g'|
		sed '1s_align\/__'|
		sed '1s_\.bam__'|
		sed '1s_\#__'|
		sed '/\//d'|
		sed '1s:REF	:REF	SNP_:' > ../tabfiles.$NOW/"$j"files

	done


#ls ../tabfiles.$NOW/*.tabfiles | sed 's_\.filtered\.vcf\.tabfiles__' > ../tabfiles.$NOW/file-list.txt

rm -f *.tab *.recode.vcf *.log *.vcfidx

exit



