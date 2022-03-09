#This code downloads all genomes linked to a particular genome from genbank


for i in $(cat "$1");
    do 
    #You need to remove extra double quotes surrounding the URL
    # write.table( ... , quote = FALSE)    
	wget -cNrv -t 45 -A "*.gz" "$i"/  -P .;
    done

    #mv -f ./ftp.ncbi.nlm.nih.gov/genomes/refseq/bacteria/latest_assembly_versions/"$species"/ \
    #            ./Genbank/"$species"

done
exit

## This is how to get genomes for Roary: 
# retrieve_assemblies -a -v -f gff freundii

    #mkdir ./Genbank/"$species"
#   wget "$genome"assembly_summary.txt 
#   mv ./assembly_summary.txt assembly_summary_"$species".txt 
#   cut -f1,16 <assembly_summary_"$species".txt |tr ' ' '_'\
#            | tr "\t" '_' |grep -v '#' >wget_"$species".txt

#   howmany=$(wc -l <wget_"$species".txt)
#   echo "There are "$howmany" genomes to download"

# Edit this part -A "*.gz" to download genes, contigs or .gbk files 
   
