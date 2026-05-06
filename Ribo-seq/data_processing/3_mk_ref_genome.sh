#!/bin/bash
#SBATCH --job-name=STAR_index
#SBATCH --mem-per-cpu=120G
#SBATCH --output=/store24/project24/ladcol_002/riboseq/reference_genome/STAR_index_%j.out
#SBATCH --error=/store24/project24/ladcol_002/riboseq/reference_genome/STAR_index_%j.err
#SBATCH --nodes=1

#cd /store24/project24/ladcol_002/Maxi_new_data/reference_genome

eval "$(conda shell.bash hook)"
conda activate STAR
      
############
#echo unzip
#gzip -d *.gz
###########
echo genome generate

cp /store24/project24/ladcol_002/Maxi_new_data/reference_genome/GRCm39.primary_assembly.genome.fa ./reference_genome 
cp /store24/project24/ladcol_002/Maxi_new_data/reference_genome/gencode.vM35.annotation.gtf ./reference_genome


STAR --runMode genomeGenerate --runThreadN 8 --genomeDir /store24/project24/ladcol_002/riboseq/reference_genome/STAR_ref_genome_mouse_GRCm39_M35 \
--genomeFastaFiles ./reference_genome/GRCm39.primary_assembly.genome.fa \
--genomeSAindexNbases 14 --sjdbGTFfile ./reference_genome/gencode.vM35.annotation.gtf  
    
#STAR --runThreadN 8 \
##--runMode genomeGenerate \
#--genomeDir /store24/project24/ladcol_002/riboseq/reference_genome/STAR_ref_genome_mouse_GRCm39_M35 \
#--genomeFastaFiles ./reference_genome/GRCm39.primary_assembly.genome.fa \



