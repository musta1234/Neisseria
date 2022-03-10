#!/bin/bash

#catlist=$(ls *.mt |sed 's_\.mt__')

#ls loc*_lk.txt | sed 's/\.phy_phyml_lk\.txt//g' >list.tmp

for i in $(cat list.tmp); do
	
	mv $i.phy_phyml_lk.mt $i.mt &

done


exit


#~/Documents/packages/consel/bin/seqmt "$catlist" all_catmt



#/usr/bin/mafft  --fft --retree 2 --reorder "species.fasta" > "species.mafft.aln"
#~/Documents/packages/consel/bin/seqmt --phyml ./loci.lk/$i.txt&

#!/bin/bash



 





