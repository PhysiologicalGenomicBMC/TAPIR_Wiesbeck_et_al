#!/bin/bash
#SBATCH --job-name=trimo
#SBATCH --mem-per-cpu=32G
#SBATCH --output=/work/project/ladcol_002/Maxi_new_data/QC/fastqc%j.out
#SBATCH --error=/work/project/ladcol_002/Maxi_new_data/QC/fastqc%j.err
#SBATCH --nodes=1
#SBATCH --time=00:00:00

eval "$(conda shell.bash hook)"
conda activate samtools

# nextera sequence source : 
# https://github.com/timflutre/trimmomatic/blob/master/adapters/NexteraPE-PE.fa
cd /work/project/ladcol_002/Maxi_new_data/QC

#mkdir trimmed_fastq
#mkdir trimmed_fastqc

cd ./trimmed_fastq

for i in {70..77..1}
do
	echo ${i}
	path="/work/project/ladcol_002/Maxi_new_data/240617_P2023-036-DFG-B11/"
	trimmomatic PE -phred33 ${path}*${i}_1.fq.gz \
	${path}*${i}_2.fq.gz \
	trimmed_sample_1440${i}_1_paired.fastq.gz \
	trimmed_sample_1440${i}_1_unpaired.fastq.gz \
	trimmed_sample_1440${i}_2_paired.fastq.gz \
        trimmed_sample_1440${i}_2_unpaired.fastq.gz \
	ILLUMINACLIP:NexteraPE-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:20

	fastqc trimmed_sample_1440${i}_1_paired.fastq.gz \
	trimmed_sample_1440${i}_1_unpaired.fastq.gz \
	trimmed_sample_1440${i}_2_paired.fastq.gz \
        trimmed_sample_1440${i}_2_unpaired.fastq.gz \
	-o /work/project/ladcol_002/Maxi_new_data/QC/trimmed_fastqc
done

cd /work/project/ladcol_002/Maxi_new_data/QC/trimmed_fastqc
multiqc .


