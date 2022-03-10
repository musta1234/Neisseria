
#!/bin/bash

# converts a tabfile to multifasta. first line denotes fasta headers and each column represents individual sequences.


#head  <SNP.txt -n 1 | sed 's/\t/\n/g'>hlist.txt


echo ">" > carat.txt

counter=1

while : [ $counter -lt 64]
do

	less <SNP.txt |awk "{print$"$counter"}"| cat carat.txt - >$counter.fa
	counter=$(($counter +1))

	done

exit
