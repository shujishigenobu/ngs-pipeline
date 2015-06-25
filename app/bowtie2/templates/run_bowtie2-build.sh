REF=Oncorhynchus_mykiss_scaffolds.fa
NAME=`basename $REF .fa`

bowtie2-build $REF $NAME

