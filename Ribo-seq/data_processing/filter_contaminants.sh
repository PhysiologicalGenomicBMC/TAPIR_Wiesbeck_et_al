#/bin/bash


input_file="trim2_B73_3_1.fastq"

bowtie2-build --threads 4 - f rnacentral_active.fasta bowtie2_index_filter

bowtie2 --threads 4 -N 1 --no-1mm-upfront -q ${input_file} --un=norRNA_B73_3_1.fastq -x bowtie2_index_filter
