#!/bin/bash
#SBATCH --job-name=qualimap
#SBATCH --mem-per-cpu=32G
#SBATCH --output=/work/project/ladcol_002/Maxi_new_data/QC/qualimap%j.out
#SBATCH --error=/work/project/ladcol_002/Maxi_new_data/QC/qualimap%j.err
#SBATCH --nodes=1
#SBATCH --time=00:00:00

eval "$(conda shell.bash hook)"
conda activate samtools

cd /work/project/ladcol_002/Maxi_new_data/QC/qualimap_v2.3

for i in {58..77..1}
do 

	echo ${i}

	./qualimap rnaseq --bam /work/project/ladcol_002/Maxi_new_data/alignments/trimmed_sample_1440${i}.bamAligned.sortedByCoord.out.bam -gtf /work/project/ladcol_002/Maxi_new_data/reference_genome/gencode.vM35.annotation.gtf -outdir /work/project/ladcol_002/Maxi_new_data/QC/bam_qualimap -outfile trimmed_sample_1440${i}.pdf -outformat PDF --java-mem-size=16G

done
