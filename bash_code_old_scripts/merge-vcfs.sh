#! /bin/bash

genomes=$(ls *.filtered.vcf)

for i in $genomes; do

	bgzip "$i"; tabix -p vcf  "$i".gz
	done

vcf-merge *.tbi > ../merged-and-annotated.vcf

exit


