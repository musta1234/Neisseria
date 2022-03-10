#!/bin/bash

samples=$(cat samples.txt);
ref="NM3352.fasta";

bwa index -a bwtsw NM3352.fasta;
samtools faidx NM3352.fasta;

filters="+/Q=30"

for i in $samples; do

	bwa bwasw -t 24 NM3352.fasta "reads/"$i".fastq.gz" | samtools view -S -b - | samtools sort - "$i" ;
	
	samtools index "$i.bam";

	mv "$i.bam" ./align/ ;
	mv "$i.bai" ./align/ ;

        samtools mpileup -u -f NM3352.fasta ./align/"$i".bam | bcftools view -g - \
                 | vcf-annotate -f "$filters"  >./filtered.vcf/"$i".filtered.vcf
	
	
done;

exit
