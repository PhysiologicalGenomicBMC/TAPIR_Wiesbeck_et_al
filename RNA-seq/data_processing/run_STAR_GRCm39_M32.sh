#!/bin/bash
#SBATCH --job-name=star
#SBATCH --mem-per-cpu=32G
#SBATCH --output=/work/project/ladcol_002/Maxi_new_data/alignments/star%j.out
#SBATCH --error=/work/project/ladcol_002/Maxi_new_data/alignments/star%j.err
#SBATCH --nodes=1
#SBATCH --time=24:00:00

eval "$(conda shell.bash hook)"
conda activate samtools

cd /work/project/ladcol_002/Maxi_new_data/alignments/

#for i in {58..77..1} 
for i in {72..77..1}
do
	echo ${i}
	path="/work/project/ladcol_002/Maxi_new_data/QC/trimmed_fastq/"
 
	gzip -d ${path}trimmed_sample_1440${i}_1_paired.fastq.gz #> ${path}trimmed_23L0016${i}_S*_L001_R1_001_paired.fastq
	gzip -d ${path}trimmed_sample_1440${i}_2_paired.fastq.gz #> ${path}trimmed_23L0016${i}_S*_L001_R2_001_paired.fastq 
	STAR --runThreadN 4 \
	--genomeDir /work/project/goestr_004/MW_SamplesRNASeq/STAR_ref_genome_mouse_GRCm39_M32/STAR_ref_genome_mouse_GRCm39_M32 \
	--readFilesIn ${path}trimmed_sample_1440${i}_1_paired.fastq \
	${path}trimmed_sample_1440${i}_2_paired.fastq\
	--outFilterMultimapNmax 10 \
	--outFileNamePrefix trimmed_sample_1440${i}.bam \
	--outSAMtype BAM SortedByCoordinate \
	--chimOutType SeparateSAMold \
	--quantMode TranscriptomeSAM GeneCounts

	gzip -9 ${path}trimmed_sample_1440${i}_1_paired.fastq
	gzip -9 ${path}trimmed_sample_1440${i}_2_paired.fastq
	
done

