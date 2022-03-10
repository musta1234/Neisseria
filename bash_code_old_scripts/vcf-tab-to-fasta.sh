
rm -f ../SNP_marissa/*.tmp
a=1

while [ $a -lt 58 ]
do
echo "$x"
x=$(head -n1 <../SNP_marissa/acinet.core16snps.tab |tr , '\n'|head -n "$a"|tail -n1)
echo "$x"
cat ../SNP_marissa/acinet.core16snps.tab|tr ',' '\t'|cut -f "$a" |tr '\n' '\t'|cut -f1 --complement|tr -d '\t'|cat <(echo '>'"$x") - >>../SNP_marissa/acinet.core16snps.fasta.tmp

a=`expr $a + 1`
done






# export PERL5LIB=/usr/local/lib/perl5/site_perl:${PERL5LIB}; cat acinet.snps.PASS.vcf |vcf-to-tab |grep ^A2_contig1|tr -d '/'|sed -e 's/\.\./\-/g' -e 's/\./\-/g'| cat <(head -n1 <acinet.snps.tab) -  >acinet.chromsnps.tab

 
#export PERL5LIB=/usr/local/lib/perl5/site_perl:${PERL5LIB}; cat acinet.snps.PASS.vcf |vcf-to-tab |grep ^A2_contig1|tr -d '/'|sed -e 's/\.\./\-/g' -e 's/\./\-/g'| cat <(head -n1 <acinet.snps.tab) -  >acinet.chromsnps.tab

 #export PERL5LIB=/usr/local/lib/perl5/site_perl:${PERL5LIB}; cat acinet.snps.PASS.vcf |vcf-to-tab |grep ^A2_contig1|tr -d '/'|sed -e 's/\.\./\-/g' -e 's/\./\-/g' >acinet.chromsnps.nohead.tab


#grep -n -o '-' <acinet.chromsnps.nohead.tab | cut -d : -f 1 | uniq -c | paste - acinet.chromsnps.nohead.tab |sort -g |head -n 1492| cut --complement -f1|cat <(head -n1 acinet.snps.tab) - | cut --complement -f1-2 >acinet.core16snps.tab

