#!/bin/bash

# This is my first script--- fingers crossed
# this tool will remove indels and low quality SNPs from a bunch of annotated and filtered vcf files


for i in  $(ls *vcf ) ; do

~/vcftools/bin/vcftools --vcf $i --remove-indels --remove-filtered-all --recode --out $i

vcf-to-tab < $i.recode.vcf > $i.tab

done
rm  *.recode.vcf *.log *.vcfidx 

exit



