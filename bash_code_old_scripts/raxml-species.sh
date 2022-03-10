#!/bin/bash


#convert .aln from fasta to .phy

#./Katz.pl -i ./species/species.aln -f phylip -c -o ./species/species.phy&


#phyml -i species.phy -m GTR -f m -v e -a e -b 100 >species.phy-boot.log&



/home/mustapha/Documents/packages/RAxML/raxml -f a -m GTRGAMMAI -s species.aln -n species_raxml -x 54321 -N 100 -p 54321 -T 20 >species.raxml.log&                                                                                                                                                                                                                                                                         
 

#phyml -i ST11v4_core200.phy -b 200 -m GTR -f m -v e -a e --print_site_lnl &

#phyml -i ST11v4_core.phy -b 200 -m GTR -f m -v e -a e --print_site_lnl &
exit
