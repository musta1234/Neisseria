#!/bin/sh

rm -fv sink.tmp

a=0

while [ $a -le 65 ]
do
   echo $a

   tail -n +"$a" <neisserialis_short.tab | head -n1 >b.tmp
   b = $(cat b.tmp)  
   grep "$b" <assembly_summary_genbank.txt >>sink.tmp

   a=`expr $a + 1`
done

