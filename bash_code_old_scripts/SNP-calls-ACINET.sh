#!/bin/bash

samples=$(cat fastq_list.txt)
ref="ABA2_pb.fasta"
filters="+/Q=30"

bwa index -a bwtsw "$ref"
samtools faidx $ref

for i in $samples; do
	bwa mem -t 16 "$ref" "../reads/fastq_cat/"$i".fq" \
		|samtools view -S -b - \
		|samtools sort - "$i" ;
	samtools index $i.bam

	mv $i.bam ../SNP/align/
	mv $i.bai ../SNP/align/
done

#samtools mpileup -u -f $ref ./align/$i.bam \
#	|bcftools view -g - \
#	|vcf-annotate -f $filters >./filtered-vcf/$.filtered.vcf

	
