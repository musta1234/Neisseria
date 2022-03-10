#!/bin/bash

for seq in 33_contigs/*fna
do
  echo "$seq"
  perl prinseq-lite.pl -fasta -stats_all > "$seq" 
done

