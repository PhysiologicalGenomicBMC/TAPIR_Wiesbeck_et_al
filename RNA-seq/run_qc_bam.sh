#!/bin/bash
#SBATCH --job-name=fastqc
#SBATCH --mem-per-cpu=96G
#SBATCH --output=/work/project/ladcol_002/Maxi_new_data/QC/fastqc%j.out
#SBATCH --output=/work/project/ladcol_002/Maxi_new_data/QC/fastqc%j.err
#SBATCH --nodes=1
#SBATCH --time=00:00:00

eval "$(conda shell.bash hook)"
conda activate samtools

cd /work/project/ladcol_002/Maxi_new_data/QC/
mkdir fastqc_bam
cd fastqc_bam

for i in {58..77..1}
do
	echo ${i}
	path="/work/project/ladcol_002/Maxi_new_data/alignments/"
	fastqc ${path}trimmed_sample_1440${i}.bamAligned.sortedByCoord.out.bam -o /work/project/ladcol_002/Maxi_new_data/QC/fastqc_bam

done

multiqc .


