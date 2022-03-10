#!/bin/sh
#mkdir ../other_Neisseria_spp
for i in $(cat move_these_ctgs.txt)
do

mv -v ../CONTIGS_PubMLST/"$i"_*  ../other_Neisseria_spp/

done
