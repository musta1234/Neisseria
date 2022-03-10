#!/bin/bash

#ls ./loci.phy/*.aln | sed -e 's_\.\/loci\.phy\/__g' -e 's_\.aln__g' >aln1.tmp

 for i in $(cat aln3.tmp); do
	
	phyml -i "$i".phy -m GTR -f m -v e -a e --print_site_lnl >species"$i".phyml.log&


 done



exit


