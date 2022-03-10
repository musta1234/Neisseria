#!/bin/bash
## Create protein aln by species
j=' '

mkdir ../aln_by_species

for i in $(cat species_list.txt);
 do
 cat ../aln/presence_absence_40_LIST.tab | grep "$i"|cut -f 2,6 \
  |grep -Pv '\t$'|sed -e 's/^/\>/' -e 's/\-//'|tr '\t' '\n' \
    >../aln_by_species/"$i"_raw.faa
 
 j=$(grep -c '>' <../aln_by_species/"$i"_raw.faa)
 echo "For species "$i", we found "$j" sequences"
done

exit

for i in $(cat species_list.txt);
do
mafft --auto --amino --reorder ../aln_by_species/"$i"_raw.faa >../aln_by_species/"$i".aln;
done;

 
for i in $(cat ../lists/species_list.txt);
do
raxmlHPC-PTHREADS-AVX -f d -m PROTGAMMAAUTO -s "$i".aln -p 7654 -T 4 -n "$i"_unreduced
done;


for i in $(ls *.aln.reduced|sed 's/\.aln\.reduced//');
do
 echo "$i"
 cat "$i".aln.reduced | sed 's/^/'"$i""\t"'/' | tail -n+2| cut -f 1-2 \
   | tee > ../lists/"$i"_reduced_ID_list.txt |wc -l
  
done;
