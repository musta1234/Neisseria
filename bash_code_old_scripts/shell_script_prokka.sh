#!/bin/bash

for y in $(cat list.txt)
do
/usr/local/bioinformatic/prokka-1.11/bin/prokka --compliant --centre F --outdir $y --force --locustag N --prefix $y $y.fas
done

exit
