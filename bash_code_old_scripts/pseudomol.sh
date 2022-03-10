#!/bin/bash

rm -f header.tmp 
echo $2 >header.tmp

sed 's/^>.*/NNNNNCACACACTTAATTAATTAAGTGTGTGNNNNN/g' < $1 | cat header.tmp - > $1.mol

rm -f header.tmp

exit
