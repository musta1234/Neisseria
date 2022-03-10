#!/bin/bash

cp -f ~/Documents/closed_genomes/53442.annot2 .  
cp -f ~/Documents/closed_genomes/53442.fasta .  
cp -f ~/Documents/closed_genomes/Z2491.annot2 .  
cp -f ~/Documents/closed_genomes/Z2491.fasta .  


bgzip 53442.fasta; bgzip 53442.annot2; tabix -s 1 -b 2 -e 3 53442.annot2.gz;

bgzip Z2491.fasta; bgzip Z2491.annot2; tabix -s 1 -b 2 -e 3 Z2491.annot2.gz;


for i in  $(cat listC.txt) ; 

	do

	sed 's/^NC_010120/1/' <$i.recode.vcf \
	 | vcf-annotate -a 53442.annot2.gz  -d key=INFO,ID=ANN,Number=1,Type=Integer,Description='My custom annotation'  -c CHROM,FROM,TO,INFO/ANN > $i.annot.vcf

	
done


for i in  $(cat listA.txt) ; 

	do
	
	sed 's/^NC_003116/1/' <$i.recode.vcf \
	 | vcf-annotate -a Z2491.annot2.gz  -d key=INFO,ID=ANN,Number=1,Type=Integer,Description='My custom annotation'  -c CHROM,FROM,TO,INFO/ANN > $i.annot.vcf


done
exit

#SnpEff gives full annotation details with synonymous/nonsyn etc; 
#May need more cleanup to tease out details 


#vcf-annotate only adds one annotation column;
#easier to deal with if you dont care about the impact of substitution;

