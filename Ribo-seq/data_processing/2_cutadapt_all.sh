#!/bin/bash 

for i in 1 2 3 4
do
echo $i 
gzip -d B73_${i}_EKDL2500348*-1A_235NFMLT4_L8_1.fq.gz 
gzip -d B73_${i}_EKDL2500348*-1A_235NFMLT4_L8_2.fq.gz

cutadapt --cores 4 --minimum-length 29 -a TCTCCTTGCATAATCACCAACC --discard-untrimmed -o trim_B73_${i}_1.fastq B73_${i}_EKDL2500348*-1A_235NFMLT4_L8_1.fq

cutadapt --cores 4 --minimum-length 29 -a TCTCCTTGCATAATCACCAACC --discard-untrimmed -o trim_B73_${i}_2.fastq B73_${i}_EKDL2500348*-1A_235NFMLT4_L8_2.fq

umi_tools extract -I trim_B73_${i}_1.fastq --bc-pattern='^(?P<umi_1>.{4}).+(?P<umi_2>.{4})$' --extract-method=regex -S extract_B73_${i}_1.fastq --log=umi_extract_1.log

umi_tools extract -I trim_B73_${i}_2.fastq --bc-pattern='^(?P<umi_1>.{4}).+(?P<umi_2>.{4})$' --extract-method=regex -S extract_B73_${i}_2.fastq --log=umi_extract_2.log

cutadapt --cores 4 -g ^T --discard-untrimmed -o trim2_B73_${i}_1.fastq extract_B73_${i}_1.fastq
cutadapt --cores 4 -g ^T --discard-untrimmed -o trim2_B73_${i}_2.fastq extract_B73_{$i}_2.fastq

done


