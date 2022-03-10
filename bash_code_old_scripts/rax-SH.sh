#!/bin/bash
~/Documents/packages/RAxML/raxml -f H -s all-columns.maf  -T 20 -m GTRGAMMA -t bigML.nwk -z alltrees.file -n rax_SH-tests >rax_SH-tests.stdout.log &




exit
