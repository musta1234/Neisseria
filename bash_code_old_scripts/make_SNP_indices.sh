ref="ABA2_pb"
filters="+/Q=30"

~/bin/java -jar ~/bin/picard.jar NormalizeFasta \
      I="$ref".fasta \
      O="$ref"_norm.fasta
mv "$ref"_norm.fasta "$ref".fasta 
bwa index -a bwtsw "$ref".fasta
samtools faidx $ref.fasta
