#!/bin/bash
#PATH=$PATH:~/Documents/programs/vcftools/perl
#make_SNP_indices.sh

PATH=~/bin/:$PATH    ;export PATH
samples=$(cat gz_list2.txt)
ref="ABA2_pb"
filters="+/Q=30"

samtools index ../SNP/SNP_merged.bam ../SNP/SNP_merged.bam.bai
~/bin/java -jar ~/bin/GenomeAnalysisTK.jar \
     -R "$ref".fasta \
     -ploidy 1 \
     -T HaplotypeCaller \
     -I ../SNP/SNP_merged.bam \
     -o ../SNP/SNP_gatk_raw.vcf 

#bwa index -a bwtsw "$ref".fasta
#samtools faidx "$ref".fasta
#~/bin/java -jar ~/bin/picard.jar CreateSequenceDictionary R= "$ref".fasta O= "$ref".dict
#for i in $samples; do
#	bwa mem -t 12 "$ref" "../reads/"$i"_R1.fastq.gz" "../reads/"$i"_R2.fastq.gz" \
#		|samtools view -S -b - \

#		|samtools sort - "$i" ;
#	samtools index $i.bam

#	mv $i.bam ../SNP/align_gz/
#	mv $i.bam.bai ../SNP/align_gz/

#samtools mpileup -u -f "$ref" ../SNP/align/*.bam \
#	|bcftools view -g - \
#	|~/Documents/programs/vcftools/perl/vcf-annotate -f $filters >../SNP/filtered_SNPs.vcf
#done

#freebayes -f "$ref" -p 1 ../SNP/align/*.bam >../SNP/filtered_SNPs_freebayes.vcf

#How to get a merged bam file
# samtools merge SNP_merged.bam ./align/*.bam |



exit
	
