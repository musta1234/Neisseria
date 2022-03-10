#!/bin/bash

# This script concatenates all contig .fasta files in ./MyGenomes folder and saves them in ./catenated folder

count=0
mkdir ./catenated

# This assumes all your contigs are saved in 'MyGenomes' folder and have .fasta extension

for j in $(ls ./MyGenomes/*.fasta | sed 's/\.fasta//')
    do
    count=$(( count + 1 ))

    echo 'processing isolate number .. '"$count" ; 
        
    sed 's/^>.*/NNNNNNNNNNNNNNNNNNNN/g' <./MyGenomes/"$j" \
            | cat <(echo '>'"$j") -  >./catenated/"$j"_mol.fas
    echo "file saved as ..." "./catenated/"$j"_mol.fas" ; sleep 1;
    
    done

exit

