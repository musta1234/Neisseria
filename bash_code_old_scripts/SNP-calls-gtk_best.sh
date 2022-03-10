#!/bin/bash
#export PERL5LIB=/usr/local/lib/perl5/site_perl:${PERL5LIB}
#export PATH=~/bin:$PATH

samples=$(cat ctg_list.txt)
samples_i=$(cat gz_list.txt)
samples_j=$(cat fastq_list.txt)

ref="ABA2_pb"
filters="+/Q=30"

#bwa index -a bwtsw "$ref".fasta
#samtools faidx "$ref".fasta
mkdir ../SNP/bwamem

for i in $samples_i; do

# bwa mem -M	Mark shorter split hits as secondary (for Picard compatibility).
#-R STR 	Complete read group header line.

	bwa mem -M -t 12 "$ref".fasta "../reads/"$i"_R1.fastq.gz" "../reads/"$i"_R2.fastq.gz" \
		|samtools view -S -b - \
		|samtools sort - "$i" ;
	samtools index $i.bam
	mv $i.bam ../SNP/align2/
	mv $i.bam.bai ../SNP/align2/


#java -jar ~/bin/picard.jar MarkDulicates IN=value1 OUT=value2..

#samtools mpileup -u -f "$ref".fasta ../SNP/align/"$i".bam \
#	|bcftools view -g - \
#	|vcf-annotate -f $filters >../SNP/filtered_vcf/"$i".filtered.vcf
done

for j in $samples_j; do

	bwa mem -M -t 12 "$ref".fasta ../reads/fastq_cat/"$j".fq \
		|samtools view -S -b - \
		|samtools sort - "$j" ;
	samtools index $j.bam
	mv "$j.bam" ../SNP/align2/
	mv "$j.bam.bai" ../SNP/align2/
done

exit


	
