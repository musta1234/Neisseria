#!/bin/bash

ls *.fsa_nt > list.txt

for i in $(cat list.txt)
do
#Remove everything after a comma
sed 's/gi.*JM/JM/' <"$i"|sed 's/\.1|.*//'>"$i".fasta 
done
