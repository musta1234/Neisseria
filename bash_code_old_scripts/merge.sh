#! /bin/sh

#merge files;


for i in $(ls *.raw.vcf); do
	bgzip $i;
	tabix -p vcf $i.gz;
	done

vcf-merge *.gz >out.vcf;

exit



