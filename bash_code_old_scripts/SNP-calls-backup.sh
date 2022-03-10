############################################################

#Start all.do

samples=`cat samples.txt`

files=""
for i in $samples
do
  files="$files $i.filtered.vcf"
done

redo-ifchange $files

#End all.do

###########################################################################

#Begin fastq.gz.do

in=`ls ../../$2/*/*/*`

redo-ifchange $in

fastq-dump -Z --gzip $in

# -Z|--stdout                      Output to stdout, all split data become 
#                                   joined into single stream 


#End fastq.gz.do

###########################################################################

#Start bam.do
ref="../NM3352.fasta"
in="../reads/$2.fastq.gz"

redo-ifchange "$ref" "$in"

# Unfortunately, samtools sucks and cant write to stdout or an arbitrary file.
# So we use a temporary file
tmp=$2.bwa.aligning

bwa bwasw -t 24 "$ref" "$in" \
    | samtools view -S -b - \
      | samtools sort - "$tmp"

mv "$tmp.bam" "$3"


# [bwa bwasw] -t INT    Number of threads in the multi-threading mode

# [samtools  view]  :Extract/print all or sub alignments in SAM or BAM format.
#         -b        Output in the BAM formt;       -S        Input  is  in  SAM. 

# [samtools sort]    :Sort  alignments by leftmost coordinates.

#End bam.do

###############################################################################
#Start bai.do;
in=$2

redo-ifchange "$in"

tmp=$2.indexing.tmp
samtools index "$2"

mv "$1" "$3" # this neat flick moves the 

# [samtools index]  :Index  sorted alignment for fast random access. Index file <aln.bam>.bai will be created.

#End bai.do


#############################################################
#Start fai.do;

in="$2"
redo-ifchange "$in"

samtools faidx "$in"
mv "$1" "$3"


# [samtools faidx]   :Index reference sequence in the FASTA format. If  no  region is specified, faidx will index the file and create <ref.fasta>.fai on the disk.

#End fai.do;

#############################################################

#Start default.raw.vcf.do

in="align/$2.bam"
ref="NM3352.fasta"
index="$in.bai"

redo-ifchange "$in" "$ref" "$index" "$ref.fai"

samtools mpileup -u -f "$ref" "$in" | bcftools view -vg -


# [ samtools mpileup ]    :Generate  BCF  or  pileup  for  one or multiple BAM files. Alignment records are grouped by sample identifiers in @RG header lines.

#  -g        Compute genotype likelihoods and output them in BCF format.
#  -u        Similar  to  -g  except  that the output is uncompressed BCF, which is 			preferred for piping.
#  -f FILE    The faidx-indexed reference file in FASTA format.


# [ bcftools view ]  :Convert between BCF and VCF, call variant candidates and  estimate  				allele  frequencies.
#  -g        Call per-sample genotypes at variant sites (force -c)
#  -v        Output variant sites only (force -c)
#End default.raw.vcf.do;

#############################################################
#Start filtered.do;q

in=$2.raw.vcf

redo-ifchange "$in"

# Feel free to modify the parameters
# See 'vcf-annotate -h' for details

filters="+/Q=30"

vcf-annotate "$in" -f "$filters" < "$in"

#Annotates VCF file, adding filters or custom annotations. Requires tabix indexed file with annotations.

# "+/Q=30" means: "leave all other switches as default/ min phred-like quality of 30";

#End filtered.do;
##############################################################
