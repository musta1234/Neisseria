#!/bin/sh

#phyml -i Bigphy2_core200.phy -b 100 -m GTR -f m -v e -a e --print_site_lnl &

/home/mustapha/Documents/packages/RAxML/raxml -f a -p 7799 -x 7799 -m GTRGAMMAI -s Bigphy2_core200.fasta -n Bigphy_raxml -N 100 -p 54321 -T 20 -n Bigphy2_c200_raxboot                                                                                                                                                                                                                                                                    
 

#phyml -i ST11v4_core200.phy -b 200 -m GTR -f m -v e -a e --print_site_lnl &

#phyml -i ST11v4_core.phy -b 200 -m GTR -f m -v e -a e --print_site_lnl &

exit
