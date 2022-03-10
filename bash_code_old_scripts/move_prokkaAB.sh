#!/bin/bash
#rename annotation files after prokka step ;
  
rm -f *.tmp

for i in $(ls ../annotations/ )
do

rename -v 's/P_.*\./'"$i"'\./' ../annotations/"$i"/*

#ln -s -v /home/mustapha/Documents/PubMLST_contigs/renamed_NM_ctgs/"$i".fas ../NM_ST32/

done;

exit



