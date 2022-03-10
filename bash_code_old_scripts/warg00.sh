#!/bin/bash

COUNTER=1
	while [  $COUNTER -le 697 ]; do
	
	warg -a 1,1,0.1,1,1,1,1,1,0,0,0 -x 100000 -y 100000 -z 1000 clonaltree.nwk Jul17_core.xmfa.$COUNTER core_co.phase2.$COUNTER.xml&

	done
exit
