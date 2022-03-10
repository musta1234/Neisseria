#!/bin/bash

rm -f *.fasta
ln -s ~/Documents/Shanghai_project/cc5_80_mauve/cc5_80_stripped.fasta .
ln -s ~/Documents/Shanghai_project/cc5_90_mauve/cc5_90_stripped.fasta .

raxmlHPC-PTHREADS-AVX -s cc5_80_stripped.fasta -p 575038 -x 253236 -f a -# 1000 -m GTRGAMMA -n cc5_80_ML1k -k -T4&

raxmlHPC-PTHREADS-AVX -s cc5_80_stripped.fasta -p 587508 -m GTRGAMMA -n cc5_80_ML -k -T4&

raxmlHPC-PTHREADS-AVX -s cc5_90_stripped.fasta -p 585038 -x 2532836 -f a -# 1000 -m GTRGAMMA -n cc5_90_ML1k -k -T4&

raxmlHPC-PTHREADS-AVX -s cc5_90_stripped.fasta -p 5875038 -m GTRGAMMA -n cc5_90_ML -k -T4&

exit
