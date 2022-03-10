cat Genes_cc4821_32_CFML.txt |sed 's/^53442_//'|cut -f2|grep -v 'sseqid'|sort -u >Gene_list_cc4821_32.txt

cat Genes_cc4821_32_CFML.txt |sed 's/^53442_//'|cut -f1|grep -v 'qseqid'|sed 's/NODE_/NODEX/'|tr '_' "\t"|sed 's/NODEX/NODE_/'|paste - <(cat Genes_cc4821_32_CFML.txt|cut -f2| grep -v 'sseqid') >Gene_genome_list_cc4821_32.txt

