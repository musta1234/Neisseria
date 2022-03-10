#!/bin/sh

phyml -i ../big-files/bigtree.phy -b 200 -m GTR -v e -a e --print_site_lnl --no_memory_check >stdout-boots.txt&
