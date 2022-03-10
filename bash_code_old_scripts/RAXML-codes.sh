#!/bin/bash

ls ./loci.tree/locus*tree.txt | sed 's/\.phy_phyml_tree\.txt//g' >alltrees.list


#SH-test only:
/home/mustapha/Documents/packages/RAxML/raxml -f h -s species.phy -T 20 -m \ GTRGAMMA -t species.phy_phyml_tree.txt -z all_trees.nwk -n all_loci_raxml& 


#CONSEL output (tree-puzzle format) 
/home/mustapha/Documents/packages/RAxML/raxml -f g -s species.phy -T 20 -m \ GTRGAMMA -z all_trees.nwk -n all_     loci_rax4consel& 




##########
 done
exit

phyml -i all_loci.phy -m GTR -f m -v e -a e --print_site_lnl >all_loci.phyml.log&
