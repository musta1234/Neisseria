#!/bin/bash


for i in  $(cat incomplete.tmp) ; 
	do
	sudo Katz.pl -i $i -c -f phylip -o "$i.phy";   
done;


for j in  $(cat incomplete.tmp); 
	do
	phyml -i $j.phy -b 500 -d nt -f e -v e -a e >$j.log&

done;

exit


