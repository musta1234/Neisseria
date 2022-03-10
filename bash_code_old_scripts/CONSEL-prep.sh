#!/bin/bash

ls locus*_lk.txt | sed -e 's_\.phy_phyml_lk\.txt__g' >lk.list

 for i in $(cat lk.list); do
	
	cat $i >>lk

 done

exit


