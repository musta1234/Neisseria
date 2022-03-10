#!/bin/sh

# ^^^ tell the computer this is a Unix shhell script
#This code downloads all genomes linked to a particular genome from genbank
# provide a list of species as input in a file named species_list.txt 

mkdir ./MyGenomes

for species in $(cat "species_list.txt"); do
# first loop takes one species at a time and downloads list of genomes 
    genome="ftp://ftp.ncbi.nlm.nih.gov/genomes/refseq/bacteria/"$species"/"
    
    wget "$genome"assembly_summary.txt 
#get the assembly summary file ^^^^^
    mv ./assembly_summary.txt assembly_summary_"$species".txt
# give the assembly summary file a unique name ^^^^
 
    cut -f1,16 <assembly_summary_"$species".txt |tr ' ' '_'\
         | tr "\t" '_' |grep -v '#' >accessions_"$species".txt
# ^^^ slice and dice the assembly summary file to take out the list of accession numbers.

# loop below takes the list of accession numbers and downloads them one at a time
    for i in $(cat accessions_"$species".txt); do
                
       wget -cNrv -t 15 -A "*genomic.fna.gz" ""$genome"latest_assembly_versions/"$i"/"  -P .;
# ask Google what wget command does and how it saves the files that it downloads
    done

	mv -f ./ftp.ncbi.nlm.nih.gov/genomes/refseq/bacteria/latest_assembly_versions/"$species"/ \
                ./MyGenomes/"$species"
# move downloaded genomes to MyGenomes folder

done
exit

## This is how to get genomes for Roary: 
# retrieve_assemblies -a -v -f gff freundii
