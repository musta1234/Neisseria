
#!/bin/bash

# Catenates *.fa into a fasta file while removing pesky \n vestiges from mytabtofasta.sh
# Mustapha M - March 31st 2014

for i in $(ls *.fa); do
	sed <$i '1s_.__'| sed '2s/^SNP_/\>SNP_'| sed ':a;N;$!ba;s/\n//3g' >"$i"sta
	done

cat *.fasta >multifasta.maf
rm *.fasta 
