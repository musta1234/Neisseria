#!/bin/bash
~/Documents/packages/RAxML/raxml -f h -s all-columns.maf  -T 20 -m GTRGAMMA -t clonal-consensus.nwk -z alltrees.file -n rax_SH-tests >rax_SH-tests.stdout.log &


~/Documents/packages/RAxML/raxml -f g -s all-columns.maf  -T 20 -m GTRGAMMA -t clonal-consensus.nwk -z alltrees.file -n rax-4-CONSEL >rax-4-CONSEL.stdout.log &


exit
