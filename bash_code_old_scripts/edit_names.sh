#!/bin/sh

sed 's_\/home\/mustapha\/Documents\/genomes\/bigtree\/contigs\/_ _' <bigtree_core.xmfa |  sed 's_\.fna_ _'  |sed 's_\.fasta_ _'|sed 's_\.gb_ _'|sed 's_\.ctg_ _'| sed 's_\_molecule_ _'|sed 's_NM\__ _' >tmp2
 

