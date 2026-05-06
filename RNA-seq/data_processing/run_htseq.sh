#!/bin/bash
#SBATCH --job-name=rmdup
#SBATCH --mem-per-cpu=48G
#SBATCH --output=/store24/project24/ladcol_002/Maxi_new_data/count_matrices/htseq%j.out
#SBATCH --error=/store24/project24/ladcol_002/Maxi_new_data/count_matrices/htseq%j.err
#SBATCH --nodes=1
#SBATCH --time=6-00:00:00

eval "$(conda shell.bash hook)"
conda activate samtools

cd /store24/project24/ladcol_002/Maxi_new_data/count_matrices


#for i in {58..69..1}
#do
#	echo ${i}
#	htseq-count --format=bam --order=pos --stranded=no --a=30 ./../remove_duplicates/trimmed_sample_1440${i}_rmdup.bam /store24/project24/ladcol_002/Maxi_new_data/reference_genome/gencode.vM35.annotation.gff3  > out_ct_mtx_${i}.txt

#done

for i in {72..87..1}
do
        echo ${i}
        htseq-count --format=bam --order=pos --stranded=no --a=30 ./../remove_duplicates/*${i}_rmdup.bam /store24/project24/ladcol_002/Maxi_new_data/reference_genome/gencode.vM35.annotation.gff3  > out_ct_mtx_${i}.txt

done
