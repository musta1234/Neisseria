#!/bin/bash

# This is my first script--- fingers crossed
# This tool will remove indels and low quality SNPs from a bunch of annotated and filtered vcf files March 25 2014 then generate output in .tab format

# Second, I will use this script to clean up .tab files and place them in a separate .tabfiles folder


for i in  $(ls *vcf ) ; 

	do

	~/vcftools/bin/vcftools --vcf $i --remove-indels --remove-filtered-all --recode --out $i

			#vcftools located at /usr/bin/ does not have --remove-indels functions so I had to improvise

	vcf-to-tab < $i.recode.vcf > $i.tab

	done

rm  *.recode.vcf *.log *.vcfidx 

# The hashed code below converts tab to tabfiles

#mkdir tabfiles

#for j in  $(ls *tab ) ; do

#sed < $j 	's_G\/G_G_g'|
#		sed 's_C\/C_C_g'|
#		sed 's_T\/T_T_g'|
#		sed 's_A\/A_A_g'|
#		sed '1s_align\/__'|
#		sed '1s_\.bam__'|
#		sed '1s_\#__' > ./tabfiles/"$j"files
#
#				done
#
#
exit



