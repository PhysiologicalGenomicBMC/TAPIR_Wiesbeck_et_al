#!/bin/bash

for i in 1 2 3 4
do
STAR --runThreadN 4 \
        --genomeDir /store24/project24/ladcol_002/riboseq/reference_genome/STAR_ref_genome_mouse_GRCm39_M35 \
        --readFilesIn extract_B73_${i}_1.fastq\
        --outFilterMultimapNmax 10 \
        --outFileNamePrefix extract_B73_${i}_1.bam \
        --outSAMtype BAM SortedByCoordinate \
        --chimOutType SeparateSAMold \
        --quantMode TranscriptomeSAM GeneCounts

STAR --runThreadN 4 \
        --genomeDir /store24/project24/ladcol_002/riboseq/reference_genome/STAR_ref_genome_mouse_GRCm39_M35 \
        --readFilesIn extract_B73_${i}_2.fastq\
        --outFilterMultimapNmax 10 \
        --outFileNamePrefix extract_B73_${i}_2.bam \
        --outSAMtype BAM SortedByCoordinate \
        --chimOutType SeparateSAMold \
        --quantMode TranscriptomeSAM GeneCounts
done


