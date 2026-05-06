#!/bin/bash 

for i in 1 2 3 4
do
fastqc --outdir fastqc_bam *B73_${i}_m1.bamAligned.sortedByCoord.out.bam
fastqc --outdir fastqc_bam *B73_${i}_2.bamAligned.sortedByCoord.out.bam

#qualimap bamqc -bam *B73_${i}_1.bamAligned.sortedByCoord.out.bam   -outdir qualimapi_bamqc -outfile B73_${i}_1.pdf --java-mem-size=4G

qualimap rnaseq -bam *B73_${i}_1.bamAligned.sortedByCoord.out.bam -gtf ./reference_genome/gencode.vM35.annotation.gtf  -outdir qualimap -outfile B73_${i}_1.pdf --java-mem-size=4G

done

