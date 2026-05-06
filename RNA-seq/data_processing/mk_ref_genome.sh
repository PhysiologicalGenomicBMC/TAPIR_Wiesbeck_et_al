#!/bin/bash
#SBATCH --job-name=STAR_index
#SBATCH --mem-per-cpu=120G
#SBATCH --output=/work/project/ladcol_002/Maxi_new_data/reference_genome/STAR_index_%j.out
#SBATCH --error=/work/project/ladcol_002/Maxi_new_data/reference_genome/STAR_index_%j.err
#SBATCH --nodes=1

cd /work/project/ladcol_002/Maxi_new_data/reference_genome

eval "$(conda shell.bash hook)"
conda activate SS3_processing

############
echo unzip
gzip -d *.gz
###########
echo genome generate

STAR --runThreadN 8 \
--runMode genomeGenerate \
--genomeDir /work/project/ladcol_002/Maxi_new_data/reference_genome/STAR_ref_genome_mouse_GRCm39_M35 \
--genomeFastaFiles /work/project/ladcol_002/Maxi_new_data/reference_genome/GRCm39.primary_assembly.genome.fa \
--sjdbGTFfile /work/project/ladcol_002/Maxi_new_data/reference_genome/gencode.vM35.annotation.gtf \
--sjdbOverhang 49 \
--limitGenomeGenerateRAM 114499686325 

###########
echo gzip
gzip -9 *.gtf
gzip -9 *.fa
