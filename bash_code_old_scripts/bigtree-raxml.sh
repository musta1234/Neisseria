#!/bin/sh

raxmlHPC -s ./big-files/bigtree_core.phy -n ./bigphy/bigtree_core.raxml -m GTRGAMMAI -T 12 -N 100 >stdout.raxml.core.txt&;

raxmlHPC -s ./big-files/bigtree.phy -n ./bigphy/bigtree.raxml -m GTRGAMMAI -T 12 -N 100 >stdout.raxml.txt&


