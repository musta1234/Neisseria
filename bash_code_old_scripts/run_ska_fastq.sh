!#/bin/bash

for i in $(cat $1);
do
  ska fastq -o "$i".sample /Reads/"$i"/*.fastq.gz &> out
done

