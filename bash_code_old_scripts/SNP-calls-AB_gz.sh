#!/bin/bash

samples=$(cat gz_list2.txt)
ref="ABA2_pb.fasta"
filters="+/Q=30"

#bwa index -a bwtsw "$ref"
#samtools faidx "$ref"

for i in $samples; do
	bwa mem -t 12 "$ref" "../reads/"$i"_R1.fastq.gz" "../reads/"$i"_R2.fastq.gz" \
		|samtools view -S -b - \
		|samtools sort - "$i" ;
	samtools index $i.bam

	mv $i.bam ../SNP/align_gz/
	mv $i.bam.bai ../SNP/align_gz/
done

#samtools mpileup -u -f $ref ./align/$i.bam \
#	|bcftools view -g - \
#	|vcf-annotate -f $filters >./filtered-vcf/$.filtered.vcf

	
