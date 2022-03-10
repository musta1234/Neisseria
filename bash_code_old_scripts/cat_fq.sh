#!/bin/bash

for i in $(cat fastq_list.txt)
do
cat ../reads/"$i"_*.fastq >../reads/fastq_cat/"$i".fq
ls ../reads/"$i"*.fastq
done

ls ../reads/fastq_cat/*.fq

exit
