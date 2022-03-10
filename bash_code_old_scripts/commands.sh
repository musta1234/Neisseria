cat Genes_cc4821_32_CFML.txt |sed 's/^53442_//'|cut -f2|grep -v 'sseqid'|sort -u >Gene_list_cc4821_32.txt

cat Genes_cc4821_32_CFML.txt |sed 's/^53442_//'|cut -f1|grep -v 'qseqid'|sed 's/NODE_/NODEX/'|tr '_' "\t"|sed 's/NODEX/NODE_/'|paste - <(cat Genes_cc4821_32_CFML.txt|cut -f2| grep -v 'sseqid') >Gene_genome_list_cc4821_32.txt


cat cc5_36_genecoord.txt |cut -f1|grep -v 'qseqid'|sed 's/NODE_/NODEX/'|tr '_' "\t"|sed 's/NODEX/NODE_/'|paste - <(cat Genes_cc4821_32_CFML.txt|cut -f2| grep -v 'sseqid') >cc5_36_listsubseq.txt

 seqret -sequence ../GNM28/GNM28.fasta -feature -fformat gff2 -fopenfile cc5_36_only299.gff -osformat2 embl -auto
  

   grep -n '>' <cc5_36_stripped.fasta |head

  799  sed -n '232193,261216 p' <cc5_36_stripped.fasta >WUE2594_core36.fasta
  800  ./subseqs_CFML.sh
  801  cat *.seq >cc5_36_allsubseq.fasta
  
  805  blastn -query cc5_36_allsubseq.fasta -subject ../WUE2594/WUE2594.fna -outfmt '6 std qlen slen' -out cc5_36_geneblast.tmp
  806  blastn -query cc5_36_allsubseq.fasta -subject ../WUE2594/WUE2594.fasta -outfmt '6 std qlen slen' -out cc5_36_genomeblast.tmp
  
  811 cat cc5_36_genomeblast.tmp |cut -f2,14 --complement|sed 's/^WUE2594_//' >cc5_36_genomeblast.tx
  8
