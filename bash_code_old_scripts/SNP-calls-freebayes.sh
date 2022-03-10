#!/bin/bash
#PATH=$PATH:~/Documents/programs/vcftools/perl

#samples=$(cat gz_list2.txt)
ref="ABA2_pb"
filters="+/Q=30"

~/bin/java -jar ~/bin/picard.jar NormalizeFasta \
      I=ABA2_pb.fasta \
      O=ABA2_pb_norm.fasta
mv ABA2_pb_norm.fasta ABA2_pb.fasta 
bwa index -a bwtsw "$ref".fasta
samtools faidx ABA2_pb.fasta


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

freebayes -f "$ref".fasta -p 1 ../SNP/align/*.bam >../SNP/filtered_SNPs_freebayes.vcf

exit
	
