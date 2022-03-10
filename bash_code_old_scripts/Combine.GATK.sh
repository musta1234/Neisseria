#! /bin/bash

##This part creates index files from a reference;

samtools faidx NM3352.fasta; 

bwa index -a bwtsw NM3352.fasta;

java -jar ~/Documents/packages/picard-tools-1.111/picard-tools-1.111/CreateSequenceDictionary.jar R= NM3352.fasta O= NM3352.dict


##This part merges all filterd.vcf files;

ls *.vcf| sed 's/\.filtered\.vcf//g'| sed '/^001/d' >list.tmp

cp 001.filtered.vcf combined.vcf;

for i in $(cat list.tmp); do

java -Xmx2g -jar ~/Documents/packages/GenomeAnalysisTK-3.1-1/GenomeAnalysisTK.jar -R NM3352.fasta -T CombineVariants --variant $i.filtered.vcf --variant combined.vcf -o tmp.vcf;

cp tmp.vcf combined.vcf;

done;


#This portion selects based on our filters and creates tabfiles;

~/vcftools/bin/vcftools --vcf combined.vcf --remove-indels --remove-filtered-all --recode --out combined

vcf-to-tab <combined.recode.vcf >combined.recode.tab

rm -f *.idx *.log *tmp*

exit
