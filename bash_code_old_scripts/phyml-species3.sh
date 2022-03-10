#!/bin/bash


#convert .aln from fasta to .phy

#./Katz.pl -i ./species/species.aln -f phylip -c -o ./species/species.phy&


for i in $(ls *.phy); do

mpirun -n 20 /home/mustapha/Documents/packages/phyml-mpi/src/phyml-mpi -i $i -m GTR -f m -v e -a e -b 100  >$i-boot.log&

done

#phyml -i Jul17_core.phy -m GTR -f m -v e -a e -s BEST >Jul17.phy-ML_only.log&

#/home/mustapha/Documents/packages/RAxML/raxml -f d -m GTRGAMMAI -s species.aln -n species_raxml -b 54321 -N 100 -p 54321 -T 20 >species.raxml.log&                                                                                                                                                                                                                                                                         
 

#phyml -i ST11v4_core200.phy -b 200 -m GTR -f m -v e -a e --print_site_lnl &

#phyml -i ST11v4_core.phy -b 200 -m GTR -f m -v e -a e --print_site_lnl &
exit
